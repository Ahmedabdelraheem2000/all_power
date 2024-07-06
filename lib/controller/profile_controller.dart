import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/preferences_manager.dart';

import '../model/auth/user.dart';

class ProfileController extends GetxController{

  RxBool isLoading = false.obs;
  XFile? profileImage;

  late GlobalKey<FormState> formKey;
  late TextEditingController usernameController;
  late TextEditingController idCardController;
  late TextEditingController phoneNumberController;
  late TextEditingController dateBirthTextController;
  late TextEditingController emailController;

  String? selectedGender;
  RxString? genderSelected = ''.obs;
  String dateSelected = '';
  DateTime date = DateTime(2023, 1, 19);

  final List<String> listGender = [
    'male'.tr,
    'female'.tr
  ];

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey();
    usernameController = TextEditingController();
    idCardController = TextEditingController();
    phoneNumberController = TextEditingController();
    dateBirthTextController = TextEditingController();
    emailController = TextEditingController();

    if(AppHelper.getCurrentUser() != null){
      User user = AppHelper.getCurrentUser()!;
      usernameController.text = user.name!;
      idCardController.text = user.idCard??'';
      phoneNumberController.text = user.phone!;
      emailController.text = user.email!;
    }

  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    usernameController.dispose();
    idCardController.dispose();
    phoneNumberController.dispose();
    dateBirthTextController.dispose();
    emailController.dispose();

    super.dispose();
  }

  void requestStoragePermission() async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("storage permission: ${statuses[Permission.storage]}");
      pickImageGallary(isCamera: false);
    }else {
      pickImageGallary(isCamera: false);
    }
  }

  void pickImageGallary({required bool isCamera}) async {
    final ImagePicker picker = ImagePicker();
    profileImage = await picker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
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

  String getDateTody(){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
  }

  void updateProfile(BuildContext context) async {
    isLoading(true);
    await ApiRequests.editProfile(language: AppHelper.getAppLanguage(), token: AppHelper.getCurrentUserToken()!, image: profileImage!.path,
        name: usernameController.text,
        email: emailController.text,
        idCard: idCardController.text,
        phone: phoneNumberController.text,
        dateOfBirth: /*dateSelected*/ AppHelper.getDateToday(),
        gender: /*selectedGender!*/ 'male'
    )
        .then((value) {
          if(value != null){
            AppHelper.showToast(message: value.msg!, color: Colors.green);
            isLoading(false);
            PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: value.result!.customer!);
            Navigator.pop(context);
          }else {
            isLoading(false);
          }
    });
  }
}