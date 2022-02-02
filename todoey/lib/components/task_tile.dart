import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.title,
        style: TextStyle(
          fontSize: 20,
          decoration: widget.task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: (bool? value) {
          setState(() {
            widget.task.toggleDone();
          });
        },
        value: widget.task.isDone,
      ),
    );
  }
}
