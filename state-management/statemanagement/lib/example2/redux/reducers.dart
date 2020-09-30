import 'package:statemanagement/example2/common/cart.dart';
import 'package:statemanagement/example2/redux/app_state.dart';
import 'package:statemanagement/example2/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is CartItemAdded) {
    return addItem(state, action);
  }

  return state;
}

AppState addItem(AppState state, CartItemAdded action) {
  return AppState(state.catalog,Cart(items: List.from(state.cart.items)..add(action.item)));
}