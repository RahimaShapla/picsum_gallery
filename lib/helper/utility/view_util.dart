import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';

class Utility {
  Utility._privateConstructor();

  static final Utility _instance = Utility._privateConstructor();

  static Utility get instance {
    return _instance;
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  PreferredSize appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kTransparent,
          elevation: 0,
          leading: const Icon(
            Icons.menu_rounded,
            color: kPrimaryColor,
            size: 30,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.notifications_active,
                color: kPrimaryColor,
                size: 30,
              ),
            ),
          ],
        ));
  }

  innerLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kWhiteColor,
          elevation: 4,
          content: SizedBox(
            height: 50,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
              /*    Text(
                  "Please wait...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kDarkText,
                    fontSize: 20,
                  ),
                ),*/

                Center(
                  child: CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(kPrimaryDarkColor)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
