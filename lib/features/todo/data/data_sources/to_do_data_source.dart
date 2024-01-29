import 'package:flutter_project_2/cores/local_database/local_to_do_db.dart';
import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';

abstract class ToDoDataSource {
  Future<ToDoModel> createToDo(ToDoModel input);
  Future<List<ToDoModel>> getAllToDo();
  Future<bool> deleteToDo(String id);
  Future<ToDoModel> updateCheckboxToDo(String id);
}

class ToDoDataSourceImpl extends ToDoDataSource {
  ToDoDataSourceImpl(
    this.localToDoDb,
  );
  final LocalToDoDb localToDoDb;

  @override
  Future<ToDoModel> createToDo(ToDoModel input) async {
    final result = await localToDoDb.create(input.toJson);
    return ToDoModel.fromJson(result);
  }

  @override
  Future<List<ToDoModel>> getAllToDo() async {
    final result = localToDoDb.getAll();

    return result.map((todoJson) {
      return ToDoModel.fromJson(todoJson);
    }).toList();
  }

  @override
  Future<bool> deleteToDo(String id) async {
    final result = await localToDoDb.delete(id);
    return result;
  }

  @override
  Future<ToDoModel> updateCheckboxToDo(String id) async {
    final data = localToDoDb.getById(id);
    final input = {...data, 'isCompleted': !data['isCompleted']};
    final result = await localToDoDb.update(id, input);
    return ToDoModel.fromJson(result);
  }
}
