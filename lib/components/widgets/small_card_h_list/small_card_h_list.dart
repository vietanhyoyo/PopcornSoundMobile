import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/home/home_controller.dart';

class SmallCardHList extends StatefulWidget {
  final List<Movie> items;

  const SmallCardHList({Key? key, required this.items}) : super(key: key);

  @override
  SmallCardHListState createState() => SmallCardHListState();
}

class SmallCardHListState extends State<SmallCardHList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hot Songs'),
        ResSpace.h8(),
        SizedBox(
          height: 132,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: ResDimens.d10),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(ResDimens.d10)),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(widget.items[index].thumbnail,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            ResSpace.h4(),
                            Text(
                              widget.items[index].name,
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
          ),
        ),
      ],
    );
  }
}
