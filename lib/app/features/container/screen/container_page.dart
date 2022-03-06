import 'package:flutter/material.dart';
import 'package:picsum_gallery/app/features/home/screen/home_page.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';

class ContainerActivity extends StatefulWidget {
  const ContainerActivity({Key? key}) : super(key: key);

  @override
  _ContainerActivityState createState() {
    return _ContainerActivityState();
  }
}

class _ContainerActivityState extends State<ContainerActivity> {
  int bottomTrack = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        //  appBar: Utility.instance.appBar(),
        bottomNavigationBar: bottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: DimenHeight.height_80,
          width: DimenHeight.height_80,
          child: FloatingActionButton(
              elevation: 0.0,
              child: const Image(
                image: AssetImage("assets/images/ic_image.png"),
              ),
              onPressed: () {}),
        ),
        body: const HomeActivity());
  }

  loadBody(int position) {
    switch (position) {
      case 1:
        return const HomeActivity();
      case 2:
        return Container();
      default:
        return Container();
    }
  }

  Widget bottomBar() {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: DimenHeight.height_80,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kAccentColor,
              offset: Offset(1.0, 0.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          /*    borderRadius: BorderRadius.only(
              topLeft: Radius.circular(DimenHeight.height_25),
              topRight: Radius.circular(DimenHeight.height_25),
            )*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: DimenHeight.height_30,
                    color: bottomTrack == 1 ? kLightMint : kLightGreyColor,
                  ),
                  Text(
                    "Home",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: TextSize.textSize14,
                        fontFamily: "Gilroy-Medium",
                        color: bottomTrack == 0 ? kLightMint : kLightGreyColor),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: DimenHeight.height_32),
              child: const Text(
                "PGallery",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: TextSize.textSize14,
                    fontFamily: "Poppins-Regular",
                    color: kLightGreyColor),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.account_box_rounded,
                    size: DimenHeight.height_30,
                    color: kLightGreyColor,
                  ),
                  Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: TextSize.textSize14,
                        fontFamily: "Gilroy-Medium",
                        color: kLightGreyColor),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
