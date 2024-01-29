import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';
import 'package:flutter_project_2/features/todo/data/to_do_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ToDoLocalDataSource {
  Future<ToDoModel> getLastTask();

  Future<void> cacheToDo(ToDoModel toDoToCache);
}

class ToDoLocalDataSourceImpl implements ToDoLocalDataSource {
  ToDoLocalDataSourceImpl(this.database, {required this.sharedPreferences});

  final ToDoDb database;
  final SharedPreferences sharedPreferences;

  @override
  Future<ToDoModel> getLastTask() {
    throw Exception();
  }

  @override
  Future<void> cacheToDo(ToDoModel toDoToCache) {
    throw Exception();
  }
}
