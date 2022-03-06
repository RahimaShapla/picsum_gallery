import 'package:flutter/material.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';
import 'package:picsum_gallery/helper/data/model/response/banner_response.dart';
import 'package:picsum_gallery/helper/utility/function_util.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ImageDetailActivity extends StatefulWidget {
  final ImageModel imageModel;

  const ImageDetailActivity({Key? key, required this.imageModel})
      : super(key: key);

  @override
  _ImageDetailActivityState createState() => _ImageDetailActivityState();
}

class _ImageDetailActivityState extends State<ImageDetailActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransparent,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Zoom(
                  opacityScrollBars: 0.9,
                  scrollWeight: 0.0,
                  centerOnScale: true,
                  enableScroll: true,
                  doubleTapZoom: true,
                  zoomSensibility: 2.3,
                  initZoom: 0.0,
                  backgroundColor: kLightMint,
                  maxZoomWidth: 1800,
                  maxZoomHeight: 1800,
                  onTap: () {
                    //print("Widget clicked");
                  },
                  child: Image(
                    image: NetworkImage(widget.imageModel.downloadURL!),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  )),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FunctionUtility.instance.share(
                            widget.imageModel.downloadURL,
                            widget.imageModel.author);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: kWhiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor,
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.share)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        FunctionUtility.instance.saveImage(
                            context,
                            widget.imageModel.downloadURL!,
                            widget.imageModel.id!);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: kWhiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor,
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.save_alt_rounded)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
