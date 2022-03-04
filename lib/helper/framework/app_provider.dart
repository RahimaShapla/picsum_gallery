import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:picsum_gallery/helper/framework/pgallery_application.dart';


class AppProvider extends InheritedWidget {
  final PGallery? pGallery;

  AppProvider({Key? key, Widget? child, this.pGallery})
      : super(key: key, child: child!);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AppProvider? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType());
  }

  static PGallery? getApplication(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>()!.pGallery);
  }
}
