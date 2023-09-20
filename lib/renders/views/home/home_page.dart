// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pagination_flutter/pagination.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_body/main_body.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_scaffold/main_scaffold.dart';
import 'package:popcorn_sound_mobile/components/widgets/large_card_v_list/large_card_v_list.dart';
import 'package:popcorn_sound_mobile/components/widgets/small_card_h_list/small_card_h_list.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Obx(() => MainBody(
              isLoading: controller.isLoading.value,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Discovery', style: ResText.titleLarge),
                    SmallCardHList(
                      title: "Popular",
                      items: controller.hotFilmList.value,
                    ),
                    ResSpace.h8(),
                    LargeCardVList(title: "Film list" ,items: controller.movieList.value),
                    controller.movieList.value.length > 0 ? Pagination(
                      numOfPages: controller.lastPage.value,
                      selectedPage: controller.selectPage.value,
                      pagesVisible: 4,
                      onPageChanged: (page) {
                        controller.selectPage.value = page;
                        controller.getMovieListFromPage(page);
                      },
                      nextIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: ResColors.grey,
                        size: 14.w,
                      ),
                      previousIcon: Icon(
                        Icons.arrow_back_ios,
                        color: ResColors.grey,
                        size: 14.w,
                      ),
                      activeTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      activeBtnStyle: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 2.0.sp),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(40.0.sp, 40.0.sp),
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
                          Size(40.0.sp, 40.0.sp),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        )),
                      ),
                      inactiveTextStyle: TextStyle(
                        color: ResColors.grey,
                        fontSize: 14.sp,
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
