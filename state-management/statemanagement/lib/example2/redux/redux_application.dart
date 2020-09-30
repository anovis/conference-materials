import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:statemanagement/example2/redux/actions.dart';
import 'package:statemanagement/example2/redux/my_cart.dart';
import 'package:statemanagement/example2/redux/my_catalog.dart';
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
        initialRoute: '/',
        routes: {
          '/': (context)=> StoreBuilder<AppState>(
            // onInit: (store) => store.dispatch(FetchItemsAction()),
            builder: (context, store) => MyCatalog()),
          '/cart': (context) => MyCart(),
        },
        
      ),
    );
  }
}

