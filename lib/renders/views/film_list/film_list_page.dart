// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_flutter/pagination.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_body/main_body.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_scaffold/main_scaffold.dart';
import 'package:popcorn_sound_mobile/components/widgets/large_card_v_list/large_card_v_list.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_list/film_list_controller.dart';

class FilmListPage extends GetView<FilmListController> {
  const FilmListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Obx(() => MainBody(
          isLoading: controller.isLoading.value,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${controller.pageTitle.value}s', style: ResText.titleLarge),
                ResSpace.h8(),
                LargeCardVList(title: "${controller.pageTitle.value} list" ,items: controller.movieList.value),
                controller.movieList.value.length > 0 ? Pagination(
                  numOfPages: controller.lastPage.value,
                  selectedPage: controller.selectPage.value,
                  pagesVisible: 4,
                  onPageChanged: (page) {
                    controller.selectPage.value = page;
                    controller.getPlayListByType(page);
                  },
                  nextIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: ResColors.grey,
                    size: 14,
                  ),
                  previousIcon: const Icon(
                    Icons.arrow_back_ios,
                    color: ResColors.grey,
                    size: 14,
                  ),
                  activeTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  activeBtnStyle: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 2.0),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(40.0, 40.0),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all(ResColors.primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38),
                      ),
                    ),
                  ),
                  inactiveBtnStyle: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(40.0, 40.0),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                    )),
                  ),
                  inactiveTextStyle: const TextStyle(
                    color: ResColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ) : Container(),
                ResSpace.h16(),
              ]),
        )),
      ),
    );
  }
}
