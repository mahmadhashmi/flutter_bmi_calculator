import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  double? _bmi;

  CalculatorBrain({required this.height, required this.weight});

  String calculatedResult() {
    _bmi = weight/pow(height/100, 2);
    return _bmi?.toStringAsFixed(1) ?? '0.0'; // Use null-aware operators
  }

  String getResult() {
    if (_bmi == null) {
      return "BMI not calculated";
    } else if (_bmi! >= 25) {
      return "Overweight";
    } else if (_bmi! > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi == null) {
      return "BMI not calculated";
    } else if (_bmi! >= 25) {
      return "You have a higher than normal body weight. Try to exercise more!";
    } else if (_bmi! > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have lower than normal body weight. You can eat a bit more!";
    }
  }
}
