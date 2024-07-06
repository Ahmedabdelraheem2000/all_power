import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/main_job_details_controller.dart';
import 'package:hire_me/model/main_jobs/main_jobs.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_color.dart';
import '../../utils/components.dart';

class MainJobDetailsScreen extends StatelessWidget {

  final _controller = Get.put(MainJobDetailsController());

  int? jobId;
  int? sectionId;
  MainJobDetailsScreen({this.sectionId, this.jobId});

  @override
  Widget build(BuildContext context) {
    print('Job Details: $jobId');
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _controller.getMainJobDetails(sectionId: sectionId??0, jobId: jobId!),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.mainJob != null){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Container(
                          color: AppColors.primaryColor,
                          child: Image.network(
                            '${_controller.mainJob.imageUrl}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 298.h,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsetsDirectional.only(start: 25, top: 80),
                          child: AppText.medium(text:
                          '${_controller.mainJob.title}',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsetsDirectional.only(start: 25, top: 150),
                          child: AppText.medium(text:
                          '${_controller.mainJob.hotel!.name}',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsetsDirectional.only(start: 25, top: 200),
                          child: Row(
                            children: [
                              Image.asset('${Const.icons}icon_job_address.png', color: Colors.white),
                              SizedBox(width: 8),
                              AppText.medium(text:
                              '${_controller.mainJob.hotel!.address}',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.medium(text:
                          'about_job'.tr,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                          /*Container(
                    alignment: AlignmentDirectional.center,
                    width: 100.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                      color: AppColors.darkMainColor,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('${Const.icons}icon_attachment_cv.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        AppText.medium(text:
                          'attach_the_cv'.tr,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),*/
                        ],
                      ),
                    ),
                    Container(
                      margin:
                      const EdgeInsetsDirectional.only(end: 22, top: 12),
                      child: AppText.medium(text:
                      '${_controller.mainJob.description}',
                          textAlign: TextAlign.start,
                          color: const Color(0xff000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          maxline: 10
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 16, top: 20),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: 100.w,
                          height: 29.h,
                          decoration: BoxDecoration(
                            color: AppColors.darkMainColor,
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                          child: InkWell(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('${Const.icons}icon_attachment_cv.svg'),
                                SizedBox(
                                  width: 5.w,
                                ),
                                AppText.medium(text:
                                'attach_the_cv'.tr,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ],
                            ),
                            onTap: () {
                              _controller.requestStoragePermission(context, _controller.mainJob.id!);
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 16, top: 20),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: AppText.medium(text:
                        'For_inquiries_via_e-mail_or_phone:'.tr,
                          color: HexColor(AppColors.appSubColor),
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 12.r, start: 16.r, end: 12.r),
                      child: Row(
                        children: [
                          Expanded(
                            flex: -8,
                            child: InkWell(
                              child: Container(
                                child: Container(),
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsetsDirectional.only(end: 16),
                                  child: Align(
                                    child: InkWell(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          AppText.medium(text:
                                          '${_controller.mainJob.email}',
                                            color: HexColor(AppColors.appSubTextColor),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Image.asset('${Const.icons}icon_email.png'),
                                        ],
                                      ),
                                      onTap: () {
                                        _controller.sendEmail(toEmail: _controller.mainJob.email!);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsetsDirectional.only(end: 16),
                                  child: Align(
                                    child: InkWell(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          AppText.medium(text:
                                          '${_controller.mainJob.whatsapp}',
                                            color: HexColor(AppColors.appSubTextColor),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Image.asset('${Const.icons}icon_phone.png'),
                                        ],
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('tel://${_controller.mainJob.whatsapp}'));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin:
                      EdgeInsetsDirectional.only(top: 44.r, start: 20.r, end: 20.r),
                      child: Stack(
                        children: [
                          AppWidgets.CustomButton(
                              text: 'communication_through_whatsapp'.tr,
                              isUpperCase: false,
                              height: 48.h,
                              radius: 5,
                              background: HexColor(AppColors.appMainColor),
                              borderColor: HexColor(AppColors.appMainColor),
                              click: ()  {
                                _controller.whatsapp(phone: _controller.mainJob.whatsapp!);
                                // TODO "https://wa.me/${number}?text=Hello"
                              }),
                          Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsetsDirectional.only(start: 40, top: 10),
                              child: Image.asset('${Const.icons}icon_wahtsapp.png')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        height: 200,
                        child: SvgPicture.asset('${Const.images}image_job_hunt_main.svg', fit: BoxFit.scaleDown)),
                    AppText.medium(text: 'no_jobs_yet',
                        fontSize: 20,
                        color: AppColors.darkMainColor)
                  ],
                ),
              );
            }
          }else if(snapshot.connectionState == ConnectionState.done){
            return AppWidgets.CustomAnimationProgress();
          }else {
            return Container();
          }
        },
      ),
    );
  }
}
