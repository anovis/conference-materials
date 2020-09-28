import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:statemanagement/example1/redux/application_states.dart';
import 'package:statemanagement/example1/redux/redux_page.dart';
import 'package:statemanagement/example1/redux/reducers.dart';
import 'package:statemanagement/example1/redux/middleware.dart';

class Example1ReduxApplication extends StatefulWidget {
  @override
  _Example1ReduxApplicationState createState() => _Example1ReduxApplicationState();
}

class _Example1ReduxApplicationState extends State<Example1ReduxApplication> {
  Store<ApplicationState> applicationStore;

  @override
  void initState(){
    super.initState();
    applicationStore = Store<ApplicationState>(
      case2Reducer,
      initialState: ApplicationState.initial(),
      middleware: <Middleware<ApplicationState>>[
        tickerMiddleware,
      ],
    );
  }

  @override
  void dispose(){
    applicationStore?.teardown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ApplicationState>(
      store: applicationStore,
      child: MaterialApp(
        title: 'ReduxScopedModelBloc_Comparison',
        home: ReduxPage(),
      ),
    );
  }
}