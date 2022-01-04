import 'package:flutter/material.dart';

import 'bmi_theme.dart';
import 'components/bottom_button.dart';
import 'components/card_container.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Text('Your Result', style: BMITheme.titleTextStyle),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Normal',
                    style: BMITheme.resultTextStyle,
                  ),
                  Text(
                    '18.3',
                    style: BMITheme.bmiTextStyle,
                  ),
                  Text(
                    'Your BMI result is low, you should eat more!',
                    textAlign: TextAlign.center,
                    style: BMITheme.bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              text: 'RECALCULATE',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
