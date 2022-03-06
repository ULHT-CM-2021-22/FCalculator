import 'package:equatable/equatable.dart';

class OperationModel extends Equatable {

  final String expression;
  final String result;

  OperationModel(this.expression, this.result);

  @override
  List<Object?> get props => [expression, result];

  @override
  String toString() {
    return "$expression = $result";
  }

}