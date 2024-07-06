import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';

class VerificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText.medium(
            text: 'pin_code'.tr,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: false,
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),

      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.only(start: 18,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.medium(text: 'enter_code'.tr,
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
                  SizedBox(height: 50.h),
                  AppWidgets.CustomButton(
                      text: 'confirm',
                      radius: 8,
                      isUpperCase: false,
                      click: () => Get.toNamed(Routes.changePassword))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
