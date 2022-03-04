import 'package:flutter/material.dart';
import 'package:picsum_gallery/app/features/splash/screen/splash_page.dart';
import 'package:picsum_gallery/helper/router/route_constants.dart';

import 'not_found_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashActivity());
/*      case homeRoute:
        return MaterialPageRoute(builder: (_) => ContainerActivity());
      case personalInfo:
        return MaterialPageRoute(builder: (_) => PersonalInfoActivity(isSignIn: false));
      case pinEntry:
        var arg =  settings.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (_) => PinEntryActivity(isFromReg: arg.isFromReg,));*/
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}

