import 'package:flutter/material.dart';
import 'package:inherited_flutter_state/main.dart';
import 'slider_inherited_notifier.dart';
import 'slider_state.dart';

class OpacityWidget extends StatelessWidget {
  const OpacityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderInheritedNotifier(
      notifier: sliderData,
      child: Builder(
        builder: (context) {
          return Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
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
            ),
          );
        },
      ),
    );
  }
}
