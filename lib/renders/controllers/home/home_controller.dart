import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/services/repository/home_repository.dart';

class HomeController extends GetxController {
  //Api define
  final HomeRepository homeRepository = Get.find<HomeRepository>();

  //Data
  RxList<Movie> movieList = RxList([]);

  //Controller
  ScrollController scrollController = ScrollController();
  RxInt selectPage = RxInt(1);
  RxInt lastPage = RxInt(1);
  RxBool isLoading = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getMovieListFromPage(1);
  }

  void getMovieListFromPage(int page) {
    homeRepository.getPlaylists(page).then((res) {
      List dataMovieList = res["data"];
      List<Movie> array = [];

      dataMovieList.forEach((item) {
        final Movie newMovie = Movie(
            id: item["id"].toString(),
            slug: item["slug"].toString(),
            thumbnail: item["thumbnail"],
            name: item["name"],
            backdrop: item["backdrop"],
            soundtrackCount: item["soundtrack_count"] ?? 0);
        array.add(newMovie);
      });

      lastPage.value = res["last_page"];
      movieList.value = array;
      isLoading.value = false;
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }).catchError((e) {
      isLoading.value = false;
      print(e.toString());
    });
  }
}

class Movie {
  final String id;
  final String slug;
  final String thumbnail;
  final String name;
  final String backdrop;
  final int soundtrackCount;

  Movie(
      {required this.id,
      required this.thumbnail,
      required this.name,
      required this.slug,
      required this.backdrop,
      required this.soundtrackCount});
}
