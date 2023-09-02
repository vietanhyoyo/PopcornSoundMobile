import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/setup/themes/custom_theme.dart';

final CustomTheme theme1 = CustomTheme(
    lightTheme: ThemeData.light().copyWith(
      primaryColor: ResColors.primary,
      primaryColorLight: ResColors.primary,
      primaryColorDark: ResColors.primary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ResColors.white,
        selectedItemColor: ResColors.primary,
        unselectedItemColor: ResColors.black2,
      ),
      textTheme: textLightTheme,
      scaffoldBackgroundColor: ResColors.white1,
    ),
    darkTheme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ResColors.black1,
      primaryColor: ResColors.primary,
      primaryColorLight: ResColors.primary,
      primaryColorDark: ResColors.primary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ResColors.black2,
        selectedItemColor: ResColors.primary,
        unselectedItemColor: ResColors.grey,
      ),
      textTheme: textTheme,
    ));
