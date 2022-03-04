import 'package:flutter/material.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';
import 'package:picsum_gallery/helper/router/custom_router.dart';
import 'package:picsum_gallery/helper/router/route_constants.dart';
import 'app_provider.dart';
import 'pgallery_application.dart';

class AppComponent extends StatefulWidget {
  final PGallery? _pGallery;
  AppComponent(this._pGallery);

  @override
  _AppComponentState createState() => _AppComponentState(_pGallery);
}

class _AppComponentState extends State<AppComponent> {
  final PGallery? _pGallery;



  @override
  void initState() {
    super.initState();
  }

  _AppComponentState(this._pGallery);

  @override
  void dispose() async {
    super.dispose();
    await _pGallery!.onTerminate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
      final app = MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Gilroy',
          primaryColor: kAccentColor,
          primaryColorDark: kPrimaryDarkColor,
          primaryColorLight: kPrimaryColor,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: kPrimaryColor.withOpacity(.5),
            cursorColor: kPrimaryDarkColor,
            selectionHandleColor: Colors.transparent,
          ),
        ),
        onGenerateRoute: CustomRouter.generatedRoute,
        initialRoute: splash,
      );
      final appProvider = AppProvider(child: app, pGallery: _pGallery!);
      return appProvider;

  }
}
