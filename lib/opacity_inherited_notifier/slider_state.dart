import 'package:flutter/material.dart';

class SliderState extends ChangeNotifier {
  double _value = 0.5;
  double get value => _value;
  set value(double newValue) {
    if (newValue != value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

final sliderData = SliderState();
