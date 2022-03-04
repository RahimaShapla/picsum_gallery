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

int fragmentType = 1;

class _ContainerActivityState extends State<ContainerActivity> {
  int bottomTrack = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        bottomNavigationBar: bottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: DimenHeight.height_80,
          width: DimenHeight.height_80,
          child:  FloatingActionButton(
              elevation: 0.0,
              onPressed: () {  },
              child: const Image(
                image: AssetImage("assets/images/ic_image.png"),

              ),
              // backgroundColor: kPrimaryColor,
             /* onPressed: () {
                setState(() {
                  fragmentType = 2;
                  bottomTrack == 1;
                });
              }*/),
        ),
        body: loadBody(fragmentType));
  }

  loadBody(int position) {
    switch (position) {
      case 1:
        return const HomeActivity();
      case 2:
        return const HomeActivity();
      default:
        return Container();
    }
  }



  Widget bottomBar() {
    return Container(
      //margin: EdgeInsets.only(top: 70),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 80,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 0.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  fragmentType = 1;
                  bottomTrack == 0;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                 Icons.home,
                    size: 30,
                    color: bottomTrack == 0 ? kLightGreyColor : kLightMint,
                  ),
                  Text(
                    "Home",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: TextSize.Text_Size_14,
                        fontFamily: "Gilroy-Medium",
                        color: bottomTrack == 0 ? kLightGreyColor : kLightMint),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                "PGallery",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: TextSize.Text_Size_14,
                    fontFamily: "Poppins-Regular",
                    color: bottomTrack == 1 ? kLightGreyColor : kLightMint),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_box_rounded,
                  size: 30,
                  color: bottomTrack == 2 ? kLightGreyColor : kLightMint,
                ),
                Text(
                  "Profile",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: TextSize.Text_Size_14,
                      fontFamily: "Gilroy-Medium",
                      color: bottomTrack == 2 ? kLightGreyColor : kLightMint),
                ),
              ],
            ),
          ],
        ));
  }
}
