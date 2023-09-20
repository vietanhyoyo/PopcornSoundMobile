import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';

class MainBody extends StatelessWidget {
  final Widget child;
  final bool? isLoading;

  const MainBody({super.key, required this.child, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return isLoading == true
        ? SizedBox(
      height: screenHeight - 100,
          child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Center(child: CircularProgressIndicator(color: ResColors.primary,)),
            ],
          ),
        )
        : child;
  }
}
