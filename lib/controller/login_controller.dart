import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/auth/user.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/preferences_manager.dart';

class LoginController extends GetxController{

  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController phoneController;
  late TextEditingController passwordController;


  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
    // userNameController.text = "ahmed@mail.com";
    // passwordController.text = "12345678";
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void login({required String phone, required String password}) {
    bool isValidate = formKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      ApiRequests.login(
        language: AppHelper.getAppLanguage(),
          phone: phone,
          password: password)
          .then((value) {
        if (value != null) {
          isLoading(false);
          User user = value.result!.user!;
          if(user.status == 1){
            print('STATUS: ${value.status}');
            PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: value.result!.user!);
            PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: value.result!.token!).then((value) => Get.offAndToNamed(Routes.home));
            phoneController.clear();
            passwordController.clear();
          }else {
            AppHelper.showToast(message: 'account_not_register_yest', color: Colors.redAccent);
          }
          
        } else {
          isLoading(false);
        }
      }).catchError((error) {
        isLoading(false);
        print('catchError: $error');
      });
    } else {
      isLoading(false);
    }
  }

}