import 'package:flutter/material.dart';

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
  var _diceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        // Using TextButton instead of FlatButton because FlatButton was deprecated
        onPressed: () {
          setState(() {
            _diceNumber = 2;
          });
        },
        child: Image.asset('images/dice$_diceNumber.png'),
      ),
    );
  }
}
