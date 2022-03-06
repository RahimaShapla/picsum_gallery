import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';
import 'package:picsum_gallery/helper/router/route_constants.dart';

class SplashActivity extends StatefulWidget {
  const SplashActivity({Key? key}) : super(key: key);

  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      getNextWidget,
    );
    super.initState();
  }

  void getNextWidget() async {
    Navigator.popAndPushNamed(context, homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransparent,
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    kPrimaryColor,
                    kMildMint,
                  ],
                  begin: FractionalOffset(1.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              shape: BoxShape.rectangle,
            ),
            child: Container(
              margin: const EdgeInsets.all(DimenHeight.height_100),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor,
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const Image(
                image: AssetImage('assets/images/ic_logo.png'),
                height: DimenHeight.height_100,
                width: DimenHeight.height_100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
