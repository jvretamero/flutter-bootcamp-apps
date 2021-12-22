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
          diceButton('images/dice1.png'),
          diceButton('images/dice2.png'),
        ],
      ),
    );
  }

  Widget diceButton(String imageName) {
    return Expanded(
      child: TextButton(
        // Using TextButton instead of FlatButton because FlatButton was deprecated
        onPressed: () {},
        child: Image.asset(imageName),
      ),
    );
  }
}
