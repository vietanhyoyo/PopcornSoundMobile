import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
