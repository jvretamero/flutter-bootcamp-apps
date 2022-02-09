class Task {
  final int id;
  final String title;
  late bool _isDone;

  bool get isDone => _isDone;

  Task({
    required this.id,
    required this.title,
    bool isDone = false,
  }) {
    _isDone = isDone;
  }

  void toggleDone() {
    _isDone = !_isDone;
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'done': _isDone ? 1 : 0,
      };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
        id: map['id'],
        title: map['title'],
        isDone: map['done'] == 1,
      );
}
