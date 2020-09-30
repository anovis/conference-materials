import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/example2/bloc/cart/bloc/cart_bloc.dart';
import 'package:statemanagement/example2/bloc/catalog/bloc/catalog_bloc.dart';
import 'package:statemanagement/example2/bloc/review/bloc/review_bloc.dart';
import 'package:statemanagement/example2/common/item.dart';
import 'package:statemanagement/example2/common/review.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, catalogState) {
            return BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, reviewState) {
              if (catalogState is CatalogLoading || reviewState is ReviewLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (catalogState is CatalogLoaded && reviewState is ReviewLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _MyListItem(
                      catalogState.catalog.getByPosition(index),
                      reviewState.reviews[index]
                    ),
                  ),
                );
              }
              return const Text('Something went wrong!');
            },
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
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return FlatButton(
            onPressed: state.cart.items.contains(item)
                ? null
                : () => context.bloc<CartBloc>().add(CartItemAdded(item)),
            splashColor: theme.primaryColor,
            child: state.cart.items.contains(item)
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          );
        }
        return const Text('Something went wrong!');
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
