import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/started_controller.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class StartedScreen extends GetView<StartedController> {
  final _controller = Get.put(StartedController());

  @override
  Widget build(BuildContext context) {
    final boolean = _controller.isLoading.value;
    AppHelper.statusBarColor(isHome: false);
    return ModalProgressHUD(
      inAsyncCall: boolean,
      opacity: .5,
      progressIndicator: AppWidgets.CustomAnimationProgress(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset('${Const.images}background.png',
                fit: BoxFit.cover,
                width: double.infinity),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150, right: 10).r,
                    alignment: Alignment.center,
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
                        })),
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: AppText.larg(text: 'welcome',
                        fontWeight: FontWeight.w500,
                        fontSize: 26.sp, color: Colors.orange)),
                Container(
                    margin: EdgeInsets.only(top: 00.r, right: 50.r, left: 50.r),
                    child: AppText.small(
                        text: '', // TODO create_and_get_jobs
                        fontSize: 16.sp,
                        color: HexColor(AppColors.textSubColor),
                        maxLines: 2,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center)),
                Container(
                    margin: EdgeInsets.only(top: 50.r, right: 16.r, left: 16.r),
                    child: AppWidgets.CustomButton(
                        text: 'browse_jobs'.tr,
                        radius: 5,
                        isUpperCase: false,
                        click: () => Get.toNamed(Routes.home))),
                Container(
                    margin: EdgeInsets.only(top: 30.r),
                    child: InkWell(
                      child: AppText.medium(
                          // textDecoration: TextDecoration.underline,
                          text: 'login'.tr,
                      fontSize: 26.sp),
                      onTap: () => Get.toNamed(Routes.login),
                    ))
              ],
            ),
          ],
        )
      ),
    );
  }
}