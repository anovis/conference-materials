import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:statemanagement/example2/common/catalog.dart';
import 'package:statemanagement/example2/common/item.dart';
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
            return catalog == null ? const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _MyListItem(
                      catalog.getByPosition(index),
                    ),
                  ),
                );
              }
          ),
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
                : () => combined[1],
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

class _MyListItem extends StatelessWidget {
  const _MyListItem(this.item, {Key key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: ColoredBox(color: item.color)),
            const SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme)),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
