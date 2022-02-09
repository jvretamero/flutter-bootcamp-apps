import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${task.id} - ${task.title}',
        style: TextStyle(
          fontSize: 20,
          decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: (bool? value) {
          var tasksData = Provider.of<TasksData>(context, listen: false);
          tasksData.toggleTaskDone(task);
        },
        value: task.isDone,
      ),
    );
  }
}
