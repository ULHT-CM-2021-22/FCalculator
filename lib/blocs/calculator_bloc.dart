import "dart:async";
import 'package:f_calculator/models/operation_model.dart';
import 'package:f_calculator/models/calculator_model.dart';

class CalculatorBloc {

  String _displayContent = "0";
  CalculatorModel _model = CalculatorModel.getInstance();

  StreamController<String> _controller = StreamController();

  Sink get input => _controller.sink;

  Stream<String> get output => _controller.stream;

  void onReceiveSymbol(String symbol) {
    final newContent = _displayContent == "0" ? symbol : _displayContent + symbol;
    _updateDisplay(newContent);
  }

  void onBackspace() {
    final displayContentSize = _displayContent.length - 1;
    if(displayContentSize > 0) {
      _updateDisplay(_displayContent.substring(0, _displayContent.length - 1));
    } else {
      _updateDisplay("0");
    }
  }

  void onClear() {
    _updateDisplay("0");
  }

  void onEquals() {
    final newContent = _model.equals(_displayContent);
    _model.save(OperationModel(_displayContent, newContent));
    _updateDisplay(newContent);
  }

  void onGetLastOperation() {
      final lastOperation = _model.getLast();
      _updateDisplay(lastOperation.expression);
  }

  void _updateDisplay(String newDisplayContent) {
    _displayContent = newDisplayContent;
    _controller.sink.add(newDisplayContent);
  }

  void dispose() => _controller.close();

}