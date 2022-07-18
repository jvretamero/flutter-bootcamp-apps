import 'package:hive/hive.dart';
import 'package:todoey/models/task.dart';

class DatabaseService {
  static final DatabaseService _instance =
      DatabaseService._privateConstructor();
  static DatabaseService get instance => _instance;

  DatabaseService._privateConstructor();

  late Box<Task> _todoBox;

  Future open() async {
    _todoBox = await Hive.openBox<Task>('tasks');
  }

  Future<Task> insert(String title) async {
    final id = await _todoBox.add(Task()..title = title);
    return _todoBox.getAt(id)!;
  }

  Future<List<Task>> getAll() async {
    return Future.value(_todoBox.values.toList());
  }

  Future update(Task task) async {
    return task.save();
  }

  Future remove(int id) async {
    return _todoBox.deleteAt(id);
  }
}
