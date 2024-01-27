import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';

abstract class TodoRepository {
  Future<Either<Failure, ToDoInfo>> createToDo(ToDoInfo input);
  Future<Either<Failure, List<ToDoInfo>>> getAllToDo();
  Future<Either<Failure, bool>> deleteToDo(String id);
  Future<Either<Failure, ToDoInfo>> updateCheckboxToDo(String id);
}
