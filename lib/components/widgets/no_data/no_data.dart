
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';

class NoData extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ResDimens.d20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(Icons.more_horiz, size: 50, color: ResColors.grey,),
                Text("Empty data", style: ResText.grey,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}