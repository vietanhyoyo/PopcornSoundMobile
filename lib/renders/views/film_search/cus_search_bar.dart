
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';

class CusSearchBar extends StatefulWidget{

  @override
  StateCusSearchBar createState() => StateCusSearchBar();
}

class StateCusSearchBar extends State<CusSearchBar> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: ResColors.grey),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder
                    .none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}