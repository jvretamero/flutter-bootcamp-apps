import 'package:flutter/material.dart';

import '../bmi_theme.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      shape: const CircleBorder(),
      fillColor: BMITheme.buttonColor,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
