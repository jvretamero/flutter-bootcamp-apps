import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks_data.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoey/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(TaskAdapter());
  await Hive.initFlutter();
  await DatabaseService.instance.open();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(
      create: (BuildContext context) => TasksData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
