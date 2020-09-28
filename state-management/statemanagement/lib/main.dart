import 'package:flutter/material.dart';
import 'package:statemanagement/example1/bloc/bloc_application.dart';
import 'package:statemanagement/example1/redux/redux_application.dart';
// import 'package:redux_scopedmodel_bloc/case1/scoped_model/scoped_model_application.dart';
// import 'package:statemanagement/example1/bloc/bloc_application.dart';
// import 'package:statemanagement/example1/redux/redux_application.dart';
// import 'package:statemanagement/example1/scoped_model/scoped_model_application.dart';

void main(){
//  mainCase1Redux();
//  mainCase1ScopedModel();
//  mainCase1Bloc();
  mainExample1Bloc();
//  mainCase2ScopedModel();
  // mainExample1Redux();
}

void mainExample1Redux(){
  runApp(Example1ReduxApplication());
}

// void mainCase1ScopedModel(){
//   runApp(Case1ScopedModelApplication());
// }

void mainExample1Bloc(){
  runApp(Example1BlocApplication());
}

// void mainCase2Bloc(){
//   runApp(Case2BlocApplication());
// }

// void mainCase2ScopedModel(){
//   runApp(Case2ScopedModelApplication());
// }

// void mainCase2Redux(){
//   runApp(Example1ReduxApplication());
// }