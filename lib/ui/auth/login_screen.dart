
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hire_me/controller/login_controller.dart';
import 'package:hire_me/controller/started_controller.dart';
import 'package:hire_me/model/settings.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends GetView<LoginController> {
  final _controller = Get.put(StartedController());

  @override
  Widget build(BuildContext context) {
    final boolean = _controller.isLoading.value;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: boolean,
        opacity: .5,
        progressIndicator: AppWidgets.CustomAnimationProgress(),

        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset('${Const.images}background.png',
                    fit: BoxFit.cover,
                    width: double.infinity),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 117, left: 20, right: 20),
                      child: FutureBuilder(
                          future: _controller.fetchSettings(),
                          builder:(context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.done ){

                              return CachedNetworkImage(
                                imageUrl: _controller.apiResponse.value.setting!.logoUrl,
                                progressIndicatorBuilder: (context, url, progress) => AppWidgets.CustomAnimationProgress(),

                              );
                            }
                            else if (snapshot.connectionState == ConnectionState.none){
                              return Image.asset('${Const.images}new_logo_profile.png');
                            }
                            else{
                              return Container();
                            }
                          })
                    ),
                   Align(
                      alignment: AlignmentDirectional.center,
                      child: Container(
                        margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.authText(
                          text: 'login',
                        ),
                      ),
                    ),
                   SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(top: 30.r, start: 16.r, end: 16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                              child: AppText.medium(text:'telephone_number',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 4.h),
                            GetBuilder<LoginController>(builder: (controller) => TextFormField(
                              textInputAction: TextInputAction.go,
                              controller: controller.phoneController,
                              keyboardType: TextInputType.number,
                              cursorColor: HexColor(AppColors.appMainColor),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(8).r,
                              enabled: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: Const.appFont,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: 'enter_phone'.tr,
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: HexColor(AppColors.appMainColor), width: 1.w),
                                    borderRadius: BorderRadius.circular(8).r,
                                  ),
                                  constraints: const BoxConstraints(
                                    maxHeight: 343,
                                    minWidth: 48,
                                  )),
                              validator: (phone) => AppHelper.validatePhone(phone: phone!),
                            )),
                          ],
                        ),
                      ),
                    ),
                   SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(top: 30.r, start: 16.r, end: 16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                              child: AppText.medium(text:'password',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 4.h),
                            GetBuilder<LoginController>(builder: (controller) => TextFormField(
                              textInputAction: TextInputAction.go,
                              controller: controller.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.isVisiblePass,
                              cursorColor: HexColor(AppColors.appMainColor),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(8).r,
                              obscuringCharacter: '•',
                              enabled: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: '••••••••'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.h,
                                      fontFamily: Const.appFont,
                                      fontWeight: FontWeight.w400
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: HexColor(AppColors.appMainColor), width: 1.w),
                                    borderRadius: BorderRadius.circular(8).r,
                                  ),
                                  constraints: const BoxConstraints(
                                    maxHeight: 343,
                                    minWidth: 48,
                                  ),
                                  suffixIcon: InkWell(
                                    child: Icon(controller.visiblePassIcon, color: Colors.black),
                                    onTap: () => controller.visiblePassword(),
                                  )),
                              validator: (username) => AppHelper.validatePassword(password: username!),
                            )),
                          ],
                        ),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20,top: 4),
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.phoneNumber),
                          // TODO forget_pass
                          child: Text(''.tr,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline
                          ),),
                        ),
                      ),
                    ),
                   Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsetsDirectional.only(top: 44.r, start: 20.r, end: 20.r),
                      child: AppWidgets.CustomButton(
                          text: 'login'.tr,
                          isUpperCase: false,
                          height: 48.h,
                          radius: 5,
                          background: HexColor(AppColors.appMainColor),
                          borderColor: HexColor(AppColors.appMainColor),
                          click: () => controller.login(phone: controller.phoneController.text, password: controller.passwordController.text)),
                    ),
                   SizedBox(height: 18.h,),
                   Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.medium(text: 'dont_have_account'),
                      SizedBox(width: 4),
                      InkWell(
                          child: AppText.medium(text: 'have_account'),
                      onTap: () => Get.toNamed(Routes.register),),
                    ],
                  ),
                ),
                   Center(
                      child: Container(
                          child: Obx(() => controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())),
                    ),
                   Container(
                     alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 16.r, left: 16.r, top: 10),
                        child: AppWidgets.CustomButton(
                            background: Colors.transparent,
                            borderColor: Colors.transparent,
                            text: 'browse_jobs'.tr,
                            textColor: AppColors.darkMainColor,
                            fontSize: 14,
                            radius: 5,
                            isUpperCase: false,
                            click: () => Get.toNamed(Routes.home))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
