abstract class Constants {
  static const String METHOD_CHANNEL_NAME = 'archa/app_version';
  static const String CALL_METHOD = 'getPlatformVersion';
  static const String APP_VERSION = 'App-version';
  static const String UPDATE_REFRESH_TOKEN = 'refresh_token';
  static const int NOT_AUTHORIZED = 401;
  static const int REF_TOKEN_EXPIRED = 666;
  static const String AUTHORIZATION = 'Authorization';
  static const String API_NAME = 'todo';
  static const String DIO_NAME = 'DioWithLogger';
  static const String ACCESS_TOKEN = 'accessToken';
  static const String REFRESH_TOKEN = 'refreshToken';
  static const String BEARER = 'Bearer';
}

abstract class TodoQueries {
  static const String PAGE = 'page';
  static const String PAGE_SIZE = 'page_size';
}

abstract class Paths {
  static const String ID = 'id';
}
