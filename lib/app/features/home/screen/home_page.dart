import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picsum_gallery/app/features/home/bloc/home_image_bloc.dart';
import 'package:picsum_gallery/helper/constant/constants.dart';
import 'package:picsum_gallery/helper/data/model/response/banner_response.dart';
import 'package:picsum_gallery/helper/network/api_response.dart';
import 'package:picsum_gallery/helper/router/not_found_page.dart';
import 'package:picsum_gallery/helper/router/route_constants.dart';
import 'package:picsum_gallery/helper/utility/view_util.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  final ScrollController _scrollController = ScrollController();
  HomeImageBloc? _homeImageBloc;
  List<ImageModel> imageList = [];
  int page = 1;

  @override
  void initState() {
    _homeImageBloc = HomeImageBloc();
    _homeImageBloc!.getImageList(context, page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _homeImageBloc!.getImageList(context, page);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return homeBuild();
  }

  Widget homeBuild() {
    return StreamBuilder<ApiResponse<ImageResponse>>(
      stream: _homeImageBloc!.subject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.status == Status.COMPLETE) {
            if (snapshot.data!.data != null) {
              if (snapshot.data!.data!.imageList != null) {
                imageList.addAll(snapshot.data!.data!.imageList!);
                page++;
              }
            }
          }
        }
        return unevenGridTile();
      },
    );
  }

  /// This function return a list of grid widget to show network images
  Widget unevenGridTile() {
    return imageList.isEmpty
        ? const NotFoundPage()
        : MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: imageList.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    detail,
                    arguments: imageList[index],
                  );
                },
                child: Container(
                    height: (index % 5 + 1) * 100,
                    decoration: const BoxDecoration(
                      color: kMildMint,
                      shape: BoxShape.rectangle,
                    ),
                    child: Image(
                      image: NetworkImage("https://picsum.photos/id/" +
                          imageList[index].id.toString() +
                          "/200/300"),
                      fit: BoxFit.fill,
                    )),
              );
            },
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
