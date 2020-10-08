import 'package:flutter/material.dart';
import 'package:statemanagement/example1/mvc/mvc_controller.dart';
import 'package:statemanagement/example1/mvc/mvc_widget.dart';

class MVCPage extends StatefulWidget {
  @override
  _MVCPageState createState() => _MVCPageState();
}

class _MVCPageState extends State<MVCPage> {
  List<MVCWidget> _widgets = <MVCWidget>[];
  final MVCCon _con = MVCCon.con;

  @override
  void initState(){
    super.initState();
    _widgets = <MVCWidget>[MVCWidget(panelIndex: 0,)];
    _con.init();
  }

  @override
  void dispose(){
    _widgets.clear();
    _widgets = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC version'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Add...'),
            onPressed: (){
              _con.addPanel();
              _widgets.add(MVCWidget(panelIndex: _widgets.length));
              setState((){});
            },
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          itemCount: _widgets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
            return _widgets[index];
          },
        ),
      ),
    );
  }
}