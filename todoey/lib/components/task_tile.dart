import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

// TODO add swipe to delete

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 20,
          decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: (bool? value) {
          // TODO
        },
        value: task.isDone,
      ),
    );
  }
}
