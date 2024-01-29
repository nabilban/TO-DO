import 'package:flutter_project_2/cores/local_database/local_to_do_db.dart';
import 'package:flutter_project_2/cores/local_database/sharedpreff_db.dart';
import 'package:flutter_project_2/features/todo/data/data_sources/to_do_data_source.dart';
import 'package:flutter_project_2/features/todo/data/repositories/to_do_repository_impl.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_create_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_delete_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_get_all_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_update_checkbox_to_do.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/state/to_do_notifier_state.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/to_do_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final toDoDbProvider = Provider<LocalToDoDb>((ref) {
  return LocalToDoDb(sharedPreferences: SharedPrefDb.instance!);
});

//datasources
final toDoDataSourceProvider = Provider<ToDoDataSource>((ref) {
  return ToDoDataSourceImpl(ref.read(toDoDbProvider));
});

//repositories
final toDoRepositoryProvider = Provider<TodoRepository>((ref) {
  final ToDoDataSource dataSource = ref.read(toDoDataSourceProvider);
  return TodoRepositoryImpl(dataSource: dataSource);
});

//usecases
final doCreateToDoProvider = Provider<DoCreateToDo>((ref) {
  final TodoRepository repository = ref.read(toDoRepositoryProvider);
  return DoCreateToDo(repository: repository);
});

final doGetAllToDoProvider = Provider<DoGetAllToDo>((ref) {
  final TodoRepository repository = ref.read(toDoRepositoryProvider);
  return DoGetAllToDo(repository: repository);
});

final doDeleteToDoProvider = Provider<DoDeleteToDo>((ref) {
  final TodoRepository repository = ref.read(toDoRepositoryProvider);
  return DoDeleteToDo(repository: repository);
});

final doUpdateCheckboxProvider = Provider<DoUpdateCheckboxToDo>((ref) {
  final TodoRepository repository = ref.read(toDoRepositoryProvider);
  return DoUpdateCheckboxToDo(repository: repository);
});

final toDoNotifierProvider =
    StateNotifierProvider<ToDoNotifier, ToDoNotifierState>((ref) {
  final doCreateToDo = ref.read(doCreateToDoProvider);
  final doGetAllTodo = ref.read(doGetAllToDoProvider);
  final doDeleteToDo = ref.read(doDeleteToDoProvider);
  final doUpdateCheckboxToDo = ref.read(doUpdateCheckboxProvider);

  return ToDoNotifier(
      doCreateToDo, doGetAllTodo, doDeleteToDo, doUpdateCheckboxToDo);
});
