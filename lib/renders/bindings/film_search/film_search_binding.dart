import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_search/film_search_controller.dart';
import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/repository/film_search_response.dart';

class FilmSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHelper());
    Get.lazyPut(() => FilmSearchRepository(Get.find()));
    Get.lazyPut(() => FilmSearchController());
  }
}
