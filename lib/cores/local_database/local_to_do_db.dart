import 'dart:convert';

import 'package:flutter_project_2/cores/local_database/sharedpreff_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LocalToDoDb extends SharedPrefDb {
  LocalToDoDb({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;
  static String dbName = 'ToDoDb';
  static const uuid = Uuid();

  @override
  Future<Map<String, dynamic>> create(Map<String, dynamic> input) async {
    final allData = getAll();
    final updatedData = [
      ...allData,
      {...input, "id": uuid.v4()}
    ];

    final jsonList = updatedData.map((e) => jsonEncode(e)).toList();
    await sharedPreferences.setStringList(dbName, jsonList);

    return input;
  }

  @override
  Future<bool> delete(String id) async {
    final listMapData = getAll();
    listMapData.removeWhere((e) => e['id'] == id);
    final jsonList = listMapData.map((e) => json.encode(e)).toList();
    await sharedPreferences.setStringList(dbName, jsonList);
    return true;
  }

  @override
  List<Map<String, dynamic>> getAll() {
    final List<String> items = sharedPreferences.getStringList(dbName) ?? [];
    final result = items.map((e) {
      final jsonMap = json.decode(e);
      return {
        "id": jsonMap['id'],
        "text": jsonMap['text'],
        "isCompleted": jsonMap['isCompleted'],
      };
    }).toList();
    return result;
  }

  @override
  Future<Map<String, dynamic>> update(
      String id, Map<String, dynamic> input) async {
    final listMapdData = getAll();
    final index = listMapdData.indexWhere((e) => e["id"] == id);
    listMapdData[index] = input;
    final jsonList = listMapdData.map((e) => jsonEncode(e)).toList();
    await sharedPreferences.setStringList(dbName, jsonList);
    return input;
  }

  @override
  Map<String, dynamic> getById(String id) {
    final allData = getAll();
    final result = allData.firstWhere((element) => element['id'] == id);
    return result;
  }
}
