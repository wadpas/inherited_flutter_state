import 'package:flutter/material.dart';
import 'package:inherited_flutter_state/opacity_inherited_notifier/slider_state.dart';

class SliderInheritedNotifier extends InheritedNotifier<SliderState> {
  const SliderInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
          ?.notifier
          ?.value ??
      0;
}
