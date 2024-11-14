import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/utils/either.dart';
import 'package:todo/data/model/error/error_response.dart';
import 'package:todo/data/model/signup/signup_response.dart';
import 'package:todo/service/todo_api_service.dart';

@lazySingleton
final class SignupRepository {
  SignupRepository(this.apiService);

  final TodoApiService apiService;

  Future<Result<ErrorResponse, SignupResponse>> signup({
    required final String email,
    required final String password,
  }) async {
    try {
      final result = await apiService.signup(body: {"email": email, "password": password});
      return Result.success(result);
    } on DioException catch (err) {
      return Result.error(ErrorResponse.fromJson(err.response!.data));
    }
  }
}
