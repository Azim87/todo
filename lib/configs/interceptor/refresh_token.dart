import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/router/router.dart';
import 'package:todo/core/endpoints.dart';
import 'package:todo/core/utils/constants.dart';
import 'package:todo/data/data_source/local_data.dart';

import '../di/di_container.dart';
import '../router/r.dart';

@lazySingleton
class RefreshToken extends InterceptorsWrapper {
  bool _isRefreshing = false;
  final List<RequestOptions> _pendingRequests = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final dio = getIt<Dio>();
    final localStorage = getIt<LocalData>();

    if (err.response?.statusCode == Constants.REF_TOKEN_EXPIRED) {
      _navigateToLogin();
      return;
    }

    if (err.response?.statusCode == Constants.NOT_AUTHORIZED) {
      if (_isRefreshing) {
        _pendingRequests.add(err.requestOptions);
        return;
      }
      _isRefreshing = true;

      try {
        final refreshToken = await localStorage.readRefreshToken();
        final Response<Map<String, dynamic>> response = await dio.post(
          '${Endpoints.BASE_URL}${Endpoints.REFRESH}',
          data: {Constants.UPDATE_REFRESH_TOKEN: refreshToken},
          options: Options(headers: {'Content-Type': 'application/json'}),
        );

        final String newAccessToken = response.data![Constants.ACCESS_TOKEN].toString();
        final String newRefreshToken = response.data![Constants.REFRESH_TOKEN].toString();

        await localStorage.cacheTokens(newAccessToken, newRefreshToken);

        for (final request in _pendingRequests) {
          request.headers[Constants.AUTHORIZATION] = '${Constants.BEARER} $newRefreshToken';
          handler.resolve(await dio.fetch(request));
        }
        _pendingRequests.clear();
      } catch (e) {
        _navigateToLogin();
      } finally {
        _isRefreshing = false;
      }
      return;
    }
    return handler.next(err);
  }

  void _navigateToLogin() {
    final BuildContext context = navigatorKey.currentContext!;
    if (context != null) {
      context.go(R.login);
    }
  }
}
