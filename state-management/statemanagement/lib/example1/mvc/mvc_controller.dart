import 'package:mvc_pattern/mvc_pattern.dart';
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
    model.panels.add(PanelState());
    togglePanel(model.panels.length-1);
  }

  void init(){
    togglePanel(0);
  }

}