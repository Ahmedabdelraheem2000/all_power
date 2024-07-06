import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/controller/home_controller.dart';
import 'package:hire_me/model/language.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/preferences_manager.dart';

class SettingsController extends GetxController {


  XFile? image;
  String languageSelected = '';


  List<Language> listLanguages = [
    Language(
        language: 'arabic'.tr,
        languageCode: Const.KEY_LANGUAGE_AR,
        isSelected: true),
    Language(
        language: 'hebrew'.tr,
        languageCode: Const.KEY_LANGUAGE_HE,
        isSelected: false),
  ];

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void dispose() {

    super.dispose();
  }

  Locale? getAppLocale() {
    String? language = PreferencesManager.getAppData(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR) {
        return const Locale('ar');
      } else if (language == Const.KEY_LANGUAGE_HE) {
        return const Locale('he');
      } else {
        return const Locale('ar');
      }
  }

  void saveLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    PreferencesManager.saveAppData(key: Const.KEY_LANGUAGE, value: codeLang);
    Get.updateLocale(locale);
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void requestCameraPermissions() async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("CAMERA permission: ${statuses[Permission.camera]}");
      pickImage();
    }
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
              content: Container(
                  width: 400,
                  height: 210,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(26)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 11.h,
                      ),
                      AppText.medium(
                        text: 'chose_language',
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: Platform.isAndroid ? 16.sp : 13.sp,
                      ),
                      Divider(height: 4.h, color: Colors.black),
                      SizedBox(
                        height: 8.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listLanguages.length,
                          itemBuilder: (context, index) =>
                              GetBuilder<SettingsController>(
                                  builder: (controller) {
                            return Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: 120.w,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5).r,
                                  border: Border.all(
                                      color: controller
                                              .listLanguages[index].isSelected
                                          ? HexColor(AppColors.appMainColor)
                                          : AppColors.lightGray),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio<String>(
                                      value: controller
                                          .listLanguages[index].languageCode,
                                      groupValue: controller.languageSelected,
                                      activeColor:
                                          HexColor(AppColors.appMainColor),
                                      onChanged: (value) {
                                        for (Language language in controller.listLanguages) {
                                          language.isSelected = false;
                                        }
                                        controller.listLanguages[index]
                                            .isSelected = true;
                                        controller.languageSelected =
                                            value.toString();
                                        controller.saveLanguage(
                                            controller.languageSelected);
                                        controller.update();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    AppText.medium(
                                        text: controller
                                            .listLanguages[index].language,
                                        color: AppColors.lightBlack,
                                        fontSize: Platform.isAndroid ? 12.sp : 10.sp ,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ));
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  )),
            ));
  }

  void showLogoutBottomSheet(BuildContext context) {
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
            height: 450,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: AppColors.darkMainColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'log_out' : 'login',color: AppColors.darkMainColor, fontSize: Platform.isAndroid ? 20 : 16, fontWeight: FontWeight.w700),
                SizedBox(height: 8),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r, bottom: 12, end: 20),
                    height: 180.h,
                    width: 280.w,
                    child: SvgPicture.asset(AppHelper.getCurrentUserToken() != null ? '${Const.images}logout_image.svg' : '${Const.images}login_image.svg', fit: BoxFit.scaleDown)),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'text_log_out' : 'please_login',
                    fontSize: Platform.isAndroid ? 16 : 13,
                    color: AppColors.darkMainColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsetsDirectional.only(top: 4, end: 10),
                          width: double.infinity,
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: HexColor(AppColors.appMainColor),
                              borderColor: HexColor(AppColors.appMainColor),
                              text: AppHelper.getCurrentUserToken() != null ? 'log_out'.tr : 'login'.tr,
                              isUpperCase: false,
                              click: () {
                                if(AppHelper.getCurrentUserToken() != null)
                                  logout();
                                else
                                  AppHelper.goToLogin();
                              })),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          margin:
                              EdgeInsetsDirectional.only(top: 4, start: 10),
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppColors.lightWhite,
                              borderColor: HexColor(AppColors.appMainColor),
                              text: 'cancel'.tr,
                              textColor: HexColor(AppColors.appMainColor),
                              isUpperCase: false,
                              click: () => Navigator.pop(context))),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void showDeleteAccountBottomSheet(BuildContext context) {
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
            height: 450,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: AppColors.darkMainColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                AppText.larg(
                    text: 'delete_account' ,color: AppColors.darkMainColor, fontSize: Platform.isAndroid ? 20 : 16, fontWeight: FontWeight.w700),
                SizedBox(height: 8),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r, bottom: 12, end: 20),
                    height: 180.h,
                    width: 280.w,
                    child: SvgPicture.asset(AppHelper.getCurrentUserToken() != null ? '${Const.images}logout_image.svg' : '${Const.images}login_image.svg', fit: BoxFit.scaleDown)),
                AppText.larg(
                    text: 'text_delete_account'.tr,
                    fontSize: Platform.isAndroid ? 16 : 13,
                    color: AppColors.darkMainColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsetsDirectional.only(top: 4, end: 10),
                          width: double.infinity,
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: HexColor(AppColors.appMainColor),
                              borderColor: HexColor(AppColors.appMainColor),
                              text: 'delete_account'.tr,
                              isUpperCase: false,
                              click: () {
                                if(AppHelper.getCurrentUserToken() != null)
                                  disableAccount();
                                else
                                  AppHelper.goToLogin();
                              })),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          margin:
                          EdgeInsetsDirectional.only(top: 4, start: 10),
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppColors.lightWhite,
                              borderColor: HexColor(AppColors.appMainColor),
                              text: 'cancel'.tr,
                              textColor: HexColor(AppColors.appMainColor),
                              isUpperCase: false,
                              click: () => Navigator.pop(context))),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void logout() async {
    HomeController controller = Get.put(HomeController());
    await ApiRequests.logout(token: AppHelper.getCurrentUserToken()!)
        .then((value) {
      if (value != null) {
        PreferencesManager.clearData(key: Const.KEY_USER_TOKEN).then((value) {
          PreferencesManager.clearData(key: Const.KEY_USER_DATA).then((value) {
            controller.navIndex = 0;
            controller.getCurrenNavIndex(navIndex: 0);
            Get.offAndToNamed(Routes.login);
          });
        });
      }
    });
  }

  void disableAccount() async {
    HomeController controller = Get.put(HomeController());
    await ApiRequests.disableAccount(token: AppHelper.getCurrentUserToken()!)
        .then((value) {
      if (value != null) {
        PreferencesManager.clearData(key: Const.KEY_USER_TOKEN).then((value) {
          PreferencesManager.clearData(key: Const.KEY_USER_DATA).then((value) {
            controller.navIndex = 0;
            controller.getCurrenNavIndex(navIndex: 0);
            Get.offAndToNamed(Routes.login);
          });
        });
      }
    });
  }
}
