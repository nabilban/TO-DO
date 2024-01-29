import 'package:flutter/widgets.dart';
import 'package:flutter_project_2/app/app.dart';
import 'package:flutter_project_2/cores/local_database/sharedpreff_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPref();
  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}
