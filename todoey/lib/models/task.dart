import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title = "";

  @HiveField(1)
  bool isDone = false;

  void toggleDone() {
    isDone = !isDone;
  }
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  int get typeId => 0;

  @override
  Task read(BinaryReader reader) {
    return Task()
      ..title = reader.readString()
      ..isDone = reader.readBool();
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeString(obj.title)
      ..writeBool(obj.isDone);
  }
}
