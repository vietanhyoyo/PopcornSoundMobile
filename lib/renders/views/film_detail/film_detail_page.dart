import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_body/main_body.dart';
import 'package:popcorn_sound_mobile/components/widgets/song_v_list/song_v_list.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_detail/film_detail_controller.dart';
import 'package:popcorn_sound_mobile/services/response/episode_response.dart';
import 'package:popcorn_sound_mobile/services/response/season_response.dart';

class FilmDetailPage extends GetView<FilmDetailController> {
  const FilmDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Get width and height in screen of phone
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var isDarkMode = Get.isDarkMode;

    //Show advertisement from AdsHelper
    controller.initInterstitialAd();

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
                        child: Image.network(controller.film.value.backdrop!,
                            fit: BoxFit.cover),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
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
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: ResColors.white,
                              size: 24.sp,
                            )),
                        SizedBox(
                          height: screenHeight / 10,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenWidth * 0.03)),
                              child: SizedBox(
                                width: screenWidth / 2.2 - screenWidth * 0.025,
                                height: (9 / 8) * screenWidth / 2 -
                                    screenWidth * 0.005,
                                child: Image.network(
                                    controller.film.value.thumbnail!,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: ResDimens.d8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.film.value.name!,
                                    style: ResText.movieTitle,
                                  ),
                                  controller.seasonList.isNotEmpty
                                      ? DropdownButton<SeasonResponse>(
                                          value: controller.seasonSelect.value,
                                          onChanged: (newValue) async {
                                            controller.seasonSelect.value =
                                                newValue!;
                                            await controller.getEpBySeason(
                                                newValue.slug ?? "");
                                          },
                                          items:
                                              controller.seasonList.map((item) {
                                            return DropdownMenuItem<
                                                SeasonResponse>(
                                              value: item,
                                              child: Text(item.name ?? ''),
                                            );
                                          }).toList(),
                                        )
                                      : Container(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.headphones,
                                        color: ResColors.primary,
                                      ),
                                      Text(
                                        " ${controller.film.value.soundtrackCount.toString()} songs",
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
                        controller.film.value.description != null ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            Text(
                              'Description',
                              style: ResText.movieTitle,
                            ),
                            Text(
                                controller.film.value.description ?? ""),
                          ],
                        ) : Container(),
                        ResSpace.h8(),
                        const Divider(),
                        controller.episodeList.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    'Episode:',
                                    style: ResText.songName,
                                  ),
                                  ResSpace.w8(),
                                  Flexible(
                                    child: DropdownButton<EpisodeResponse>(
                                      isExpanded: true,
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? ResColors.white
                                              : ResColors.black,
                                          overflow: TextOverflow.visible,
                                      fontSize: 14.sp),
                                      value: controller.episodeSelect.value,
                                      onChanged: (newValue) async {
                                        controller.episodeSelect.value =
                                            newValue!;
                                        await controller
                                            .getSoundTrack(newValue.slug ?? "");
                                      },
                                      items: controller.episodeList.map((item) {
                                        return DropdownMenuItem<
                                            EpisodeResponse>(
                                          value: item,
                                          child: Text(
                                            item.name ?? '',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        controller.isSongLoading.value
                            ? SizedBox(
                                height: 100.sp,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: ResColors.primary,
                                )),
                              )
                            : controller.songList.isNotEmpty
                                ? SongVList(
                                    items: controller.songList,
                                    audioPlayer: controller.player)
                                : Container(),
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
