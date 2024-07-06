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

class ApplyJobScreen extends StatefulWidget {

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  late TextEditingController _FirstNameTextController;
  late TextEditingController _PhoneNumberTextController;
  late TextEditingController _JobNameTextController;
  @override
  void initState() {
    super.initState();
    _FirstNameTextController = TextEditingController();
    _PhoneNumberTextController = TextEditingController();
    _JobNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    _FirstNameTextController.dispose();
    _PhoneNumberTextController.dispose();
    _JobNameTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
      alignment: AlignmentDirectional.topStart,
          children: [
            Image.asset('${Const.images}job.png',fit: BoxFit.contain,width: double.infinity,height: 298.h,),
               Padding(
             padding: const EdgeInsetsDirectional.only(top: 136),
             child: Container(
               width: double.infinity,
               height:800,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(36),
                 color: Colors.white
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 25, top: 22),
                     child: AppText.medium(text:
                       'employee_name'.tr,
                         color: Color(0xff202020),
                         fontWeight: FontWeight.w500,
                         fontSize: 16.sp
                     ),
                   ),
                   Padding(
                     padding:
                     const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
                     child: TextFormField(
                       textInputAction: TextInputAction.go,
                       controller: _FirstNameTextController,
                       keyboardType: TextInputType.name,
                       cursorColor: HexColor(AppColors.appMainColor),
                       cursorWidth: 1.3.w,
                       cursorRadius: const Radius.circular(12).r,
                       enabled: true,
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 14.sp,
                           color: Colors.black),
                       decoration: InputDecoration(
                           hintText: 'enter_full_name'.tr,
                           hintStyle: TextStyle(
                               color: const Color(0xFF000000).withOpacity(0.3),
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w500),
                           fillColor: Colors.white,
                           filled: true,
                           helperMaxLines: 2,
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: const Color(0xff000000), width: 0.4.w),
                             borderRadius: BorderRadius.circular(10).r,
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: const Color(0xff000000), width: 1.w),
                             borderRadius: BorderRadius.circular(12).r,
                           ),
                           constraints: BoxConstraints(
                             maxHeight: 50.h,
                             minWidth: 48.w,
                           )),
                       validator: (enterFullName) =>
                           AppHelper.validateUserName(name: enterFullName!),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 25, top: 22),
                     child: AppText.medium(text:
                       'telephone_number'.tr,
                         color: Color(0xff202020),
                         fontWeight: FontWeight.w500,
                         fontSize: 16.sp
                     ),
                   ),
                   Padding(
                     padding:
                     const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
                     child: TextFormField(
                       textInputAction: TextInputAction.go,
                       controller: _PhoneNumberTextController,
                       keyboardType: TextInputType.phone,
                       cursorColor: HexColor(AppColors.appMainColor),
                       cursorWidth: 1.3.w,
                       cursorRadius: const Radius.circular(12).r,
                       enabled: true,
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 14.sp,
                           color: Colors.black),
                       decoration: InputDecoration(
                           hintText: '966 555 555 555'.tr,
                           hintStyle: TextStyle(
                               color: const Color(0xFF000000).withOpacity(0.3),
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w500),
                           fillColor: Colors.white,
                           filled: true,
                           helperMaxLines: 2,
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: const Color(0xff000000), width: 0.4.w),
                             borderRadius: BorderRadius.circular(10).r,
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: const Color(0xff000000), width: 1.w),
                             borderRadius: BorderRadius.circular(12).r,
                           ),
                           constraints: BoxConstraints(
                             maxHeight: 50.h,
                             minWidth: 48.w,
                           )),
                       validator: (phone) =>
                           AppHelper.validateUserName(name: phone!),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 25, top: 22),
                     child: AppText.medium(text:
                       'Job_name'.tr,
                         color: Color(0xff202020),
                         fontWeight: FontWeight.w500,
                         fontSize: 16.sp
                     ),
                   ),
                   Padding(
                     padding:
                     const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
                     child: TextFormField(
                       textInputAction: TextInputAction.go,
                       controller: _JobNameTextController,
                       keyboardType: TextInputType.name,
                       cursorColor: HexColor(AppColors.appMainColor),
                       cursorWidth: 1.3.w,
                       cursorRadius: const Radius.circular(12).r,
                       enabled: true,
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 14.sp,
                           color: Colors.black),
                       decoration: InputDecoration(
                           hintText: 'enter_full_name'.tr,
                           hintStyle: TextStyle(
                               color: const Color(0xFF000000).withOpacity(0.3),
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w500),
                           fillColor: Colors.white,
                           filled: true,
                           helperMaxLines: 2,
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: const Color(0xff000000), width: 0.4.w),
                             borderRadius: BorderRadius.circular(10).r,
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: const Color(0xff000000), width: 1.w),
                             borderRadius: BorderRadius.circular(12).r,
                           ),
                           constraints: BoxConstraints(
                             maxHeight: 50.h,
                             minWidth: 48.w,
                           )),
                       validator: (JobName) =>
                           AppHelper.validateUserName(name: JobName!),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 25, top: 22),
                     child: AppText.medium(text:
                       'attach_your_personal_photo',
                         color: Color(0xff202020),
                         fontWeight: FontWeight.w500,
                         fontSize: 16.sp
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(top: 10),
                     child: Align(
                       alignment: AlignmentDirectional.center,
                       child: InkWell(
                         child: Stack(
                           alignment: Alignment.center,
                           children: [
                             Image.asset('${Const.images}container_image.png',fit: BoxFit.contain,width:
                             343.w,
                             height: 108.h,),
                             Container(
                               alignment: Alignment.center,
                               child: Column(
                                  children: [
                                   Image.asset('${Const.icons}icon_select_image.png'),
                                    SizedBox(height: 10.h),
                                   AppText.medium(text:
                                     'click_here_to_download_the_image'.tr,
                                       color: const Color(0xff000000).withAlpha(60),
                                       fontWeight: FontWeight.w400,
                                       fontSize: 12.sp
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                         onTap: (){},
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 25, top: 22),
                     child: AppText.medium(text:
                       'attach_your_cv'.tr,
                         color: Color(0xff202020),
                         fontWeight: FontWeight.w500,
                         fontSize: 16
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(top: 10),
                     child: Align(
                       alignment: AlignmentDirectional.center,
                       child: InkWell(
                         child: Stack(
                           alignment: Alignment.center,
                           children: [
                             Image.asset('${Const.images}container_image.png',fit: BoxFit.contain,width:
                             343.w,
                               height: 108.h,),
                             Container(
                               alignment: Alignment.center,
                               child: Column(
                                 children: [
                                   Image.asset('${Const.icons}icon_select_cv.png'),
                                   SizedBox(height: 10.h),
                                   AppText.medium(text:
                                     'click_here_to_download_the_file',
                                       color: const Color(0xff000000).withAlpha(60),
                                       fontWeight: FontWeight.w400,
                                       fontSize: 12.sp
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                         onTap: (){},
                       ),
                     ),
                   ),
                   Container(
                     alignment: Alignment.bottomCenter,
                     margin:
                     EdgeInsetsDirectional.only(top: 44.r, start: 24.r, end: 24.r),
                     child: AppWidgets.CustomButton(
                         text: 'send'.tr,
                         isUpperCase: false,
                         height: 48.h,
                         radius: 5,
                         background: HexColor(AppColors.appMainColor),
                         borderColor: HexColor(AppColors.appMainColor),
                         click: () => Get.toNamed(Routes.doneApplyJob)),
                   ),
                 ],
               ),
             ),
               ),
          ],
        ),
      ),
    );
  }
}
