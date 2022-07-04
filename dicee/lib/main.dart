import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          _DiceButton(),
          _DiceButton(),
        ],
      ),
    );
  }
}

class _DiceButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiceButtonState();
  }
}

class _DiceButtonState extends State<_DiceButton> {
  final _random = Random();
  int _diceNumber = 0;

  @override
  void initState() {
    _diceNumber = _generateDiceNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        // Using TextButton instead of FlatButton because FlatButton was deprecated
        onPressed: () {
          setState(() {
            _diceNumber = _generateDiceNumber();
          });
        },
        child: Image.asset('images/dice$_diceNumber.png'),
      ),
    );
  }

  int _newRandomNumber() {
    return 1 + _random.nextInt(5);
  }

  int _generateDiceNumber() {
    int newNumber = _diceNumber;

    do {
      newNumber = _newRandomNumber();
    } while (newNumber == _diceNumber);

    return newNumber;
  }
}
