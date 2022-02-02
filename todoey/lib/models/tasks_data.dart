import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy milk', isDone: false),
    Task(title: 'Buy meat', isDone: false),
    Task(title: 'Buy water', isDone: true),
  ];

  int get count => _tasks.length;

  Task operator [](int index) => _tasks[index];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
