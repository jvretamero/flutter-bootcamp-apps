import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'bmi_theme.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: BMITheme.primaryColor,
        appBarTheme: const AppBarTheme(
          color: BMITheme.primaryColor,
        ),
        scaffoldBackgroundColor: BMITheme.primaryColor,
      ),
      home: const InputPage(),
    );
  }
}
