import 'package:flutter/material.dart';

import '../bmi_theme.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const BottomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: BMITheme.largeButtonTextStyle,
          ),
        ),
        color: BMITheme.bottomButtonColor,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
