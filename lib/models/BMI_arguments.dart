import 'package:flutter/foundation.dart';

class BMIArguments {
  BMIArguments({
    @required this.bmi,
    @required this.interpretation,
    @required this.bmiResult,
  });
  final String bmi;
  final String bmiResult;
  final String interpretation;
}
