import 'package:statemanagement/example2/redux/app_state.dart';
import 'package:statemanagement/example2/redux/middleware.dart';
import 'package:redux/redux.dart';

import 'reducers.dart';

Future<Store<AppState>> createReduxStore() async {

  return Store<AppState>(
    appStateReducers,
    initialState: AppState.empty(),
    middleware: [
      ApiMiddleware(),
    ]
  );
}
