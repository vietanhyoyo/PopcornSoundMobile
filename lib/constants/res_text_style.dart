import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_fonts.dart';

class ResText {
  static const TextStyle titleLarge =
      TextStyle(fontSize: ResDimens.d26, fontWeight: FontWeight.w600);
  static const TextStyle whiteTitleLarge = TextStyle(
      fontSize: ResDimens.d26,
      fontWeight: FontWeight.w600,
      color: ResColors.white);
  static const TextStyle cardName = TextStyle(height: 1);
  static const TextStyle songName = TextStyle(fontSize: 13);
  static const TextStyle movieTitle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const TextStyle primary = TextStyle(color: ResColors.primary);
  static const TextStyle grey = TextStyle(color: ResColors.grey);
  static const TextStyle white = TextStyle(color: ResColors.white);
  static const TextStyle black2 = TextStyle(color: ResColors.black2);
}

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      fontFamily: ResFonts.roboto),
  displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      fontFamily: ResFonts.roboto),
  displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      fontFamily: ResFonts.roboto),
  headlineMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 22 / 14,
      fontFamily: ResFonts.roboto),
  titleLarge: TextStyle(
      fontFamily: ResFonts.roboto,
      fontSize: 20,
      fontWeight: FontWeight.w300,
      height: 26 / 20),
  titleMedium: TextStyle(
      fontFamily: ResFonts.roboto,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      height: 24 / 16),
  titleSmall: TextStyle(
      fontFamily: ResFonts.roboto,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyLarge: TextStyle(
      fontFamily: ResFonts.roboto,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyMedium: TextStyle(
      fontFamily: ResFonts.roboto,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodySmall: TextStyle(
      fontFamily: ResFonts.roboto,
      fontSize: 13,
      fontWeight: FontWeight.w300,
      height: 20 / 13),
).apply();

TextTheme textLightTheme = const TextTheme(
  displayLarge: TextStyle(
      color: ResColors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      fontFamily: ResFonts.roboto),
  displayMedium: TextStyle(
      color: ResColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      fontFamily: ResFonts.roboto),
  displaySmall: TextStyle(
      color: ResColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      fontFamily: ResFonts.roboto),
  headlineMedium: TextStyle(
      color: ResColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 22 / 14,
      fontFamily: ResFonts.roboto),
  titleLarge: TextStyle(
      color: ResColors.black,
      fontFamily: ResFonts.roboto,
      fontSize: 20,
      fontWeight: FontWeight.w300,
      height: 26 / 20),
  titleMedium: TextStyle(
      color: ResColors.black,
      fontFamily: ResFonts.roboto,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      height: 24 / 16),
  titleSmall: TextStyle(
      color: ResColors.black,
      fontFamily: ResFonts.roboto,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyLarge: TextStyle(
      color: ResColors.black,
      fontFamily: ResFonts.roboto,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyMedium: TextStyle(
      color: ResColors.black,
      fontFamily: ResFonts.roboto,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodySmall: TextStyle(
      color: ResColors.black,
      fontFamily: ResFonts.roboto,
      fontSize: 13,
      fontWeight: FontWeight.w300,
      height: 20 / 13),
).apply();
