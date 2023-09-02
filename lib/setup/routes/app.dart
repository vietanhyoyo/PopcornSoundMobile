import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/bindings/film_detail/film_detail_binding.dart';
import 'package:popcorn_sound_mobile/renders/bindings/film_list/film_list_binding.dart';
import 'package:popcorn_sound_mobile/renders/bindings/film_search/film_search_binding.dart';
import 'package:popcorn_sound_mobile/renders/bindings/home/home_binding.dart';
import 'package:popcorn_sound_mobile/renders/bindings/setting/setting_binding.dart';
import 'package:popcorn_sound_mobile/renders/views/film_detail/film_detail_page.dart';
import 'package:popcorn_sound_mobile/renders/views/film_list/film_list_page.dart';
import 'package:popcorn_sound_mobile/renders/views/film_search/film_search_page.dart';
import 'package:popcorn_sound_mobile/renders/views/home/home_page.dart';
import 'package:popcorn_sound_mobile/renders/views/setting/setting_page.dart';
import 'package:popcorn_sound_mobile/renders/views/welcome/welcome_page.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.welcome;

  static final routes = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.filmSearch,
      page: () => const FilmSearchPage(),
      binding: FilmSearchBinding(),
    ),
    GetPage(
      name: AppRoutes.filmDetail,
      page: () => const FilmDetailPage(),
      binding: FilmDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.filmList,
      page: () => const FilmListPage(),
      binding: FilmListBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
