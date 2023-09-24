import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/renders/controllers/welcome/welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Show advertisement from AdsHelper
    controller.initInterstitialAd();
    return Scaffold(
        backgroundColor: ResColors.primary,
        body: Center(child: Padding(
          padding: const EdgeInsets.all(ResDimens.d30),
          child: Image.asset("assets/images/logo_primary.png"),
        ),)
    );
  }
}
