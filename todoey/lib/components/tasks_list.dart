import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  late Future _loadingTaskFuture;

  @override
  void initState() {
    super.initState();

    var tasksData = Provider.of<TasksData>(context, listen: false);
    _loadingTaskFuture = tasksData.loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadingTaskFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return Consumer<TasksData>(
          builder: (BuildContext context, TasksData taskData, Widget? child) {
            if (taskData.count > 0) {
              return _taskListView(taskData);
            } else {
              return const Text(
                'Nothing to do...',
                textAlign: TextAlign.center,
              );
            }
          },
        );
      },
    );
  }

  ListView _taskListView(TasksData taskData) {
    return ListView.builder(
      itemCount: taskData.count,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: _dismissibleBackground(),
          child: TaskTile(task: taskData[index]),
          onDismissed: (direction) async {
            Task removedTask = taskData.removeTask(index);

            SnackBarClosedReason reason = await ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    content: Text('Removed task "${removedTask.title}"'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        taskData.addTaskAt(index, removedTask);
                      },
                    ),
                  ),
                )
                .closed;

            if (reason != SnackBarClosedReason.action) {
              await taskData.removeTaskPermanently(removedTask.key);
            }
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
