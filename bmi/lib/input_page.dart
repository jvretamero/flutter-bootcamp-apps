import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_container.dart';
import 'gender.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

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
          _card(child: Container()),
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
