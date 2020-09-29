import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:statemanagement/example2/redux/actions.dart';
import 'package:statemanagement/example2/redux/add_item_dialog.dart';
import 'package:statemanagement/example2/redux/bottom_cart_bar.dart';
import 'package:statemanagement/example2/redux/shopping_list.dart';
import 'package:statemanagement/example2/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:statemanagement/example2/redux/store.dart';


void runExample2ReduxApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  final store = await createReduxStore();
  runApp(Example2ReduxApplication(store));
}

class Example2ReduxApplication extends StatelessWidget {
  final Store<AppState> store;

  Example2ReduxApplication(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'ShoppingList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(FetchItemsAction()),
            builder: (context, store) => ShoppingCart(store)),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final Store<AppState> store;

  ShoppingCart(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingList'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
      bottomSheet: BottomCartBar(),
    );
  }

  void _openAddItemDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AddItemDialog());
  }
}
