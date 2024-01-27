import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/cores/abstracts/usecase.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';

class DoUpdateCheckboxToDo
    extends UseCase<ToDoInfo, DoUpdateCheckboxToDoParams> {
  final TodoRepository repository;

  DoUpdateCheckboxToDo({required this.repository});
  @override
  Future<Either<Failure, ToDoInfo>> call(
      DoUpdateCheckboxToDoParams params) async {
    final result = await repository.updateCheckboxToDo(params.id);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}

class DoUpdateCheckboxToDoParams {
  DoUpdateCheckboxToDoParams({required this.id});

  final String id;
}
