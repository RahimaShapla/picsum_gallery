import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';
import 'package:picsum_gallery/helper/framework/pgallery_application.dart';
import 'helper/framework/app_component.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kPrimaryDarkColor, // navigation bar color
    statusBarColor: kPrimaryDarkColor, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Development();
}

class Development {
  Development() {
    //_setupDebugPrint();
    _setupPrimarySystem();
    _init();
  }
}

void _setupPrimarySystem() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

void _init() async {
  var pGallery = PGallery();
  await pGallery.onCreate();
  runApp(AppComponent(pGallery: pGallery));
}

/*void _setupDebugPrint() async {
  var packageInfo = await PackageInfo.fromPlatform();
  var version =
      "${packageInfo.packageName} ${packageInfo.version} (${packageInfo.buildNumber})";
  debugPrint = (String? message, {int? wrapWidth}) =>
      _debugPrintSynchronouslyWithText(message!, version, wrapWidth: wrapWidth!);
  print("Current app version::"+version);
}*/

void _debugPrintSynchronouslyWithText(String message, String version,
    {int? wrapWidth}) {
  message = "[${DateTime.now()} - $version]: $message";
  debugPrintSynchronously(message, wrapWidth: wrapWidth);
}
