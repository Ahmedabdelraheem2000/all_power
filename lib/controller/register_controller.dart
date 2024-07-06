import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_helper.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  bool isCheck = false;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController usernameController;
  late TextEditingController idCardController;
  late TextEditingController phoneNumberController;
  late TextEditingController dateBirthTextController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String? selectedGender;
  RxString? genderSelected = ''.obs;
  String dateSelected = '';
  DateTime date = DateTime(2023, 1, 19);

  final List<String> listGender = ['male'.tr, 'female'.tr];

  @override
  void onInit() {
    super.onInit();

    formKey = GlobalKey();

    usernameController = TextEditingController();
    idCardController = TextEditingController();
    phoneNumberController = TextEditingController();
    dateBirthTextController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    usernameController.dispose();
    idCardController.dispose();
    phoneNumberController.dispose();
    dateBirthTextController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void showDateDialog(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) return;
    date = newDate;
    int year = date.year;
    int month = date.month;
    int day = date.day;
    // controller.birthDateController.text =
    dateSelected = '$year-$month-$day';
    update();
  }

  String getDateToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
  }

  void createAccount() async {
    isLoading(true);
    await ApiRequests.register(
            name: usernameController.text,
            idCard: idCardController.text,
            email: emailController.text,
            phone: phoneNumberController.text,
            dateOfBirth: /*dateSelected*/ AppHelper.getDateToday(),
            gender: /*selectedGender!,*/'male',
            password: passwordController.text)
        .then((value) {
      if (value != null) {
        isLoading(false);
        // PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: value.result!.user!);
        // PreferencesManager.saveUserToken(
        //     key: Const.KEY_USER_TOKEN, token: value.result!.token!)
        //     .then((value) => Get.offAndToNamed(Routes.doneRegistration));
        Get.offAndToNamed(Routes.doneRegistration);
        clearData();
      } else {
        isLoading(false);
      }
    }, onError: (error) {
      print('onError: ${error.toString()}');
      isLoading(false);
    }).catchError((error) {
      print('catchError: ${error.toString()}');
      isLoading(false);
    });
  }

  void clearData() {
    usernameController.clear();
    idCardController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    dateSelected = '';
    selectedGender = '';
  }
}
