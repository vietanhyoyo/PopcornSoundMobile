import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/bindings/home/home_binding.dart';
import 'package:popcorn_sound_mobile/renders/bindings/movie_detail/movie_detail_binding.dart';
import 'package:popcorn_sound_mobile/renders/bindings/movie_search/movie_search_binding.dart';
import 'package:popcorn_sound_mobile/renders/views/home/home_page.dart';
import 'package:popcorn_sound_mobile/renders/views/movie_detail/movie_detail_page.dart';
import 'package:popcorn_sound_mobile/renders/views/movie_search/movie_search_page.dart';
import 'package:popcorn_sound_mobile/renders/views/welcome/welcome_page.dart';
import 'package:popcorn_sound_mobile/setup/routes/routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;

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
      name: AppRoutes.movieSearch,
      page: () => const MovieSearchPage(),
      binding: MovieSearchBinding(),
    ),
    GetPage(
      name: AppRoutes.movieDetail,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding(),
    ),
  ];
}
