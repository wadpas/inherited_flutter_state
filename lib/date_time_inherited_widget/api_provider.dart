import 'package:flutter/material.dart';

class ApiProvider {
  String? dateTime;
  bool isLoading = false;

  Future<String> getDateAndTime() {
    return Future.delayed(
      Durations.long4,
      () => DateTime.now().toIso8601String(),
    ).then((value) {
      dateTime = value;
      return value;
    });
  }
}
