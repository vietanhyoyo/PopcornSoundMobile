import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/widgets/no_data/no_data.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class SmallCardHList extends StatefulWidget {
  final List<FilmResponse> items;
  final String? title;

  const SmallCardHList({Key? key, required this.items, this.title})
      : super(key: key);

  @override
  SmallCardHListState createState() => SmallCardHListState();
}

class SmallCardHListState extends State<SmallCardHList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title ?? 'Hot Songs'),
        ResSpace.h8(),
        SizedBox(
          height: 132.w,
          child: widget.items.length > 0
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: ResDimens.d10),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.filmDetail,
                              arguments: [widget.items[index]]);
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(ResDimens.d10)),
                                    child: SizedBox(
                                      width: 100.w,
                                      height: 100.w,
                                      child: Image.network(
                                          widget.items[index].thumbnail!,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  ResSpace.h4(),
                                  Text(
                                    widget.items[index].name!,
                                    style: ResText.cardName,
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : NoData(),
        ),
      ],
    );
  }
}
