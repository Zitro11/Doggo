import UIKit
import Flutter
import GoogleMaps //Importe google maps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDUPgdftLCvPren2lcFSNQGswwhNI1IvGE")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
