import 'package:flutter/material.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_create_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_delete_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_get_all_to_do.dart';
import 'package:flutter_project_2/features/todo/domain/usecases/do_update_checkbox_to_do.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/state/to_do_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ToDoNotifier extends StateNotifier<ToDoNotifierState> {
  final DoCreateToDo _doCreateToDo;
  final DoGetAllToDo _doGetAllToDo;
  final DoDeleteToDo _doDeleteToDo;
  final DoUpdateCheckboxToDo _doUpdateCheckboxToDo;

  ToDoNotifier(
    this._doCreateToDo,
    this._doGetAllToDo,
    this._doDeleteToDo,
    this._doUpdateCheckboxToDo,
  ) : super(ToDoNotifierState.empty());

  Future<void> createTodo(ToDoInfo input, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    context.loaderOverlay.show();
    await _doCreateToDo(DoCreateToDoParams(data: input));
    final getAllTodoResult = await _doGetAllToDo();

    getAllTodoResult.fold((failure) {
      state = state.copyWith(isLoading: false);
      context.loaderOverlay.hide();
    }, (data) {
      state = state.copyWith(toDoList: data, isLoading: false);
      context.loaderOverlay.hide();
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

  Future<void> deleteToDo(id, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    context.loaderOverlay.show();
    await _doDeleteToDo(DoDeleteToDoParams(id: id));
    final getAllTodoResult = await _doGetAllToDo();

    getAllTodoResult.fold((failure) {
      state = state.copyWith(isLoading: false);
      context.loaderOverlay.hide();
    }, (data) {
      state = state.copyWith(toDoList: data, isLoading: false);
      context.loaderOverlay.hide();
    });
  }

  Future<void> updateCheckboxToDo(id, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    context.loaderOverlay.show();
    await _doUpdateCheckboxToDo(DoUpdateCheckboxToDoParams(id: id));
    final getAllTodoResult = await _doGetAllToDo();

    getAllTodoResult.fold((failure) {
      state = state.copyWith(isLoading: false);
      context.loaderOverlay.hide();
    }, (data) {
      state = state.copyWith(toDoList: data, isLoading: false);
      context.loaderOverlay.hide();
    });
  }
}
