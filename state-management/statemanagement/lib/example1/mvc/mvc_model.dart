const int _kMaxSamples = 15;

class MVCModel {
  final List<PanelState> panels = [PanelState()];

  int get panelsCount => panels.length;
  List<PanelState> get panelsList => List.from(panels);
  
}

class PanelState {
  List<double> stats = <double>[];
  bool isTimerOn = false;

  void addStats(double value){
    stats.add(value);

    int length = stats.length;
    int toSkip = (length - _kMaxSamples).clamp(0, length);

    stats = stats.skip(toSkip).take(_kMaxSamples).toList();
  }

}

// class ApplicationState {

//   ApplicationState({
//     List<PanelState> panels,
//   }): this.panels = panels == null ? [] : panels;

//   int get panelsCount => panels.length;
//   List<PanelState> get panelsList => List.from(panels);

//   ApplicationState copyWith(List<PanelState> panels){
//     return ApplicationState(panels: panels);
//   }

//   factory ApplicationState.initial(){
//     return ApplicationState(
//       panels: [PanelState()],
//     );
//   }
// }