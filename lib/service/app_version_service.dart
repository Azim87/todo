import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/utils/constants.dart';

@lazySingleton
final class AppVersionService {
  String? _cachedAppVersion;

  Future<String?> getAppVersionFromPlatforms() async {
    if (_cachedAppVersion != null) {
      return _cachedAppVersion;
    }
    const methodChannel = MethodChannel(Constants.METHOD_CHANNEL_NAME);

    try {
      final String? appVersion = await methodChannel.invokeMethod(Constants.CALL_METHOD);
      _cachedAppVersion = appVersion;
      return appVersion;
    } on MissingPluginException catch (err) {
      debugPrint('MethodChannel not implemented: $err');
      return null;
    } catch (e) {
      debugPrint('Failed to get platform version: $e');
      return null;
    }
  }

  void clearCache() => _cachedAppVersion = null;
}
