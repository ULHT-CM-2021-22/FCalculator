import 'package:f_calculator/models/calculator_model.dart';
import 'package:f_calculator/models/operation_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test("soma", () {
    final model = CalculatorModel.getInstance();
    final result = model.equals("2+2");
    expect(result, "4");
  });

  test("regista operações", () {
    final op1 = OperationModel("1+1", "2");
    final op2 = OperationModel("5+5", "10");
    final model = CalculatorModel.getInstance();
    model.clear();
    model.save(op1);
    model.save(op2);
    expect(model.getAll()[0], op1);
    expect(model.getAll()[1], op2);
    expect(model.getAll().length, 2);
  });

}
