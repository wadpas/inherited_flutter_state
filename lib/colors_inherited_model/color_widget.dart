import 'package:flutter/material.dart';
import 'package:inherited_state_flutter/colors_inherited_model/available_colors_widget.dart';

class ColorWidget extends StatelessWidget {
  final AvailableColors colorNumber;
  final void Function() setColor;

  const ColorWidget({
    super.key,
    required this.colorNumber,
    required this.setColor,
  });

  @override
  Widget build(BuildContext context) {
    final provider = AvailableColorsWidget.of(context, colorNumber);

    return GestureDetector(
      onTap: setColor,
      child: Container(
        width: double.infinity,
        height: 100,
        color: colorNumber == AvailableColors.one
            ? provider.color1
            : provider.color2,
        child: const Center(
          child: Text(
            'Tap me',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
