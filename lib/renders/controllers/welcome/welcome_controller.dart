import 'dart:async';

import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';
import 'package:popcorn_sound_mobile/utils/ads_helper.dart';

class WelcomeController extends GetxController with AdsHelper {
  @override
  void onInit() {

    super.onInit();

    Timer(Duration(seconds: 2), () {
      print("time");
      Get.offNamed(AppRoutes.home);
    });
  }
}
