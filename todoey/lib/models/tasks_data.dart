import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksData extends ChangeNotifier {
  // TODO persist tasks
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

  void addTaskAt(int index, Task task) {
    _tasks.insert(index, task);
    notifyListeners();
  }

  Task removeTask(int index) {
    Task removedTask = _tasks.removeAt(index);

    notifyListeners();

    return removedTask;
  }
}
