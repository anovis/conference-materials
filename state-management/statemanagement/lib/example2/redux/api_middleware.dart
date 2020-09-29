import 'package:statemanagement/example2/common/api_client.dart';
import 'package:statemanagement/example2/redux/app_state.dart';
import 'package:statemanagement/example2/redux/actions.dart';
import 'package:redux/redux.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  final ApiClient apiClient;

  ApiMiddleware(this.apiClient);

  @override
  Future call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchCartItemsAction) {
      return _fetchCartItems(store, action);
    }

    next(action);
  }

  Future _fetchCartItems(
      Store<AppState> store, FetchCartItemsAction action) async {
    action.callback(true);
    var cartItems = await apiClient.fetchCartItems();
    store.dispatch(ItemLoadedAction(cartItems));
    action.callback(false);
  }
}
