import 'package:flutter/material.dart';
import 'questions_controller.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  late QuestionsController _controller;

  @override
  void initState() {
    _controller = QuestionsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                _controller.questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        _answerButton(
          text: 'True',
          color: Colors.green,
          onPressed: () {
            setState(() {
              _controller.checkAnswer(true);
            });
          },
        ),
        _answerButton(
          text: 'False',
          color: Colors.red,
          onPressed: () {
            setState(() {
              _controller.checkAnswer(false);
            });
          },
        ),
        //TODO: prevent overflow
        Row(
            children: _controller.score
                .map((isTrue) => Icon(
                      isTrue ? Icons.check : Icons.close,
                      color: isTrue ? Colors.green : Colors.red,
                    ))
                .toList())
      ],
    );
  }

  Widget _answerButton({
    required String text,
    required Color color,
    required Function() onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: RawMaterialButton(
          fillColor: color,
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
