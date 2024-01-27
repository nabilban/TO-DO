import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';
import 'package:flutter_project_2/features/todo/data/to_do_db.dart';

abstract class ToDoDataSource {
  Future<ToDoModel> createToDo(ToDoModel input);
  Future<List<ToDoModel>> getAllToDo();
  Future<bool> deleteToDo(String id);
  Future<ToDoModel> updateCheckboxToDo(String id);

  isCompleted(bool isCompleted) async {}
}

class ToDoDataSourceImpl extends ToDoDataSource {
  ToDoDataSourceImpl({required this.dataBase});

  final ToDoDb dataBase;

  @override
  Future<ToDoModel> createToDo(ToDoModel input) async {
    final result = await dataBase.create(input.toJson);
    return ToDoModel.fromJson(result);
  }

  @override
  Future<List<ToDoModel>> getAllToDo() async {
    final result = await dataBase.getAllTodoList();
    return result.map((todoJson) {
      return ToDoModel.fromJson(todoJson);
    }).toList();
  }

  @override
  Future<bool> deleteToDo(String id) async {
    final result = await dataBase.delete(id);
    return result;
  }

  @override
  Future<ToDoModel> updateCheckboxToDo(String id) async {
    final result = await dataBase.updateCheck(id);
    return ToDoModel.fromJson(result);
  }
}
