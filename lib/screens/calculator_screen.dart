import 'package:f_calculator/blocs/calculator_bloc.dart';
import 'package:f_calculator/widgets/display.dart';
import 'package:f_calculator/widgets/keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final String title;

  CalculatorScreen({Key? key, required this.title}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorScreen> {
  final bloc = CalculatorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          StreamBuilder<String>(
            initialData: "0",
            stream: bloc.output,
            builder: (BuildContext context, snapshot) => Display(
              content: snapshot.data.toString(),
            ),
          ),
          Keyboard(bloc),
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
