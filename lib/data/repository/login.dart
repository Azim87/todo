import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/di/di_container.dart';
import 'package:todo/core/utils/either.dart';
import 'package:todo/data/data_source/local_data.dart';
import 'package:todo/data/model/error/error_response.dart';
import 'package:todo/service/todo_api_service.dart';

import '../model/login/login_response.dart';

@lazySingleton
final class LoginRepository {
  LoginRepository(this.apiService);

  final TodoApiService apiService;

  Future<Result<ErrorResponse, LoginResponse>> login({
    required final String email,
    required final String password,
  }) async {
    try {
      final result = await apiService.login(body: {"email": email, "password": password});
      final localData = getIt<LocalData>();
      await localData.cacheTokens(result.accessToken, result.refreshToken);
      return Result.success(result);
    } on DioException catch (err) {
      if (err.type == DioExceptionType.connectionError) {
        Result.error(ErrorResponse.fromJson(err.response?.data));
      }
      return Result.error(ErrorResponse.fromJson(err.response?.data));
    }
  }
}
