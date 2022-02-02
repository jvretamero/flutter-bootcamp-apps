import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
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
          itemBuilder: (context, index) => TaskTile(task: taskData[index]),
        );
      },
    );
  }
}
