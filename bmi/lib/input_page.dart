import 'package:flutter/material.dart';

import 'bmi_theme.dart';
import 'card_container.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Widget _card() {
    return Expanded(
      child: CardContainer(
        color: BMITheme.primaryLightColor,
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _card(),
                _card(),
              ],
            ),
          ),
          _card(),
          Expanded(
            child: Row(
              children: [
                _card(),
                _card(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
