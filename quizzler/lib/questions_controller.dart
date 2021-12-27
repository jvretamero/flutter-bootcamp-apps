import 'question.dart';

class QuestionsController {
  final List<bool> _score = [];
  final List<Question> _questions = [
    Question(text: 'You can lead a cow down stairs but not up stairs.', answer: false),
    Question(text: 'Approximately one quarter of human bones are in the feet.', answer: true),
    Question(text: 'A slug\'s blood is green.', answer: true),
  ];
  int _currentQuestion = 0;
  bool _isFinished = false;

  String get questionText => _questions[_currentQuestion].text;
  Iterable<bool> get score => List.unmodifiable(_score);
  bool get isFinished => _isFinished;

  void _nextQuestion() {
    if (_currentQuestion + 1 >= _questions.length) {
      _isFinished = true;
    } else {
      _currentQuestion++;
    }
  }

  void checkAnswer(bool answer) {
    bool correctAnswer = _questions[_currentQuestion].answer;
    bool isCorrect = answer == correctAnswer;

    _score.add(isCorrect);

    _nextQuestion();
  }

  void reset() {
    _score.clear();
    _isFinished = false;
    _currentQuestion = 0;
  }
}
