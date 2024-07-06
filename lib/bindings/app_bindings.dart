
import 'package:get/get.dart';
import 'package:hire_me/controller/home_controller.dart';
import 'package:hire_me/controller/splash_controller.dart';
import 'package:hire_me/controller/started_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(StartedController());
    Get.lazyPut(() => HomeController());
    // Get.put(SettingsController());
  }
}
