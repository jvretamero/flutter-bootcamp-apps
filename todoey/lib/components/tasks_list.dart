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
            return ChangeNotifierProvider<Task>(
              create: (context) => taskData[index],
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: _dismissibleBackground(),
                child: const TaskTile(),
                onDismissed: (direction) {
                  taskData.removeTask(index);

                  // TODO show snackbar to undo
                },
              ),
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
