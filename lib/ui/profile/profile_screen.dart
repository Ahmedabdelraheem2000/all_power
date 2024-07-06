import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/profile_controller.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'profile'.tr,
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
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.updateProfile),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.darkMainColor, width: 2)
                ),
                child: AppHelper.getCurrentUser()!.image == null
                    ? CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('${Const.defaultUserImage}'),
                )
                    : CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('${AppHelper.getCurrentUser()!.imageUrl}'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 38, start: 37),
              child: Row(
                children: [
                  Expanded(
                    child: AppText.medium(text:
                      'username',
                      color: AppColors.lightBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: AppText.medium(text:
                      '${AppHelper.getCurrentUser()!.name}',
                      color: AppColors.lightGray,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.lightGray,
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 30, start: 37),
              child: Row(
                children: [
                  Expanded(
                    child: AppText.medium(text:
                      'Job_title',
                      color: AppColors.lightBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: AppText.medium(text:
                      'سفرجي',
                      color: AppColors.lightGray,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.lightGray,
            ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(top: 30, start: 37),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: AppText.medium(text:
            //           'identification_number'.tr,
            //           color: AppColors.lightBlack,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       Expanded(
            //         child: AppText.medium(text:
            //         AppHelper.getCurrentUser()!.idCard != null ? '${AppHelper.getCurrentUser()!.idCard}' : '',
            //           color: AppColors.lightGray,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   color: AppColors.lightGray,
            // ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 30, start: 37),
              child: Row(
                children: [
                  Expanded(
                    child: AppText.medium(text:
                      'telephone_number'.tr,
                      color: AppColors.lightBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Expanded(
                    child: AppText.medium(text:
                      '${AppHelper.getCurrentUser()!.phone}'.tr,
                      color: AppColors.lightGray,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.lightGray,
            ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(top: 30, start: 37),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: AppText.medium(text:
            //           'date_birth'.tr,
            //           color: AppColors.lightBlack,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       Expanded(
            //         child: AppText.medium(text:
            //           '${AppHelper.getCurrentUser()!.birthDate}',
            //           color: AppColors.lightGray,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   color: AppColors.lightGray,
            // ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(top: 30, start: 37),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: AppText.medium(text:
            //           'gender'.tr,
            //           color: AppColors.lightBlack,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500
            //         ),
            //       ),
            //       Expanded(
            //         child: AppText.medium(text:
            //           '${AppHelper.getCurrentUser()!.gender}',
            //           color: AppColors.lightGray,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   color: AppColors.lightGray,
            // ),
          ],
        ),
      ),
    );
  }
}