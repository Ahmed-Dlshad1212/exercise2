
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChange;
  final bool allowChangePrimerColor;

  const CustomSlider({
    required this.label,
    required this.value,
    required this.onChange,
    required this.allowChangePrimerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Expanded(
          child: Slider(
            value: value,
            onChanged: allowChangePrimerColor ? onChange : null,
            min: 0,
            max: 255,
          ),
        ),
        if (allowChangePrimerColor)
          FloatingActionButton(
            onPressed: () => onChange(255),
            child: Text('P'),
          ),
      ],
    );
  }
}
