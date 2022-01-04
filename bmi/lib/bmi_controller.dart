import 'dart:math';

class BMIController {
  final int height;
  final int weight;

  BMIController({
    required this.height,
    required this.weight,
  });

  double? _bmi;
  double get bmi {
    return _bmi ?? (_bmi = weight / pow(height / 100, 2));
  }

  String get bmiAsText => bmi.toStringAsFixed(1);

  String get result {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String get interpretation {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
