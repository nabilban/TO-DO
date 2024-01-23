import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';

abstract class TodoRepository {
  Future<Either<Failure, ToDoModel>> createToDo(ToDoModel input);
  Future<Either<Failure, List<ToDoModel>>> getAllToDo();
}
