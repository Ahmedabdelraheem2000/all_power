
import 'package:get/get.dart';
import 'package:hire_me/controller/register_controller.dart';

class RegisterBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}