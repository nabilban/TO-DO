import 'package:dartz/dartz.dart';
import 'package:flutter_project_2/cores/abstracts/failure.dart';
import 'package:flutter_project_2/features/todo/data/data_sources/to_do_data_source.dart';
// import 'package:flutter_project_2/features/todo/data/data_sources/to_do_local_data_source.dart';
import 'package:flutter_project_2/features/todo/data/model/to_do_model.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/domain/repositories/to_do_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({required this.dataSource});

  final ToDoDataSource dataSource;
  // final ToDoLocalDataSource localDataSource;

  @override
  Future<Either<Failure, ToDoInfo>> createToDo(ToDoInfo input) async {
    try {
      final result = await dataSource.createToDo(ToDoModel.fromEntity(input));
      return Right(ToDoInfo.fromModel(result));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ToDoInfo>>> getAllToDo() async {
    try {
      final result = await dataSource.getAllToDo();
      return Right(result.map((e) => ToDoInfo.fromModel(e)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteToDo(String id) async {
    try {
      final result = await dataSource.deleteToDo(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ToDoInfo>> updateCheckboxToDo(String id) async {
    try {
      final result = await dataSource.updateCheckboxToDo(id);
      return Right(ToDoInfo.fromModel(result));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
