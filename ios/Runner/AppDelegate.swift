import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("2a6f8c21a30d3024e038d67d7d4eba647dc79cd4")
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "todo/app_version", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) in
            
            if call.method == "getPlatformVersion" {
                if let appVersion = self.getAppVersion() {
                    result(appVersion) // Use the helper method
                                } else {
                                    result(FlutterError(code: "ERROR", message: "Failed to get app version", details: nil))
                                }
            }}
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func getAppVersion() -> String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
