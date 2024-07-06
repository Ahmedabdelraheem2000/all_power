import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class PrivacyPolicyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'terms'.tr,
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
                child: SvgPicture.asset('${Const.icons}icon_map.svg')),
            onTap: () {
              GoogleMapUtils.openGoogleMap(
                  latitude: double.parse('31.784944'),
                  longitude: double.parse('35.227806'));
            },
          )
          // InkWell(
          //   child: Container(
          //       margin: const EdgeInsets.only(left: 16, bottom: 4).r,
          //       child: const CircleAvatar(
          //         backgroundImage: NetworkImage('${Const.defaultImage}'),
          //       )),
          //   onTap: () => Get.toNamed(Routes.profile),
          // )
        ],
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),

      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_1'.tr,
                    color: AppColors.lightBlack,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_2'.tr,
                    color: AppColors.lightBlack,
                    maxline: 5,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_3'.tr,
                    color: AppColors.lightBlack,
                    maxline: 5,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_4'.tr,
                    color: AppColors.lightBlack,
                    maxline: 5,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_5'.tr,
                    color: AppColors.lightBlack,
                    maxline: 5,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_6'.tr,
                    color: AppColors.lightBlack,
                    maxline: 5,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 25, end: 16),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(text: 'privacy_text_7'.tr,
                    color: AppColors.lightBlack,
                    maxline: 5,
                    fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
