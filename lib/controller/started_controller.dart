import 'package:get/get.dart';
import 'package:hire_me/routes/routes.dart';

class StartedController extends GetxController{


  @override
  void onInit() {
    // startApp();
    super.onInit();
  }

  Future startApp() {
    return Future.delayed(
        const Duration(seconds: 3), () => Get.offAndToNamed(Routes.home));
  }

}