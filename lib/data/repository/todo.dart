import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/data/model/error/error_response.dart';
import 'package:todo/data/model/success/todo_success_response.dart';
import 'package:todo/data/model/todo/todo_response.dart';

import '../../core/utils/either.dart';
import '../../service/todo_api_service.dart';

@lazySingleton
final class TodoRepository {
  final TodoApiService _apiService;

  TodoRepository(this._apiService);

  Future<Result<ErrorResponse, TodoResponse>> allTodo() async {
    try {
      final response = await _apiService.allTodo();
      return Result.success(response);
    } on DioException catch (err) {
      return Result.error(ErrorResponse.fromJson(err.response?.data));
    }
  }

  Future<Result<ErrorResponse, TodoSuccessResponse>> addTodo({required final String title, required final String description}) async {
    try {
      final response = await _apiService.addTodo(
        body: {
          "title": title,
          "description": description,
          "completed": false,
        },
      );
      return Result.success(response);
    } on DioException catch (err) {
      return Result.error(ErrorResponse.fromJson(err.response?.data));
    }
  }

  Future<Result<ErrorResponse, TodoSuccessResponse>> editTodo({required final TodoData todo, required final int id}) async {
    try {
      final response = await _apiService.editTodo(id: id, body: todo.toJson());
      return Result.success(response);
    } on DioException catch (err) {
      return Result.error(ErrorResponse.fromJson(err.response?.data));
    }
  }

  Future<Result<ErrorResponse, TodoSuccessResponse>> deleteTodo({required final int? id}) async {
    try {
      final response = await _apiService.deleteTodo(id: id ?? 0);
      return Result.success(response);
    } on DioException catch (err) {
      return Result.error(ErrorResponse.fromJson(err.response?.data));
    }
  }
}
