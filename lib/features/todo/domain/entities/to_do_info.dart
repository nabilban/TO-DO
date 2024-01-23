import 'package:equatable/equatable.dart';
import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';

class ToDoInfo extends Equatable {
  const ToDoInfo(
      {required this.id, required this.isCompleted, required this.text});

  final String id;
  final bool isCompleted;
  final String text;

  @override
  List<Object?> get props => [id, isCompleted, text];

  factory ToDoInfo.fromModel(ToDoModel input) {
    return ToDoInfo(
      id: input.id,
      isCompleted: input.isCompleted,
      text: input.text,
    );
  }
}
