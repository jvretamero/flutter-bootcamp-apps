import 'package:flutter/material.dart';

import '../bmi_theme.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconContent({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(height: 15),
        Text(
          text,
          style: BMITheme.labelTextStyle,
        ),
      ],
    );
  }
}
