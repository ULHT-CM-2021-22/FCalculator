import 'package:f_calculator/models/calculator_model.dart';
import 'package:flutter/material.dart';


class HistoricScreen extends StatelessWidget {
  final String title;

  const HistoricScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final operations = CalculatorModel.getInstance().getAll();
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: ListView.builder(
        itemCount: operations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(operations[index].toString()),
          );
        },
      ),
    );
  }
}
