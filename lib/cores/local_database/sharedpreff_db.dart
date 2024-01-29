import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefDb {
  static SharedPreferences? instance;

  Future<Map<String, dynamic>> create(Map<String, dynamic> input);
  Future<Map<String, dynamic>> update(String id, Map<String, dynamic> input);
  Future<bool> delete(String id);
  List<Map<String, dynamic>> getAll();
  Map<String, dynamic> getById(String id);
}

Future<void> initSharedPref() async {
  SharedPrefDb.instance = await SharedPreferences.getInstance();
}
