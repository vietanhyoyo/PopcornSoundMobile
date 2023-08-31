import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_list/film_list_controller.dart';
import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/repository/film_list_repository.dart';

class FilmListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHelper());
    Get.lazyPut(() => FilmListRepository(Get.find()));
    Get.lazyPut(() => FilmListController());
  }
}
