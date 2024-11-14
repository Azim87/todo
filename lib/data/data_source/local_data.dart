import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalData {
  final _storage = const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true), iOptions: IOSOptions());

  Future<void> cacheTokens(String? accessToken, String? refreshToken) async {
    await _storage.write(key: 'accessToken', value: accessToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<String?> readAccessToken() async => _storage.read(key: 'accessToken');

  Future<String?> readRefreshToken() async => _storage.read(key: 'refreshToken');

  Future<void> clearCache() async => await _storage.deleteAll();
}
