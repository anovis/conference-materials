import 'package:flutter/material.dart';
import 'package:statemanagement/example1/bloc/bloc_page.dart';

class Example1BlocApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statemanagement_Comparison',
      home: BlocPage(),
    );
  }
}