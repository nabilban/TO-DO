import 'package:equatable/equatable.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';

class ToDoNotifierState extends Equatable {
  const ToDoNotifierState({required this.toDoList, required this.isLoading});

  final List<ToDoInfo> toDoList;
  final bool isLoading;

  @override
  List<Object?> get props => [toDoList, isLoading];

  factory ToDoNotifierState.empty() {
    return const ToDoNotifierState(toDoList: [], isLoading: false);
  }

  ToDoNotifierState copyWith({
    List<ToDoInfo>? toDoList,
    bool? isLoading,
  }) {
    return ToDoNotifierState(
      toDoList: toDoList ?? this.toDoList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
