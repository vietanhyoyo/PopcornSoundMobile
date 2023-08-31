import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/services/repository/home_repository.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';

class HomeController extends GetxController {
  //Api define
  final HomeRepository homeRepository = Get.find<HomeRepository>();

  //Data
  RxList<FilmResponse> movieList = RxList([]);
  RxList<FilmResponse> hotFilmList = RxList([]);

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

      List<FilmResponse> array = FilmResponse.listFormJson(dataMovieList);

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

      List<FilmResponse> array = FilmResponse.listFormJson(dataMovieList);

      hotFilmList.value = array;
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
      print(e.toString());
    });
  }
}
