
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/home/home_controller.dart';
import 'package:popcorn_sound_mobile/services/repository/home_repository.dart';

class FilmListController extends GetxController {
  //Api define
  final HomeRepository homeRepository = Get.find<HomeRepository>();

  //Data
  RxList<Movie> movieList = RxList([]);
  RxList<Movie> hotFilmList = RxList([]);

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
    getHotFilms();
  }

  void getMovieListFromPage(int page) {
    homeRepository.getPlayLists(page).then((res) {
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

  void getHotFilms() {
    homeRepository.getHotFilms().then((res) {
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
      hotFilmList.value = array;
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
      print(e.toString());
    });
  }
}
