import 'dart:math';

enum Result { overweight, underweight, normal }

class CalculatorBrain {
  final int height;
  final int weight;

  double get bmi {
    double _bmi = weight / pow(height / 100, 2);
    String strBmi = _bmi.toStringAsFixed(2);
    return double.parse(strBmi);
  }

  String get result {
    switch (_result) {
      case (Result.overweight):
        return 'Overweight';
      case (Result.normal):
        return 'Normal';
      case (Result.underweight):
        return 'Underweight';
    }
  }

  String get message {
    switch (_result) {
      case (Result.overweight):
        return 'You have a higher than normal body weight. Try to exercise';
      case (Result.normal):
        return 'You have normal body weight. Keep it going!';
      case (Result.underweight):
        return 'You have a lower than normal body weight. Try to consume the required number of calories per day';
    }
  }

  Result get _result {
    if (bmi >= 25) {
      return Result.overweight;
    } else if (bmi > 18.5) {
      return Result.normal;
    } else {
      return Result.underweight;
    }
  }

  CalculatorBrain(this.height, this.weight);
}
