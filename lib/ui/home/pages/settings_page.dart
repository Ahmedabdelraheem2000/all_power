import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/settings_controller.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class SettingsPage extends StatelessWidget {

  final _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'settings',
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: Container(),
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
      ),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 40.r),
              child: InkWell(
                child: Row(
                  children: [
                    Image.asset('${Const.icons}icon_user.png'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'profile', fontSize: 18, fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)
                  ],
                ),
                onTap: () {
                  if(AppHelper.getCurrentUserToken() != null){
                    Get.toNamed(Routes.profile);
                  }else {
                    AppHelper.showLoginBottomSheet(context);
                  }
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 50.r),
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_contact.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'contact_us', fontSize: 18, fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.contactUs),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 50.r),
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_about.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'about', fontSize: 18, fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.aboutUs),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 50.r),
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_terms.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'terms', fontSize: 18, fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.privacyPolicy),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 50.r),
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_language.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'language', fontSize: 18, fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)
                  ],
                ),
                onTap: () => _controller.showLanguageDialog(context),
              ),
            ),
            AppHelper.getCurrentUserToken() != null ? Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 50.r),
              child: InkWell(
                child: Row(
                  children: [
                    Icon(Icons.delete_rounded, color: AppColors.primaryColor),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'delete_account'.tr , fontSize: 18, fontWeight: FontWeight.w500),
                  ],
                ),
                onTap: () => _controller.showDeleteAccountBottomSheet(context),
              ),
            ) : Container(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20.r, left: 20.r, top: 50.r),
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_logout.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: AppHelper.getCurrentUserToken() != null ? 'log_out'.tr : 'login'.tr, fontSize: 18, fontWeight: FontWeight.w500),
                  ],
                ),
                onTap: () => _controller.showLogoutBottomSheet(context),
              ),
            ),
          ],
        ),
      )
    );
  }
}
