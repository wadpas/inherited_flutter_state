import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inherited_flutter_state/colors_inherited_model/color_widget.dart';
import 'package:inherited_flutter_state/colors_inherited_model/available_colors_widget.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({super.key});

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  var color1 = Colors.cyan;
  var color2 = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return AvailableColorsWidget(
      color1: color1,
      color2: color2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('InheritedModel'),
          ColorWidget(
            colorNumber: AvailableColors.one,
            setColor: () => setState(() {
              color1 = colors.getRandomElement();
            }),
          ),
          ColorWidget(
            colorNumber: AvailableColors.two,
            setColor: () => setState(
              () {
                color2 = colors.getRandomElement();
              },
            ),
          ),
        ],
      ),
    );
  }
}

final colors = [
  Colors.amber,
  Colors.blue,
  Colors.red,
  Colors.brown,
  Colors.indigo,
  Colors.pink,
  Colors.lime
];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(
        Random().nextInt(length),
      );
}
