import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/film_list/film_list_controller.dart';
import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/repository/home_repository.dart';

class FilmListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHelper());
    Get.lazyPut(() => HomeRepository(Get.find()));
    Get.lazyPut(() => FilmListController());
  }
}
