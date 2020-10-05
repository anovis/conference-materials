import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:statemanagement/example1/mvc/mvc_controller.dart';

class MVCWidget extends StatefulWidget {
    MVCWidget({
    Key key,
    @required this.panelIndex,
  }) : super(key: key);

  final int panelIndex;

  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<MVCWidget> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
            color: Colors.black,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Sparkline(
                      data: MVCCon.panel(widget.panelIndex).stats,
                    ),
                  )
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:RaisedButton(
                      child: Text(MVCCon.panel(widget.panelIndex).isTimerOn ? 'Stop' : 'Start'),
                      onPressed: () =>
                        MVCCon.togglePanel(widget.panelIndex)     
                    )
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}