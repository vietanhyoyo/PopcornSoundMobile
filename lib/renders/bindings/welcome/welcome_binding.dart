import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
