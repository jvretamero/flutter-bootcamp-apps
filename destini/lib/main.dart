import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StoryPageState();
  }
}

class _StoryPageState extends State<StoryPage> {
  Widget _choiceButton(String text, Color color, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary: color),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    'Story text will go here',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: _choiceButton(
                  'Choice 1',
                  Colors.red,
                  () {},
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: _choiceButton(
                  'Choice 1',
                  Colors.blue,
                  () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
