import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/home_controller.dart';
import 'package:hire_me/model/auth/user.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:intl/intl.dart';
import 'preferences_manager.dart';

class AppHelper {

  static String? getCurrentUserToken() {
    if (PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  static User? getCurrentUser() {
    if (PreferencesManager.getUserData(key: Const.KEY_USER_DATA) != null) {
      return PreferencesManager.getUserData(key: Const.KEY_USER_DATA);
    } else {
      return null;
    }
  }

  static String getAppLanguage() {
    if (PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != null &&
        PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != "") {
      String language = PreferencesManager.getAppData(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR)
        return Const.KEY_LANGUAGE_AR;
      else if (language == Const.KEY_LANGUAGE_HE)
        return Const.KEY_LANGUAGE_HE;
    }
    return Const.KEY_LANGUAGE_AR;
  }

  static String getDateTody(){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
    // 2022-11-13
  }

  static Future saveDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: androidInfo.model);
      print('Running on Android ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: iosInfo.utsname.machine);
      print('Running on IOS ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    }
  }

  static String getDeviceName() {
    if (PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME) != null) {
      return PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME);
    } else {
      return '';
    }
  }

  static void showToast({required String message, Color color = Colors.black, ToastGravity gravity = ToastGravity.BOTTOM}){
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  static bool validate({required String value}) {
    if (GetUtils.isBlank(value)!)
      return false;
    else
      return true;
  }

  static String? validateUserName({required String name}) {
    if (name.isEmpty) {
      return 'enter_username'.tr;
    } else {
      return null;
    }
  }

  static String? validateIdCard({required String idCard}) {
    if (idCard.isEmpty) {
      return 'enter_id_card'.tr;
    } else if(idCard.length != 9) {
      return 'id_card_must_be_9_number'.tr;
    }else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'enter_phone'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else
      return null;
  }

  static String? validateConfirmPassword(
      {required String password, required String conformPassword}) {
    if (GetUtils.isBlank(conformPassword)!)
      return 'Enter Confirm Password'.tr;
    else if (conformPassword.length < 6)
      return 'Password must be more than 6 characters'.tr;
    else if (password != conformPassword) return 'Passwords do not match'.tr;
    return null;
  }

  static String? validateEmail({required email}) {
    if (GetUtils.isBlank(email)!)
      return 'enter email'.tr;
    else if (!AppHelper.emailValidate().hasMatch(email))
      return 'Enter a valid email'.tr;
    else
      return null;
  }

  static String formatImage(String pathImage) {
    if(pathImage.contains('\\'))
      return pathImage.replaceAll('\\', '/');
    else
      return pathImage;
  }

  static Future<String> showDateDialog(BuildContext context, DateTime date, GetxController controller, Function function) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) return '';

    date = newDate;
    int year = date.year;
    int month = date.month;
    int day = date.day;
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    // dateSelected = formattedDate;
    print('DATE: $formattedDate');
    // getSchedule(dateSelected);
    controller.update();
    return formattedDate;
  }

  static String getDateToday(){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
  }



  static void showLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            height: 320.h,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  child: AppText.medium(text:
                  'please_login'.tr,
                    color: HexColor(AppColors.appMainColor),
                    fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 12.r, bottom: 12),
                    height: 150.h,
                    width: 230.w,
                    child: SvgPicture.asset('${Const.images}login_image.svg', fit: BoxFit.scaleDown)),
                Spacer(),
                Container(
                    child: AppWidgets.CustomButton(
                        height: 52,
                        background: HexColor(AppColors.appMainColor),
                        borderColor: HexColor(AppColors.appMainColor),
                        text: 'login'.tr,
                        click: () {
                          Get.toNamed(Routes.extraJobDate);
                          // goToLogin();
                        })),
              ],
            ),
          ),
        ));
  }

  static void showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400.h,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: AppColors.darkMainColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r, bottom: 12, end: 20),
                    height: 180.h,
                    width: 280.w,
                    child: SvgPicture.asset('${Const.images}login_image.svg', fit: BoxFit.scaleDown)),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  child: AppText.medium(text:
                  'please_login'.tr,
                    color: HexColor(AppColors.appMainColor),
                    fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
                    width: double.infinity,
                    child: AppWidgets.CustomButton(
                        radius: 8,
                        background: HexColor(AppColors.appMainColor),
                        borderColor: HexColor(AppColors.appMainColor),
                        text: 'login'.tr,
                        isUpperCase: false,
                        click: () {
                          AppHelper.goToLogin();
                        })),
              ],
            ),
          );
        });
  }

  static void goToLogin() {
    HomeController controller = Get.find();
    // PreferencesManager.clearData(key: Const.KEY_LATITUDE);
    // PreferencesManager.clearData(key: Const.KEY_LONGITUD);
    PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
    PreferencesManager.clearData(key: Const.KEY_USER_DATA);
    controller.getCurrenNavIndex(navIndex: 0);
    Get.offAndToNamed(Routes.login);
  }

  static void statusBarColor({required bool isHome}){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: isHome ? AppColors.darkMainColor : Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
