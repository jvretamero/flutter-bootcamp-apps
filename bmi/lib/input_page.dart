import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_theme.dart';
import 'card_container.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Widget _card({Widget? child}) {
    return Expanded(
      child: CardContainer(
        color: BMITheme.primaryLightColor,
        child: child,
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
                _card(
                  child: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
                _card(
                  child: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                ),
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
