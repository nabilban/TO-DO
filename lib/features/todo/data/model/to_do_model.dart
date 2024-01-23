import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';

class ToDoModel {
  const ToDoModel(
      {required this.id, required this.isCompleted, required this.text});

  final String id;
  final bool isCompleted;
  final String text;

  factory ToDoModel.fromEntity(ToDoInfo input) {
    return ToDoModel(
      id: input.id,
      isCompleted: input.isCompleted,
      text: input.text,
    );
  }

  factory ToDoModel.fromJson(dynamic input) {
    return ToDoModel(
        id: input['id'],
        isCompleted: input['isCompleted'],
        text: input['text']);
  }

  Map<String, dynamic> get toJson {
    return {
      'id': id,
      'isCompleted': isCompleted,
      'text': text,
    };
  }
}
