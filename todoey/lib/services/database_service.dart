import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoey/models/task.dart';

class DatabaseService {
  static const String _TABLE = 'Task';
  static const String _COLUMN_ID = 'id';
  static const String _COLUMN_TITLE = 'title';
  static const String _COLUMN_DONE = 'done';

  late Database _db;

  static final DatabaseService _instance = DatabaseService._privateConstructor();
  static DatabaseService get instance => _instance;

  DatabaseService._privateConstructor();

  Future open() async {
    var databasePath = await getDatabasesPath();
    _db = await openDatabase(
      join(databasePath, 'todoey.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE $_TABLE (
  $_COLUMN_ID integer primary key autoincrement,
  $_COLUMN_TITLE text not null,
  $_COLUMN_DONE integer not null
)
''');
      },
    );
  }

  Future<Task> insert(String title) async {
    int id = await _db.insert(
      _TABLE,
      {
        _COLUMN_TITLE: title,
        _COLUMN_DONE: 0,
      },
    );

    return Task(id: id, title: title);
  }

  Future<List<Task>> getAll() async {
    return (await _db.query(_TABLE, orderBy: _COLUMN_ID)).map((e) => Task.fromMap(e)).toList();
  }
}
