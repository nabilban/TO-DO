import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/cores/abstracts/usecase.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';

class DoGetAllToDo extends UseCaseNoParams<List<ToDoInfo>> {
  DoGetAllToDo({required this.repository});

  final TodoRepository repository;

  @override
  Future<Either<Failure, List<ToDoInfo>>> call() async {
    final result = await repository.getAllToDo();

    return result.fold((failure) {
      return Left(failure);
    }, (listTodoModel) {
      return Right(listTodoModel
          .map((todoModel) => ToDoInfo.fromModel(todoModel))
          .toList());
    });
  }
}
