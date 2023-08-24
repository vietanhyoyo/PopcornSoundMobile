import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/movie_search/movie_search_controller.dart';

class MovieSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieSearchController());
  }
}
