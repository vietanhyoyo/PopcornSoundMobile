import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/movie_detail/movie_detail_controller.dart';
import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/repository/movie_detail_repository.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHelper());
    Get.lazyPut(() => MovieDetailRepository(Get.find()));
    Get.lazyPut(() => MovieDetailController());
  }
}
