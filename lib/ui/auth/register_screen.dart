import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/register_controller.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';

class RegisterScreen extends GetView<RegisterController> {
  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _controller.formKey,
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 8, end: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                        start: 4.r, end: 4.r, top: 80),
                    child: AppText.authText(
                      text: 'registration_request',
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                      margin: EdgeInsetsDirectional.only(
                          start: 4.r, end: 4.r, top: 0),
                      child: Text(
                        'create_your_account!'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: Const.appFont,
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                  child: AppText.medium(
                      text: 'telephone_number'.tr,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ),
                Container(
                  width: 343,
                  height: 55,
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, top: 5),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: HexColor(AppColors.appMainColor),
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'telephone_number'.tr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor(AppColors.appMainColor),
                              width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 343.h,
                          minWidth: 48.w,
                        )),
                    validator: (phone) =>
                        AppHelper.validatePhone(phone: phone!),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                  child: AppText.medium(
                      text: 'username'.tr,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ),
                Container(
                  width: 343,
                  height: 55,
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, top: 5),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller.usernameController,
                    keyboardType: TextInputType.emailAddress,
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: HexColor(AppColors.appMainColor),
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'username'.tr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor(AppColors.appMainColor),
                              width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 343.h,
                          minWidth: 48.w,
                        )),
                    validator: (name) =>
                        AppHelper.validateUserName(name: name!),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                //   child: AppText.medium(
                //       text: 'identification_number'.tr,
                //       color: Colors.black,
                //       fontWeight: FontWeight.w500,
                //       fontSize: 16.sp),
                // ),
                // Container(
                //   width: 343,
                //   height: 55,
                //   margin: const EdgeInsetsDirectional.only(
                //       start: 20, end: 20, top: 5),
                //   child: TextFormField(
                //     textInputAction: TextInputAction.go,
                //     controller: _controller.idCardController,
                //     keyboardType: TextInputType.number,
                //     textAlignVertical: TextAlignVertical.bottom,
                //     cursorColor: HexColor(AppColors.appMainColor),
                //     cursorWidth: 1.3.w,
                //     cursorRadius: const Radius.circular(8).r,
                //     enabled: true,
                //     style: TextStyle(
                //         fontWeight: FontWeight.w400,
                //         fontSize: 16.sp,
                //         color: Colors.black),
                //     decoration: InputDecoration(
                //         hintText: 'optional'.tr,
                //         hintStyle: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 14.h,
                //             fontFamily: Const.appFont,
                //             fontWeight: FontWeight.w400),
                //         fillColor: Colors.white,
                //         filled: true,
                //         helperMaxLines: 2,
                //         enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.black),
                //           borderRadius: BorderRadius.circular(8).r,
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               color: HexColor(AppColors.appMainColor),
                //               width: 1.w),
                //           borderRadius: BorderRadius.circular(8).r,
                //         ),
                //         constraints: BoxConstraints(
                //           maxHeight: 343.h,
                //           minWidth: 48.w,
                //         )),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                  child: AppText.medium(
                      text: 'email'.tr,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ),
                Container(
                  width: 343,
                  height: 55,
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, top: 5),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: HexColor(AppColors.appMainColor),
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'email'.tr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor(AppColors.appMainColor),
                              width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 343.h,
                          minWidth: 48.w,
                        )),
                    validator: (email) => AppHelper.validateEmail(email: email),
                  ),
                ),
                /*Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(
                            start: 20, end: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(top: 16),
                              child: Row(
                                children: [
                                  AppText.medium(
                                      text: 'date_birth'.tr,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp),
                                  SizedBox(width: 6.w),
                                  AppText.small(text: "optional".tr),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.centerRight,
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    GetBuilder<RegisterController>(
                                        builder: (controller) => Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            child: AppText.medium(
                                                fontSize: 16,
                                                text: _controller
                                                        .dateSelected.isNotEmpty
                                                    ? _controller.dateSelected
                                                    : AppHelper
                                                        .getDateToday()))),
                                    const Spacer(),
                                    InkWell(
                                        child: Image.asset(
                                            '${Const.icons}icon_date.png',
                                            color: AppColors.darkMainColor),
                                        onTap: () => _controller
                                            .showDateDialog(context)),
                                    const SizedBox(width: 8),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(
                            end: 22, top: 14, start: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppText.medium(text: 'gender'.tr),
                                SizedBox(width: 6.w),
                                AppText.small(text: "optional".tr),
                              ],
                            ),
                            GetBuilder<RegisterController>(
                                builder: (controller) => Container(
                                      width: 343.w,
                                      height: 55.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Row(
                                            children: [
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Expanded(
                                                child: Obx(() => Text(
                                                      controller.genderSelected!
                                                                  .value !=
                                                              ''
                                                          ? controller
                                                              .genderSelected!
                                                              .value
                                                              .tr
                                                          : 'select_gender'.tr,
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .lightBlack,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          items: controller.listGender
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item.toString(),
                                                    child: AppText.medium(
                                                      text: item.tr,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff3D3B3F),
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            controller.genderSelected!.value =
                                                value.toString();

                                            if (controller.genderSelected!
                                                        .value ==
                                                    'ذكر' ||
                                                controller.genderSelected!
                                                        .value ==
                                                    'זכר') {
                                              controller.selectedGender =
                                                  'male';
                                            } else if (controller
                                                        .genderSelected!
                                                        .value ==
                                                    'أنثى' ||
                                                controller.genderSelected!
                                                        .value ==
                                                    'נָשִׁי') {
                                              controller.selectedGender =
                                                  'female';
                                            } else {
                                              controller.selectedGender =
                                                  'male';
                                            }

                                            print(
                                                "GENDER: ${controller.selectedGender}");
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 24,
                                            color: Color(0xff727272),
                                          ),
                                          iconSize: 14.sp,
                                          iconEnabledColor: Colors.white,
                                          iconDisabledColor: Colors.white,
                                          buttonHeight: 100.h,
                                          buttonWidth: 160.w,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xff3D3B3F),
                                                width: 0.5,
                                              ),
                                              color: Colors.white),
                                          itemHeight: 50,
                                          itemPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Colors.white,
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(20, -2),
                                        ),
                                      ),
                                    )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),*/
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                  child: AppText.medium(
                      text: 'password'.tr,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ),
                Container(
                  width: 343,
                  height: 55,
                  margin: const EdgeInsetsDirectional.only(
                      start: 20, end: 20, top: 5),
                  child: GetBuilder<RegisterController>(
                      builder: (controller) => TextFormField(
                            textInputAction: TextInputAction.go,
                            controller: _controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _controller.isVisiblePass,
                            textAlignVertical: TextAlignVertical.bottom,
                            cursorColor: HexColor(AppColors.appMainColor),
                            cursorWidth: 1.3.w,
                            cursorRadius: const Radius.circular(8).r,
                            enabled: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Colors.black),
                            decoration: InputDecoration(
                                hintText: '********',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.h,
                                    fontFamily: Const.appFont,
                                    fontWeight: FontWeight.w400),
                                fillColor: Colors.white,
                                filled: true,
                                helperMaxLines: 2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(AppColors.appMainColor),
                                      width: 1.w),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                constraints: BoxConstraints(
                                  maxHeight: 343.h,
                                  minWidth: 48.w,
                                ),
                                suffixIcon: InkWell(
                                  child: Icon(controller.visiblePassIcon,
                                      color: Colors.black),
                                  onTap: () => controller.visiblePassword(),
                                )),
                            validator: (password) =>
                                AppHelper.validatePassword(password: password!),
                          )),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsetsDirectional.only(start: 4, top: 16),
                  child: Row(
                    children: [
                      GetBuilder<RegisterController>(
                          builder: (controller) => Checkbox(
                              value: controller.isCheck,
                              onChanged: (bool? value) {
                                controller.isCheck = value!;
                                controller.update();
                              })),
                      InkWell(
                          child: AppText.medium(
                              text: 'terms_conditions',
                              textDecoration: TextDecoration.underline),
                          onTap: () => Get.toNamed(Routes.privacyPolicy))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 20, top: 10),
                  child: AppText.medium(
                      text: 'inquiries_phone'.tr,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
                Container(
                  margin:
                      const EdgeInsetsDirectional.only(start: 20, bottom: 10),
                  child: AppText.medium(
                      text: 'inquiries_office'.tr,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsetsDirectional.only(
                      top: 44.r, start: 20.r, end: 20.r, bottom: 20.r),
                  child: AppWidgets.CustomButton(
                      text: 'new_registration'.tr,
                      isUpperCase: false,
                      height: 48.h,
                      radius: 5,
                      background: HexColor(AppColors.appMainColor),
                      borderColor: HexColor(AppColors.appMainColor),
                      click: () {
                        if (_controller.isCheck) {
                          _controller.createAccount();
                        } else {
                          AppHelper.showToast(
                              message: 'please_check_for_terms'.tr,
                              color: Colors.redAccent);
                        }
                      }),
                ),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      child: Obx(() => controller.isLoading.isTrue
                          ? AppWidgets.CustomAnimationProgress()
                          : Container())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
