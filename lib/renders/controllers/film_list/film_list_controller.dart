
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/services/repository/film_list_repository.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';

class FilmListController extends GetxController {
  //Api define
  final FilmListRepository filmListRepository = Get.find<FilmListRepository>();

  //Data
  RxList<FilmResponse> movieList = RxList([]);
  RxString pageTitle = RxString('Movie');

  //Controller
  ScrollController scrollController = ScrollController();
  RxInt selectPage = RxInt(1);
  RxInt lastPage = RxInt(1);
  RxBool isLoading = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getPlayListByType(1);
  }

  void getPlayListByType(int page) {
    var type = Get.arguments != null ? Get.arguments[0] : "movies";
    if(type == "movies") {
      pageTitle.value = "Movie";
    } else if(type == "shows") {
      pageTitle.value = "Show";
    }

    filmListRepository.getPlayListByType(type,page).then((res) {
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
}
