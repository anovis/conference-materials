import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:statemanagement/example2/common/catalog.dart';
import 'package:statemanagement/example2/common/item.dart';
import 'package:statemanagement/example2/common/review.dart';
import 'package:statemanagement/example2/redux/actions.dart';
import 'package:statemanagement/example2/redux/app_state.dart';


class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          StoreConnector<AppState,Catalog>(
            converter: (store) {
            return store.state.catalog;
          }, builder: (context, catalog) {
            return  StoreConnector<AppState,List<Review>>(
              converter: (store) {
              return store.state.reviews;
            }, builder: (context, reviews) {
              return catalog == null ? const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _MyListItem(
                      catalog.getByPosition(index),
                      reviews[index]
                    ),
                  ),
                );
              }
          );
          }
          )
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key key, @required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
      final theme = Theme.of(context);
      return StoreConnector<AppState,List<dynamic>>(
            converter: (store) {
            return [store.state.cart.items.contains(item),(item) => store.dispatch(CartItemAdded(item))];
          }, builder: (context, combined) {
            return  FlatButton(
            onPressed: combined[0]
                ? null
                : () => combined[1](item),
            splashColor: theme.primaryColor,
            
            child: combined[0]
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          );
      },
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).pushNamed('/cart'),
        ),
      ],
    );
  }
}

class _MyListItem extends StatefulWidget {
  _MyListItem(this.item,this.review,{Key key}) : super(key: key);
  final Item item;
  final Review review;

  @override
  _MyListItemState createState() => _MyListItemState();
}


class _MyListItemState extends State<_MyListItem> {
  
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(children:[LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: ColoredBox(color: widget.item.color)),
            const SizedBox(width: 24),
            GestureDetector(
              onTap: (){
                _handleTap();
              },
              child: Text(widget.item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: widget.item),
          ],
        ),
      ),
      _active? LimitedBox(
        maxHeight: 48,
        child: Text('Review:   ' + widget.review.review, style: textTheme),
      ): Container()
      ]
      )
    );
  }
}