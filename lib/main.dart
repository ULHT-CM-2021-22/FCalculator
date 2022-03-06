import 'package:f_calculator/screens/calculator_screen.dart';
import 'package:f_calculator/screens/history_screen.dart';
import 'package:f_calculator/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(
        screens: [
          CalculatorScreen(title: 'Calculadora'),
          HistoricScreen(title: 'Histórico')
        ],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculadora"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Histórico"
          ),
        ],
      ),
    );
  }
}