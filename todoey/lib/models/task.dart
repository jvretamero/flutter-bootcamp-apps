class Task {
  final String title;
  late bool _isDone;

  bool get isDone => _isDone;

  Task({
    required this.title,
    required bool isDone,
  }) {
    _isDone = isDone;
  }

  void toggleDone() {
    _isDone = !_isDone;
  }
}
