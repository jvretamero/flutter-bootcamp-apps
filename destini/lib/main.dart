import 'package:flutter/material.dart';

import 'story_controller.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
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
  late StoryController _controller;

  @override
  void initState() {
    _controller = StoryController();
    super.initState();
  }

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

  Function() onChoice(int choiceNumber) {
    return () {
      setState(() {
        _controller.nextStory(choiceNumber);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    _controller.currentStory.storyTitle,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: _choiceButton(
                  _controller.currentStory.choice1,
                  Colors.red,
                  onChoice(1),
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: _controller.buttonShuldBeVisible,
                child: Expanded(
                  flex: 2,
                  child: _choiceButton(
                    _controller.currentStory.choice2,
                    Colors.blue,
                    onChoice(2),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
