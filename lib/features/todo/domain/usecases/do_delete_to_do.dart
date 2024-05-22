import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/cores/abstracts/usecase.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';

class DoDeleteToDo extends UseCase<bool, DoDeleteToDoParams> {
  final TodoRepository repository;

  DoDeleteToDo({required this.repository});
  @override
  Future<Either<Failure, bool>> call(params) async {
    final result = await repository.deleteToDo(params.id);
//anjay
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}

class DoDeleteToDoParams {
  DoDeleteToDoParams({required this.id});

  final String id;
}
