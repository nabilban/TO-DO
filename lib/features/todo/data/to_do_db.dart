import 'package:uuid/v4.dart';

class ToDoDb {
  const ToDoDb();

  static List<Map<String, dynamic>> db = [];

  static const _waiting = Duration(seconds: 2);

  Future<Map<String, dynamic>> create(Map<String, dynamic> input) {
    return Future.delayed(_waiting, () {
      db.add({
        "id": const UuidV4(),
        ...input,
      });
      return input;
    });
  }

  Future<Map<String, dynamic>> updateCheck(String id) {
    return Future.delayed(_waiting, () {
      final index = db.indexWhere((element) => element['id'] == id);

      final prevCheck = db[index]['isCompleted'];
      db[index]['isCompleted'] = !prevCheck;

      return db[index];
    });
  }

  Future<bool> delete(String id) {
    return Future.delayed(_waiting, () {
      db.removeWhere((element) => element['id'] == id);
      return true;
    });
  }

  Future<Map<String, dynamic>> getTodoById(String id) {
    return Future.delayed(_waiting, () {
      return db.firstWhere((element) => element['id'] == id);
    });
  }

  Future<List<Map<String, dynamic>>> getAllTodoList() {
    return Future.delayed(_waiting, () {
      return db;
    });
  }
}
