import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/core/utils/globals.dart';
import 'package:todo/data/data_source/local_data.dart';

@singleton
final class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final localData = getIt<LocalData>();
    options.headers['Authorization'] = '${await localData.readAccessToken()}';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionError) {
      showErrorDialog(err.message!);
    }
    super.onError(err, handler);
  }
}
