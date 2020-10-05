import 'dart:async';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:statemanagement/example1/common/async_data_fetcher.dart';
import 'package:statemanagement/example1/mvc/mvc_model.dart';

class MVCCon extends AppConMVC {
  factory MVCCon() {
    return _this ??= MVCCon._();
  }
  static MVCCon _this;

  MVCCon._();

  /// Allow for easy access to 'the Controller' throughout the application.
  static MVCCon get con => _this;

  static final model = MVCModel();

  static PanelState panel(int index) => model.panels[index];

  static void togglePanel(int index){
    PanelState panel = model.panels[index];
    panel.isTimerOn = !panel.isTimerOn;
  }

  void addPanel(){
    model.panelsList.add(PanelState());
  }

  void init(){
    togglePanel(0);
    _startTimer(0);
  }

  static void _startTimer(int index) {
    Timer(Duration(seconds: 1), () async {
      // Fetch a new value (pseudo asynchronously)
      PanelState panel = model.panels[index];

      double newValue = await AsyncDataFetcher.getValue();
      panel.addStats(newValue);
      
      // Re-arm the timer if still on
      if (panel.isTimerOn){
        _startTimer(index);
      }
    });
  }

}