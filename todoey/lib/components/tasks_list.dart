import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  TasksList({
    Key? key,
  }) : super(key: key);

  final List<Task> _tasks = [
    Task(title: 'Buy milk', isDone: false),
    Task(title: 'Buy meat', isDone: false),
    Task(title: 'Buy water', isDone: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) => TaskTile(task: _tasks[index]),
    );
  }
}
