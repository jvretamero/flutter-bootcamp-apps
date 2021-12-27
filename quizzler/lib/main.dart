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

  void _checkAnswer(BuildContext context, bool answer) {
    setState(() {
      _controller.checkAnswer(answer);

      if (_controller.isFinished) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text('You have reached the end of the quiz'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _controller.reset();
                  });
                },
                child: const Text('Do it again'),
              ),
            ],
          ),
        );
      }
    });
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
            _checkAnswer(context, true);
          },
        ),
        _answerButton(
          text: 'False',
          color: Colors.red,
          onPressed: () {
            _checkAnswer(context, false);
          },
        ),
        Wrap(
          direction: Axis.horizontal,
          children: _controller.score
              .map((isTrue) => Icon(
                    isTrue ? Icons.check : Icons.close,
                    color: isTrue ? Colors.green : Colors.red,
                  ))
              .toList(),
        )
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
