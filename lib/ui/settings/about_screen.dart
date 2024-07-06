import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'about'.tr,
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
        )
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h,),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 20, start: 40, end: 40),
              child: Center(
                child: Image.asset(
                  '${Const.images}new_logo_profile.png',

                ),
              ),
            ),
            SizedBox(height: 50),
            const TextAbout(title: 'about_company', ),
            SizedBox(height: 4.h,),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
              child: Text('about_company_text'.tr ,style: TextStyle(
                color: const Color(0xff000000),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                  fontFamily: Const.appFont
              ),),
            ),
            SizedBox(height: 20.h,),
            TextAbout(title:'our_message'),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
              child: Text('our_message_text'.tr ,style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: Const.appFont
              ),),
            ),
            SizedBox(height: 20.h,),
            TextAbout(title:'vision'),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
              child: Text('vision_text'.tr ,style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: Const.appFont
              ),),
            ),
            SizedBox(height: 20.h,),
            const TextAbout(title:'objectives'),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('objectives_text1'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont
                        ),maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('objectives_text2'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont
                        ),maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('objectives_text3'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont
                        ),maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('objectives_text4'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont
                        ),maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('objectives_text5'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont
                        ),maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            const TextAbout(title:'services'),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('services_text1'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont,

                        ), maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16,top: 0),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsetsDirectional.only(end: 8, start: 8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      Expanded(
                        child: Text('services_text2'.tr ,style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: Const.appFont
                        ),maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}


