import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_scaffold/main_scaffold.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_search/film_search_controller.dart';
import 'package:popcorn_sound_mobile/renders/views/film_search/cus_search_bar.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class FilmSearchPage extends GetView<FilmSearchController> {
  const FilmSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Get.isDarkMode;
    final screenWidth = MediaQuery.of(context).size.width;

    return MainScaffold(
        currentIndex: 1,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ResSpace.h50(),
                ResSpace.h32(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.filmList, arguments: ['movies']);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth - ResDimens.d16,
                        height: 160.sp,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(ResDimens.d20),
                          boxShadow: [isDarkMode ? BoxShadow() :
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Colors.red.shade900,
                              Colors.red.shade300,
                              Colors.blue.shade300
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 0.7, 1.0],
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(ResDimens.d16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Movies',
                                style: ResText.whiteTitleLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: CustomPaint(
                          size: Size(100.sp, 150.sp),
                          painter: CustomCardShapePainter(
                              24.sp, Colors.redAccent, Colors.orangeAccent),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.movie_filter_outlined,
                                  size: 100.sp,
                                  color: ResColors.white,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                ResSpace.h16(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.filmList, arguments: ['shows']);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth - ResDimens.d16,
                        height: 160.sp,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(ResDimens.d20),
                          boxShadow: [isDarkMode ? BoxShadow() :
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade900,
                              Colors.blue.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(ResDimens.d16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shows',
                                style: ResText.whiteTitleLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: CustomPaint(
                          size: Size(100.sp, 150.sp),
                          painter: CustomCardShapePainter(
                              24.sp, Colors.purple.shade900, Colors.blue.shade900),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.live_tv,
                                  size: 100.sp,
                                  color: ResColors.white,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                ResSpace.h16(),
              ]),
              CusSearchBar(onSearch: (value) {
                return controller.onSearchByName(value!);
              }),
            ],
          ),
        ));
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
