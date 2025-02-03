package com.archa.client

import android.os.Bundle
import android.os.PersistableBundle
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL: String = "archa/app_version"

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        installSplashScreen()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getPlatformVersion") {
                val version = getAppVersion()
                result.success(version)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getAppVersion(): String {
        var packageInfo = packageManager.getPackageInfo(packageName, 0)

        val version = packageInfo.versionName

        if (version.isEmpty()) {
            return "Unable to get app version"
        }
        return version
    }
}
