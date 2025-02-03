import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo/config/interceptor/auth_interceptor.dart';
import 'package:todo/config/interceptor/refresh_token.dart';
import 'package:todo/core/endpoints.dart';
import 'package:todo/core/utils/constants.dart';

GetIt getIt = GetIt.instance;

@module
abstract class DiModule {
  @lazySingleton
  Dio create() => setUpForDio();

  @prod
  @Named(Constants.API_NAME)
  String get prodBaseUrl => 'http://localhost:9090/';

  @dev
  @Named(Constants.API_NAME)
  String get devBaseUrl => Endpoints.BASE_URL;

  @injectable
  @Named(Constants.DIO_NAME)
  Dio setUpForDio() => Dio()
    ..interceptors.add(prettyDioLogger)
    ..interceptors.add(getIt<RefreshToken>())
    ..interceptors.add(getIt<AuthInterceptor>());

  @lazySingleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
        requestHeader: true,
        request: true,
        requestBody: true,
        responseHeader: false,
        error: true,
        enabled: true,
        responseBody: true,
        compact: true,
        maxWidth: 190,
      );
}
