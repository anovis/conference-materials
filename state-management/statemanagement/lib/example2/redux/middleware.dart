import 'package:statemanagement/example2/redux/app_state.dart';
import 'package:redux/redux.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {


  @override
  Future call(Store<AppState> store, action, NextDispatcher next) async {
  
    next(action);
  }

}
