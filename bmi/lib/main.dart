import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: const Center(
        child: Text('Body'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
