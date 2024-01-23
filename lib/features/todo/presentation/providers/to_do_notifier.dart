import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_create_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_get_all_to_do.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/state/to_do_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoNotifier extends StateNotifier<ToDoNotifierState> {
  final DoCreateToDo _doCreateToDo;
  final DoGetAllToDo _doGetAllToDo;

  ToDoNotifier(this._doCreateToDo, this._doGetAllToDo)
      : super(ToDoNotifierState.empty());

  Future<void> createTodo(ToDoInfo input) async {
    state = state.copyWith(isLoading: true);

    await _doCreateToDo(DoCreateToDoParams(data: input));
    final getAllTodoResult = await _doGetAllToDo();

    getAllTodoResult.fold((failure) {
      state = state.copyWith(isLoading: false);
    }, (data) {
      state = state.copyWith(toDoList: data, isLoading: false);
    });
  }

  Future<void> getAllToDo() async {
    state = state.copyWith(isLoading: true);
    final result = await _doGetAllToDo();

    result.fold((failure) {
      state = state.copyWith(isLoading: false);
    }, (todoList) {
      state = state.copyWith(isLoading: false, toDoList: todoList);
    });
  }
}
