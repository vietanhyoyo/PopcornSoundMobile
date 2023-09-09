import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.home);
    });
    return Scaffold(
        backgroundColor: ResColors.primary,
        body: Center(child: Padding(
          padding: const EdgeInsets.all(ResDimens.d30),
          child: Image.asset("assets/images/logo_primary.png"),
        ),)
    );
  }
}
