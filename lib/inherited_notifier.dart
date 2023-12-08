import 'package:flutter/material.dart';

class SliderData extends ChangeNotifier {
  double _value = 0.5;
  double get value => _value;
  set value(double newValue) {
    if (newValue != value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

final sliderData = SliderData();

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
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

class NotifierInherited extends StatelessWidget {
  const NotifierInherited({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderInheritedNotifier(
      notifier: sliderData,
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('InheritedNotifier'),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Opacity(
                            opacity: SliderInheritedNotifier.of(context),
                            child: Container(
                              color: Colors.green,
                            ),
                          ),
                          Opacity(
                            opacity: SliderInheritedNotifier.of(context),
                            child: Container(
                              color: Colors.yellow,
                            ),
                          )
                        ].expandEqually().toList(),
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Opacity'),
                        Expanded(
                          child: Slider(
                            activeColor: Colors.blueAccent,
                            value: SliderInheritedNotifier.of(context),
                            onChanged: (value) {
                              sliderData.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (w) => Expanded(child: w),
      );
}
