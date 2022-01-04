import 'package:flutter/material.dart';

import 'bmi_theme.dart';
import 'round_icon_button.dart';

class NumberSelector extends StatelessWidget {
  final int number;
  final String label;
  final Function(int) onValue;
  final int? min;
  final int? max;
  final int? increment;

  const NumberSelector({
    Key? key,
    required this.number,
    required this.onValue,
    required this.label,
    this.increment,
    this.min,
    this.max,
  }) : super(key: key);

  int get _currentIncrement {
    return increment ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: BMITheme.labelTextStyle,
        ),
        Text(
          number.toString(),
          style: BMITheme.numberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: Icons.remove,
              onPressed: () {
                int newNumber = number - _currentIncrement;

                if (newNumber >= (min ?? 0)) {
                  onValue(newNumber);
                }
              },
            ),
            const SizedBox(width: 10),
            RoundIconButton(
              icon: Icons.add,
              onPressed: () {
                int newNumber = number + _currentIncrement;

                if (newNumber <= (max ?? 999)) {
                  onValue(newNumber);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
