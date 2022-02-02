import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';

// TODO add swipe to delete

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Task>(
      builder: (context, task, child) {
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
              task.toggleDone();
            },
            value: task.isDone,
          ),
        );
      },
    );
  }
}
