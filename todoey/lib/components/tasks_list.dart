import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (BuildContext context, TasksData taskData, Widget? child) {
        return ListView.builder(
          itemCount: taskData.count,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: _dismissibleBackground(),
              child: TaskTile(task: taskData[index]),
              onDismissed: (direction) {
                Task removedTask = taskData.removeTask(index);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removed task "${removedTask.title}"'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        taskData.addTaskAt(index, removedTask);
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Container _dismissibleBackground() {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      child: const Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),
    );
  }
}
