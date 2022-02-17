import 'package:expressions/expressions.dart';
import 'package:f_calculator/models/operation_model.dart';

class CalculatorModel {

  static CalculatorModel? _instance;
  final _operations = [];

  CalculatorModel._internal();

  static getInstance() {
    if(_instance == null) {
      _instance = CalculatorModel._internal();
    }
    return _instance;
  }

  String equals(String expressionRaw) {
    final expression = Expression.parse(expressionRaw);
    return ExpressionEvaluator().eval(expression, {}).toString();
  }

  void save(OperationModel operation) => _operations.add(operation);

  void clear() {
    _operations.clear();
  }

  OperationModel getLast() => _operations.last;

  List getAll() => _operations;

}