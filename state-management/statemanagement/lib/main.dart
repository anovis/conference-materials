import 'package:flutter/material.dart';
import 'package:statemanagement/example1/bloc/bloc_application.dart';
import 'package:statemanagement/example2/bloc/bloc_application.dart';
import 'package:statemanagement/example1/redux/redux_application.dart';
import 'package:statemanagement/example2/redux/redux_application.dart';
import 'package:statemanagement/example1/mvc/mvc_application.dart';


void main(){

  // mainExample1Bloc();
  // mainExample1Redux();
  mainExample1MVC();

  // mainExample2Redux();
  // mainExample2Bloc();
}

void mainExample1Redux(){
  runApp(Example1ReduxApplication());
}

void mainExample1Bloc(){
  runApp(Example1BlocApplication());
}

void mainExample1MVC(){
  runApp(Example1MVCApplication());
}

void mainExample2Bloc() {
  runApp(Example2BlocApplication());
}

void mainExample2Redux() {
  runExample2ReduxApplication();
}