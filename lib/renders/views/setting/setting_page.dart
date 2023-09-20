import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_scaffold/main_scaffold.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/setting/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        currentIndex: 3,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResSpace.h16(),
            Text('Mode', style: ResText.movieTitle,),
            Row(
              children: [
                Text("Light"),
                Obx(() => SizedBox(
                  width: 60.sp,
                  height: 50.sp,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                          activeColor: ResColors.primary,
                          value: controller.isDarkMode.value,
                          onChanged: (value) {
                            Get.changeThemeMode(controller.isDarkMode.value
                                ? ThemeMode.light
                                : ThemeMode.dark);
                            controller.isDarkMode.value = value;
                          },
                        ),
                  ),
                )),
                Text("Dark"),
              ],
            ),
          ],
        )));
  }
}
