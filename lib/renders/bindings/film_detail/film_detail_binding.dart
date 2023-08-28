import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_detail/film_detail_controller.dart';
import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/repository/film_detail_repository.dart';

class FilmDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHelper());
    Get.lazyPut(() => FilmDetailRepository(Get.find()));
    Get.lazyPut(() => FilmDetailController());
  }
}
