import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo/configs/interceptor/auth_interceptor.dart';

GetIt getIt = GetIt.instance;

@module
abstract class DiModule {
  @lazySingleton
  Dio create() => setUpForDio();

  @prod
  @Named('todo')
  String get prodBaseUrl => 'http://localhost:9090/';

  @dev
  @Named('todo')
  String get devBaseUrl => 'http://localhost:8080/';

  @injectable
  @Named('DioWithLogger')
  Dio setUpForDio() => Dio()
    ..interceptors.add(prettyDioLogger)
    ..interceptors.add(getIt<AuthInterceptor>());

  @lazySingleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
        requestHeader: true,
        // Показываем заголовки запросов
        requestBody: true,
        // Показываем тело запроса
        responseHeader: true,
        // Показываем заголовки ответа
        responseBody: true,
        // Показываем тело ответа
        compact: true,
        // Убираем компактный режим для лучшего отображения
        maxWidth: 90,
      );
}
