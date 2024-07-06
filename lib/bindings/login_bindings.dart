
import 'package:get/get.dart';
import 'package:hire_me/controller/login_controller.dart';

class LoginBinging extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}