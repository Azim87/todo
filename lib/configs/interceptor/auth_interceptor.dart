import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/configs/router/r.dart';
import 'package:todo/configs/router/router.dart';
import 'package:todo/core/utils/constants.dart';
import 'package:todo/core/utils/globals.dart';
import 'package:todo/data/data_source/local_data.dart';
import 'package:todo/service/app_version_service.dart';

@singleton
final class AuthInterceptor extends Interceptor {
  String? _cachedAccessToken;
  String? _cachedAppVersion;

  Future<String?> _getAccessToken() async {
    if (_cachedAccessToken == null) {
      final localData = getIt<LocalData>();
      _cachedAccessToken = await localData.readAccessToken();
    }
    return _cachedAccessToken;
  }

  Future<String?> _getAppVersion() async {
    if (_cachedAppVersion == null) {
      final version = getIt<AppVersionService>();
      _cachedAppVersion = await version.getAppVersionFromPlatforms();
    }
    return _cachedAppVersion;
  }

  void _navigateToLogin() => navigatorKey.currentContext!.go(R.login);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final accessToken = await _getAccessToken();
      options.headers[Constants.AUTHORIZATION] = 'Bearer $accessToken';

      if (options.extra[Constants.APP_VERSION] == true) {
        final appVersion = await _getAppVersion();
        options.headers[Constants.APP_VERSION] = appVersion;
      }
      handler.next(options);
    } catch (e) {
      handler.reject(DioException(requestOptions: options, error: e));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionError) {
      showErrorDialog(err.message!, callback: _navigateToLogin);
    }
    handler.next(err);
  }
}
