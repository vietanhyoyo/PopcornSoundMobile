import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/home/home_controller.dart';
import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/repository/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHelper());
    Get.lazyPut(() => HomeRepository(Get.find()));
    Get.lazyPut(() => HomeController());
  }
}
