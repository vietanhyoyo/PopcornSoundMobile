import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/renders/controllers/home/home_controller.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class LargeCardHList extends StatefulWidget {
  final List<Movie> items;

  const LargeCardHList({Key? key, required this.items}) : super(key: key);

  @override
  LargeCardHListState createState() => LargeCardHListState();
}

class LargeCardHListState extends State<LargeCardHList> {
  int isOverlayVisible = -1;
  double width = 170.0;
  double height = 250.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hot Movies'),
        ResSpace.h8(),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: ResDimens.d10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isOverlayVisible == index) {
                        isOverlayVisible = -1;
                      } else {
                        isOverlayVisible = index;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(ResDimens.d20)),
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: Image.network(widget.items[index].thumbnail,
                              fit: BoxFit.cover),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 100),
                        bottom: isOverlayVisible == index ? 0 : -160,
                        // height: isOverlayVisible == index ? 200 : 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(ResDimens.d20)),
                          child: Container(
                            width: width,
                            height: 160,
                            color: Colors.black87,
                            child: Padding(
                              padding: const EdgeInsets.all(ResDimens.d8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.items[index].name),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.movieDetail,
                                          arguments: [widget.items[index].id]);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
