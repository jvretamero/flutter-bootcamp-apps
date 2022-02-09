import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String _taskTitle;
  bool _isTitleEmpty = true;

  Function() _addTask(BuildContext context) {
    return () {
      var taskData = Provider.of<TasksData>(context, listen: false);
      taskData.addTask(Task(title: _taskTitle));

      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 18,
                ),
                onChanged: (value) {
                  setState(() {
                    _taskTitle = value;
                    _isTitleEmpty = value.isEmpty;
                  });
                },
                decoration: const InputDecoration(
                  enabledBorder: kInputBorder,
                  focusedBorder: kInputBorder,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  padding: const EdgeInsets.all(15),
                  elevation: 0,
                ).copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.lightBlueAccent.withOpacity(0.39);
                    }

                    return Colors.lightBlueAccent;
                  }),
                ),
                onPressed: _isTitleEmpty ? null : _addTask(context),
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
