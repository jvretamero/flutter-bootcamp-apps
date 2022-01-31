import 'package:flutter/material.dart';

// TODO add swipe to delete
class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Task',
        style: TextStyle(
          fontSize: 20,
          decoration: _isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value ?? false;
          });
        },
        value: _isChecked,
      ),
    );
  }
}
