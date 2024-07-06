import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/profile_controller.dart';
import 'package:hire_me/controller/register_controller.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';

class UpdateProfileScreen extends StatelessWidget {

  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'update_profile'.tr,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: AppColors.darkMainColor, width: 2)
                        ),
                        child: GetBuilder<ProfileController>(builder: (controller) => controller.profileImage == null
                            ? CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(AppHelper.getCurrentUser()!.image == null ? '${Const.defaultUserImage}' : AppHelper.getCurrentUser()!.imageUrl!),
                        )
                            : CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: FileImage(File(controller.profileImage!.path)),
                        )),
                      ),
                      InkWell(
                        child: Container(
                            width: 24.w,
                            height: 24.h,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            margin: EdgeInsetsDirectional.only(start: 20),
                            child: SvgPicture.asset('${Const.icons}icon_edit_profile.svg')),
                        onTap: () => _controller.requestStoragePermission(),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                child: AppText.medium(text:
                'username'.tr,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp
                ),
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
                      hintText: '',
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
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (name) => AppHelper.validateUserName(name: name!),
                ),
              ),
              /*Container(
                margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                child: AppText.medium(text:
                'identification_number'.tr,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp
                ),
              ),
              Container(
                width: 343,
                height: 55,
                margin: const EdgeInsetsDirectional.only(
                    start: 20, end: 20, top: 5),
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: _controller.idCardController,
                  keyboardType: TextInputType.number,
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
                      hintText: '',
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
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (idCard) => AppHelper.validateIdCard(idCard: idCard!),
                ),
              ),*/
              Container(
                margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                child: AppText.medium(text:
                'email'.tr,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp
                ),
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
                      hintText: '',
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
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (email) => AppHelper.validateEmail(email: email),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 25, top: 20),
                child: AppText.medium(text:
                'telephone_number'.tr,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp
                ),
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
                      hintText: '',
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
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (phone) => AppHelper.validatePhone(phone: phone!),
                ),
              ),
             /* Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(start: 20, end: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsetsDirectional.only(top: 16),
                            child: AppText.medium(text:
                            'date_birth'.tr,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              height: 54,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black)
                              ),
                              child: Row(
                                children: [
                                  GetBuilder<ProfileController>(builder: (controller) => Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: AppText.medium(
                                          fontSize: 16,
                                          text: _controller.dateSelected.isNotEmpty ? _controller.dateSelected : AppHelper.getCurrentUser()!.birthDate!))),
                                  const Spacer(),
                                  InkWell(
                                      child: Image.asset('${Const.icons}icon_date.png'),
                                      onTap: () => _controller.showDateDialog(context)),
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
                          end: 24, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.medium(text: 'gender'.tr),
                          SizedBox(height: 10.h),
                          GetBuilder<ProfileController>(builder: (controller) => SizedBox(
                            width: 343.w,
                            height: 55.h,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    SizedBox(
                                      width: 4.w,),
                                    Expanded(
                                      child:
                                      Obx(() => Text(
                                        controller.genderSelected!.value != ''
                                            ? controller.genderSelected!.value.tr
                                            : 'male'.tr,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.lightBlack,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ),
                                  ],
                                ),
                                items: controller.listGender
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item.toString(),
                                  child: AppText.medium(text:
                                  item.tr,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3D3B3F),
                                  ),
                                )).toList(),
                                onChanged: (value) {
                                  controller.genderSelected!.value = value.toString();

                                  if(controller.genderSelected!.value == 'ذكر' || controller.genderSelected!.value == 'זכר'){
                                    controller.selectedGender = 'male';
                                  }else if(controller.genderSelected!.value == 'أنثى' || controller.genderSelected!.value == 'נָשִׁי'){
                                    controller.selectedGender = 'female';
                                  }else {
                                    controller.selectedGender = 'male';
                                  }

                                  print("GENDER: ${controller.selectedGender}");
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
                                buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                                buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xff3D3B3F),
                                      width: 0.5,
                                    ),
                                    color: Colors.white),
                                itemHeight: 50,
                                itemPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(40),
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
                alignment: Alignment.bottomCenter,
                margin: EdgeInsetsDirectional.only(top: 44.r, start: 20.r, end: 20.r, bottom: 20.r),
                child: AppWidgets.CustomButton(
                    text: 'update_profile'.tr,
                    isUpperCase: false,
                    height: 48.h,
                    radius: 5,
                    background: HexColor(AppColors.appMainColor),
                    borderColor: HexColor(AppColors.appMainColor),
                    click: () => _controller.updateProfile(context)),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Obx(() => _controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
