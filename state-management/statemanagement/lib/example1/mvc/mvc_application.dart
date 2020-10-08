import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:statemanagement/example1/mvc/mvc_controller.dart';
import 'package:statemanagement/example1/mvc/mvc_page.dart';



class Example1MVCApplication extends AppMVC {
  Example1MVCApplication({Key key}) : super(con: _controller, key: key);

  static final MVCCon _controller = MVCCon();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statemanagement_Comparison',
      home: MVCPage(),
    );
  }
}