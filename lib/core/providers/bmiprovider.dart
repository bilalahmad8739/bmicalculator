import 'package:bmicalculator_provider/core/services/calculation.dart';
import 'package:bmicalculator_provider/core/services/toastutilise.dart';
import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  static double? _result;

  get result => _result;
  static String? status;

  void showUtilise(String message) {
    ToastUtilse.showToast(message);
  }

  cal() {
    _result = BmiCalculation.calculation(heightcontroller, weightcontroller);
    // print("value is :${_result}");

    if (_result! <= 7) {
      status = ('underweight');
    } else if (_result! <= 25) {
      status = ('normal');
    } else if (_result! <= 35) {
      status = ('overweight');
    } else {
      status = ('obese');
    }

    showUtilise('Your BMI is :$_result\n' + 'Your Status is :$status');

    notifyListeners();
  }

  set(double value) {
    _result = value;
    notifyListeners();
  }
}
