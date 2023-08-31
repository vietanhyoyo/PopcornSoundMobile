import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/services/repository/film_search_response.dart';

class FilmSearchController extends GetxController {
  // Api define
  final FilmSearchRepository filmSearchRepository =
      Get.find<FilmSearchRepository>();

  Future<dynamic> onSearchByName(String name) {
     return filmSearchRepository.searchByName(name);
  }
}
