import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final bool? notSafeArea;
  final Widget? appBar;

  const MainScaffold(
      {super.key,
      required this.body,
      required this.currentIndex,
      this.notSafeArea = false, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar as PreferredSizeWidget?,
      body: notSafeArea == false ? SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ResDimens.d16),
        child: body,
      )) : body,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ResDimens.d20),
          topRight: Radius.circular(ResDimens.d20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          onTap: (index) {
            if (index == 0) {
              Get.offNamed(AppRoutes.home);
            } else if (index == 1) {
              Get.offNamed(AppRoutes.filmSearch);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play_rounded),
              label: 'Play list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
