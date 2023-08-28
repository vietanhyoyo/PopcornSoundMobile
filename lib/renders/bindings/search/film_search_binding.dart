import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_search/film_search_controller.dart';

class FilmSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilmSearchController());
  }
}
