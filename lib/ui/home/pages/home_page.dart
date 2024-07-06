import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hire_me/controller/home_page_controller.dart';
import 'package:hire_me/model/job_type.dart';
import 'package:hire_me/model/slider.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/ui/careers/extra/extra_sections_screen.dart';
import 'package:hire_me/ui/careers/jobs_main_sections_screen.dart';
import 'package:hire_me/ui/home/pages/home_silder_widget.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomePageController());

  final PageController _pageController = PageController();

  int getReverseIndex(int index, int length) {
    return length - index - 1;
  }

  @override
  Widget build(BuildContext context) {
    // print('HOME TOKEN: ${AppHelper.getCurrentUserToken()}');
    // print('HOME USER: ${jsonEncode(AppHelper.getCurrentUser())}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'home',
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
              // TODO 31.784944, 35.227806
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
      body: GetBuilder<HomePageController>(
          builder: (controller) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /*InkWell(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsetsDirectional.only(
                      top: 10.r, start: 20.r, end: 20.r),
                  padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  decoration: BoxDecoration(
                    color: HexColor(AppColors.formSearchColor),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabled: false,
                        hintText: 'search_here'.tr,
                        filled: true,
                        fillColor: HexColor(AppColors.formSearchColor),
                        hintStyle: const TextStyle(
                          color: Color(0xff9B9B9B),
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor(AppColors.formSearchColor),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 343.w,
                          maxHeight: 50.h,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor(AppColors.formSearchColor),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        prefixIcon: Container(
                            height: 8,
                            width: 8,
                            child: Image.asset(
                              '${Const.icons}icon_search_fill.png',
                              height: 8,
                              width: 8,
                            )),
                        suffixIcon: Container(
                            height: 8,
                            width: 8,
                            child: SvgPicture.asset(
                              '${Const.icons}icon_clear.svg',
                              height: 8,
                              width: 8,
                              fit: BoxFit.scaleDown,
                            ))),
                  )),
              onTap: () => Get.toNamed(Routes.search),
            ),*/
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: FutureBuilder(
                          future: _controller.fetchSliders(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.done){
                              return ImageSlideshow(
                                width: 360,
                                height: 280,
                                initialPage: 0,
                                indicatorRadius: 5,
                                indicatorColor: AppColors.darkMainColor,
                                indicatorBackgroundColor: AppColors.grayColor,
                                autoPlayInterval: 5000,
                                isLoop: true,
                                children: controller.sliders.map((image) => InkWell(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.network(
                                      image.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () => launchUrl(Uri.parse(image.imageUrl)),
                                )).toList(),
                              );
                            }else if(snapshot.connectionState == ConnectionState.waiting || snapshot.hasData == false){
                              return AppWidgets.CustomAnimationProgress();
                            }else {
                              return Container();
                            }
                          },
                        ),                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 100).r,
                        child: AppText.medium(text: 'select_job_type')),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.listJobType.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 14,
                          childAspectRatio: 100 / 80,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => buildJobTypeItem(
                            context, controller.listJobType[index])),
                    // Container(
                    //   margin: EdgeInsetsDirectional.only(start: 24.r, bottom: 6.r),
                    //     alignment: AlignmentDirectional.topStart,
                    //     child: AppText.medium(text: 'available_jobs')),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     itemCount: 8,
                    //     itemBuilder: (context, index) => buildJobsAvailableItem())
                  ],
                ),
              )),
    );
  }

  Widget buildJobTypeItem(BuildContext context, JobType jobType) => Container(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            color: jobType.isSelected
                ? HexColor(AppColors.appMainColor)
                : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('${Const.icons}icon_job_type.png',
                    fit: BoxFit.scaleDown),
                SizedBox(height: 8.h),
                AppText.medium(
                    text: getSectionTitle(jobType.title),
                    color: jobType.isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)
              ],
            ),
          ),
          onTap: () {
            for (JobType type in _controller.listJobType) {
              type.isSelected = false;
            }
            jobType.isSelected = true;
            _controller.update();
            if (jobType.id == 1) {
              Get.to(()=>JobsCategoriesScreen(jobTypeId: jobType.id));
            } else {
              if (AppHelper.getCurrentUserToken() != null) {
                Get.to(()=>ExtraSectionsScreen(jobTypeId: jobType.id));
              } else {
                AppHelper.showLoginBottomSheet(context);
              }
            }
          },
        ),
      );

  String getSectionTitle(String title) {
    if (title == 'وظائف اكسترا' || title == 'עבודות נוספות') {
      return AppHelper.getAppLanguage() == 'ar'
          ? 'وظائف اكسترا'
          : 'עבודות נוספות';
    } else {
      return AppHelper.getAppLanguage() == 'ar'
          ? 'وظائف ثابتة'
          : 'עבודות קבועות';
    }
  }

  Widget buildJobsAvailableItem() => Container(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Card(
          margin: EdgeInsets.all(4.r),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8).r,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 12, top: 8),
                  child: AppText.medium(
                    text: 'chef'.tr,
                    color: AppColors.darkMainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 12, top: 2),
                  child: AppText.medium(
                    text: 'Al_Zahraa_Restaurant'.tr,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 10, top: 5),
                  child: Row(
                    children: [
                      Image.asset('${Const.icons}icon_job_address.png'),
                      SizedBox(
                        width: 3.w,
                      ),
                      AppText.medium(
                        text: 'Jerusalem_Al',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 10, top: 5),
                  child: Row(
                    children: [
                      Image.asset('${Const.icons}icon_job_type1.png'),
                      SizedBox(
                        width: 3.w,
                      ),
                      AppText.medium(
                        text: 'part_time'.tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 8, top: 8, end: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('${Const.icons}icon_job_date.png'),
                      SizedBox(
                        width: 3,
                      ),
                      AppText.medium(
                        text: 'hours'.tr,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                      const Spacer(),
                      Image.asset('${Const.icons}icon_apply_job.png'),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                          child: AppText.medium(
                            text: 'Apply_for_the_job'.tr,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.mainJobDetails);
                          }),
                      const SizedBox(
                        width: 11,
                      ),
                      Image.asset('${Const.icons}icon_share_job.png'),
                      const SizedBox(
                        width: 3,
                      ),
                      AppText.medium(
                        text: 'Job_sharing'.tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
