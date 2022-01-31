import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy milk', isDone: false),
    Task(title: 'Buy meat', isDone: false),
    Task(title: 'Buy water', isDone: true),
  ];

  int get count => _tasks.length;

  Task operator [](int index) => _tasks[index];
}
