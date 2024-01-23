import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/features/todo/data/data_sources/to_do_data_source.dart';
import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({required this.dataSource});

  final ToDoDataSource dataSource;

  @override
  Future<Either<Failure, ToDoModel>> createToDo(ToDoModel input) async {
    try {
      final result = await dataSource.createToDo(input);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ToDoModel>>> getAllToDo() async {
    try {
      final result = await dataSource.getAllToDo();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
