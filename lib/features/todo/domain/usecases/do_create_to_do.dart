import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/cores/abstracts/usecase.dart';
import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';

class DoCreateToDo extends UseCase<ToDoInfo, DoCreateToDoParams> {
  DoCreateToDo({required this.repository});

  final TodoRepository repository;

  @override
  Future<Either<Failure, ToDoInfo>> call(params) async {
    final result =
        await repository.createToDo(ToDoModel.fromEntity(params.data));

    return result.fold(
      (l) => Left(l),
      (r) => Right(
        ToDoInfo.fromModel(r),
      ),
    );
  }
}

class DoCreateToDoParams {
  DoCreateToDoParams({required this.data});

  final ToDoInfo data;
}
