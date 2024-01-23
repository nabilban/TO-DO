import 'package:flutter/widgets.dart';
import 'package:flutter_project_2/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}
