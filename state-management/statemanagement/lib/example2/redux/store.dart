import 'package:statemanagement/example2/common/api_client.dart';
import 'package:statemanagement/example2/redux/app_state.dart';
import 'package:statemanagement/example2/redux/api_middleware.dart';
import 'package:statemanagement/example2/redux/middleware.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'reducers.dart';

Future<Store<AppState>> createReduxStore() async {
  final apiClient = ApiClient();
  final sharedPreferences = await SharedPreferences.getInstance();

  return Store<AppState>(
    appStateReducers,
    initialState: AppState.empty(),
    middleware: [
      ApiMiddleware(apiClient),
      PrefsMiddleware(sharedPreferences),
    ]
  );
}
