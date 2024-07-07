import 'package:get/get.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/settings.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_helper.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    startApp();
    super.onInit();
  }

  Future startApp() {
    print('SPLASH TOKEN: ${AppHelper.getCurrentUserToken()}');
    if(AppHelper.getCurrentUserToken() != null){
      return Future.delayed(
          const Duration(seconds: 5), () => Get.offAndToNamed(Routes.home));
    }else {
      return Future.delayed(
          const Duration(seconds: 5), () => Get.offAndToNamed(Routes.started));
    }

  }

}