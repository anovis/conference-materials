import 'package:flutter/material.dart';
import 'package:statemanagement/example1/bloc/bloc_application.dart';
import 'package:statemanagement/example1/redux/redux_application.dart';
import 'package:statemanagement/example2/redux/redux_application.dart';


void main(){

  // mainExample1Bloc();
  // mainExample1Redux();

  mainExample2Redux();
}

void mainExample1Redux(){
  runApp(Example1ReduxApplication());
}

void mainExample1Bloc(){
  runApp(Example1BlocApplication());
}

void mainExample2Redux() async{
  runExample2ReduxApplication();
}