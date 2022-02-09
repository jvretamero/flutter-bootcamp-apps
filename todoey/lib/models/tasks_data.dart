import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/services/database_service.dart';

class TasksData extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get count => _tasks.length;

  Task operator [](int index) => _tasks[index];

  Future loadTasks() async {
    _tasks.addAll(await DatabaseService.instance.getAll());
  }

  Future addTask(String title) async {
    Task task = await DatabaseService.instance.insert(title);
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
