import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';

class PhoneNumberScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'change_password'.tr,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: true,
        actions: [
          InkWell(
            child: Container(
                margin: const EdgeInsets.only(left: 16, bottom: 4).r,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(Const.defaultImage),
                )),
            onTap: () => Get.toNamed(Routes.profile),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),

      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.only(start: 18,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.medium(text: 'password_reset'.tr,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: AppColors.darkSecondColor
            ),
            SizedBox(height: 20.h),
            AppText.medium(text: 'enter_phone_number',
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                maxline: 2,
                color: AppColors.darkSecondColor
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 60.r, start: 16.r, end: 16.r),
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
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    cursorColor: HexColor(AppColors.appMainColor),
                    cursorWidth: 1.3.w,
                    cursorRadius: Radius.circular(10).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: '+972594888888'.tr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontWeight: FontWeight.w400
                        ),
                        fillColor: Color(0xffFAFAFA),
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: HexColor(AppColors.appMainColor), width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          minWidth: 48,
                        ),
                        /*suffixIcon: InkWell(
                          child: Icon(controller.visiblePassIcon, color: Colors.black),
                          onTap: () => controller.visiblePassword(),
                        )*/),
                    validator: (username) => AppHelper.validatePassword(password: username!),
                  ),
                  SizedBox(height: 50.h),
                  AppWidgets.CustomButton(
                      text: 'send',
                      radius: 8,
                      isUpperCase: false,
                      click: () => Get.toNamed(Routes.verification))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
