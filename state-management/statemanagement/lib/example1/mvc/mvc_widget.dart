import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:statemanagement/example1/common/async_data_fetcher.dart';
import 'package:statemanagement/example1/mvc/mvc_controller.dart';
import 'package:statemanagement/example1/mvc/mvc_model.dart';

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
  void initState(){
    super.initState();

    void _startTimer(int index) {
      Timer(Duration(seconds: 1), () async {
        // Fetch a new value (pseudo asynchronously)
        PanelState panel = MVCCon.panel(index);

        double newValue = await AsyncDataFetcher.getValue();
        panel.addStats(newValue);
        // Re-arm the timer if still on
        setState(() {
        });
        if (panel.isTimerOn){
          _startTimer(index);
        }
      });
    }
      _startTimer(widget.panelIndex);

  }


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
                      data: MVCCon.panel(widget.panelIndex).stats.length==0 ? [0.0]:MVCCon.panel(widget.panelIndex).stats ,
                    ),
                  )
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:RaisedButton(
                      child: Text(MVCCon.panel(widget.panelIndex).isTimerOn ? 'Stop' : 'Start'),
                      onPressed: (){
                        MVCCon.togglePanel(widget.panelIndex);
                        setState((){});
                      }
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