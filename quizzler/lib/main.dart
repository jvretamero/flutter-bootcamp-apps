import 'package:flutter/material.dart';

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
  final List<bool> _score = [];
  final List<String> _questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  int _currentQuestion = 0;

  void _nextQuestion() {
    _currentQuestion++;

    if (_currentQuestion >= _questions.length) {
      _currentQuestion = 0;
    }
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
                _questions[_currentQuestion],
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
              _nextQuestion();
            });
          },
        ),
        _answerButton(
          text: 'False',
          color: Colors.red,
          onPressed: () {
            setState(() {
              _nextQuestion();
            });
          },
        ),
        Row(
            children: _score
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
