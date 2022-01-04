import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_theme.dart';
import 'card_container.dart';
import 'gender.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final double minHeight = 120;
  final double maxHeight = 220;

  late Gender selectedGender;
  late double height;

  Widget _genderCard({
    required Gender gender,
    required Widget child,
  }) {
    return Expanded(
      child: CardContainer(
        onSelected: () {
          if (selectedGender != gender) {
            setState(() {
              selectedGender = gender;
            });
          }
        },
        isSelected: selectedGender == gender,
        child: child,
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Expanded(
      child: CardContainer(
        child: child,
      ),
    );
  }

  @override
  void initState() {
    selectedGender = Gender.male;
    height = minHeight;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                _genderCard(
                  gender: Gender.male,
                  child: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
                _genderCard(
                  gender: Gender.female,
                  child: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          _card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: BMITheme.labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toStringAsFixed(0),
                      style: BMITheme.numberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: BMITheme.labelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: BMITheme.sliderTheme(context),
                  child: Slider(
                    value: height,
                    min: minHeight,
                    max: maxHeight,
                    divisions: (maxHeight - minHeight).toInt(),
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _card(child: Container()),
                _card(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
