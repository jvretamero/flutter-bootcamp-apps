import 'package:flutter/material.dart';

class BMITheme {
  static const primaryColor = Color(0xFF0A0E21);
  static const accentColor = Color(0xFFEB1555);

  static const activeCardColor = Color(0xFF1D1E33);
  static const inactiveCardColor = Color(0xFF111328);

  static const textColor = Color(0xFF8D8E98);
  static const buttonColor = Color(0xFF4C4F5E);

  static const sliderActiveColor = accentColor;
  static const sliderInactiveColor = Color(0xFF8D8E98);
  static const sliderThumbColor = accentColor;

  static const bottomButtonColor = accentColor;

  static const labelTextStyle = TextStyle(
    fontSize: 18,
    color: textColor,
  );

  static const numberTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );

  static const largeButtonTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static SliderThemeData sliderTheme(BuildContext context) => SliderTheme.of(context).copyWith(
        trackHeight: 1,
        activeTrackColor: Colors.white,
        inactiveTrackColor: BMITheme.sliderInactiveColor,
        thumbColor: BMITheme.sliderThumbColor,
        overlayColor: BMITheme.sliderThumbColor.withAlpha(0x29),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
      );
}
