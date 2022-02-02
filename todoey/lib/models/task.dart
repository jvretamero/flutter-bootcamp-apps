import 'package:flutter/foundation.dart';

class Task extends ChangeNotifier {
  final String title;
  late bool _isDone;

  bool get isDone => _isDone;

  Task({
    required this.title,
    bool isDone = false,
  }) {
    _isDone = isDone;
  }

  void toggleDone() {
    _isDone = !_isDone;
    notifyListeners();
  }
}
