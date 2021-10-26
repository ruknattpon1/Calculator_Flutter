import 'package:calculator_project/calculator_screen/calculator_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Color(0xFF22252D),
            scaffoldBackgroundColor: Color(0xFF22252D)),
        home: calculatorScreen());
  }
}
