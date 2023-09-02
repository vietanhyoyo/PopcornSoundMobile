import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class CusSearchBar extends StatefulWidget {
  final Future<dynamic> Function(String?)? onSearch;

  const CusSearchBar({super.key, this.onSearch});

  @override
  StateCusSearchBar createState() => StateCusSearchBar();
}

class StateCusSearchBar extends State<CusSearchBar> {
  List<FilmResponse> items = [];

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Get.isDarkMode;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: ResColors.grey),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) async {
                      if (value == "") {
                        setState(() {
                          items = [];
                        });
                      } else if (value.length > 1) {
                        if (widget.onSearch != null) {
                          try {
                            final res = await widget.onSearch!(value);
                            setState(() {
                              items = FilmResponse.listFormJson(res);
                            });
                          } catch (e) {
                            print(e);
                          }
                        }
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: items.length == 0 ? 0 : screenHeight,
          child: Padding(
            padding: const EdgeInsets.only(top: 82),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? ResColors.black1 : ResColors.white1,
                      border: Border(
                          top: BorderSide(
                              color: isDarkMode
                                  ? ResColors.black2
                                  : ResColors.grey,
                              width: 1)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.filmDetail,
                              arguments: [items[index]]);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ResDimens.d10)),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.network(items[index].thumbnail!,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            ResSpace.w8(),
                            Expanded(child: Text(items[index].name!))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
