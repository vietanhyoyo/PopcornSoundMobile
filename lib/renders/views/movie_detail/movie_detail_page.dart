import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_body/main_body.dart';
import 'package:popcorn_sound_mobile/components/widgets/song_v_list/song_v_list.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/movie_detail/movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Get width and height in screen of phone
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Obx(() => MainBody(
          isLoading: controller.isLoading.value,
          child: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight / 4,
                    child: Image.network(controller.movie.value.backdrop,
                        fit: BoxFit.cover),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black
                          .withOpacity(0.5), // Màu đen mờ với độ mờ 0.5
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_outlined)),
                    SizedBox(
                      height: screenHeight / 10,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(screenWidth * 0.1)),
                          child: SizedBox(
                            width: screenWidth / 2.2 - screenWidth * 0.025,
                            height:
                                (5 / 4) * screenWidth / 2 - screenWidth * 0.005,
                            child: Image.network(controller.movie.value.backdrop,
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: ResDimens.d8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.movie.value.name,
                                style: ResText.movieTitle,
                              ),
                               Row(
                                children: [
                                  const Icon(
                                    Icons.headphones,
                                    color: ResColors.primary,
                                  ),
                                  Text(
                                    " ${controller.movie.value.soundtrackCount.toString()} songs",
                                    style: ResText.primary,
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                    ResSpace.h8(),
                    const Divider(),
                    const Text(
                      'Description',
                      style: ResText.movieTitle,
                    ),
                    const Text(
                        'Doctor Strange in the Multiverse of Madness is a 2022 American superhero film based on Marvel Comics featuring the character Doctor Strange. Produced by Marvel Studios and distribute...'),
                    ResSpace.h8(),
                    const Divider(),
                    SongVList(items: controller.songList.value, audioPlayer: controller.player),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    ));
  }
}
