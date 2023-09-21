import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/widgets/no_data/no_data.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class LargeCardVList extends StatefulWidget {
  final List<FilmResponse> items;
  final String? title;

  const LargeCardVList({Key? key, required this.items, this.title}) : super(key: key);

  @override
  LargeCardVListState createState() => LargeCardVListState();
}

class LargeCardVListState extends State<LargeCardVList> {

  bool isDarkMode = Get.isDarkMode;
  int isOverlayVisible = -1;
  double width = 160.0;
  double height = 230.0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(widget.title ?? 'Movie List'),
        ResSpace.h8(),
        widget.items.length > 0 ? ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.items.length ~/ 2,
          itemBuilder: (context, rowIndex) {
            final startIndex = rowIndex * 2;

            return Padding(
              padding: const EdgeInsets.only(bottom: ResDimens.d20),
              child: Row(
                children: [
                  _buildImage(startIndex, (screenWidth - 60) / 2),
                  const SizedBox(width: ResDimens.d20),
                  _buildImage(startIndex + 1, (screenWidth - 60) / 2),
                ],
              ),
            );
          },
        ) : NoData(),
      ],
    );
  }

  Widget _buildImage(int index, double width) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.filmDetail,
            arguments: [widget.items[index]]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(ResDimens.d10)),
          boxShadow: [isDarkMode ? BoxShadow() :
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(ResDimens.d10)),
          child: Container(
            width: width,
            height: width + 90.h,
            decoration: BoxDecoration(
              color: isDarkMode ? ResColors.black2 : ResColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: width,
                    height: width,
                    child: Image.network(widget.items[index].thumbnail!,
                        fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ResDimens.d8, vertical: ResDimens.d4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.items[index].name!,
                        maxLines: 2,
                      ),
                      ResSpace.h4(),
                      Row(
                        children: [
                          Icon(Icons.headphones, color: isDarkMode ? ResColors.grey : ResColors.black2, size: 16.0.w,),
                          Text(
                            ' ${widget.items[index].soundtrackCount} songs',
                            maxLines: 1,
                            style: isDarkMode ? ResText.grey : ResText.black2,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
