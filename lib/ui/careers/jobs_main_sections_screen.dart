import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hire_me/controller/home_page_controller.dart';
import 'package:hire_me/controller/jobs_controller.dart';
import 'package:hire_me/model/jobs.dart';
import 'package:hire_me/model/sections/sections.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/ui/careers/apply_job_date_screen.dart';
import 'package:hire_me/ui/careers/jobs_available_screen.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class JobsCategoriesScreen extends StatelessWidget {
  final _controller = Get.put(JobsController());

  int? jobTypeId;

  JobsCategoriesScreen({this.jobTypeId});

  @override
  Widget build(BuildContext context) {
    print('JOB TYPE: $jobTypeId');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'Careers',
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
          //   onTap: () {},
          // )
        ],
      ),
      body: FutureBuilder(
        future: _controller.getSections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 22.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'choose_your_job'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: Const.appFont,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.listJobSections.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 190 / 155,
                        crossAxisSpacing: 300 / 20,
                        mainAxisSpacing: 25,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) =>
                          buildJobsItem(_controller.listJobSections[index]),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return AppWidgets.CustomAnimationProgress();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildJobsItem(JobSectionData section) => GetBuilder<JobsController>(
      builder: (controller) => Card(
            color: Colors.white,
            margin: EdgeInsetsDirectional.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8).r,
              side: BorderSide(
                  color: section.isSelected
                      ? HexColor(AppColors.appMainColor)
                      : AppColors.lightBorder,
                  width: 1.w),
            ),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsetsDirectional.only(bottom: 10.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.r),
                            topLeft: Radius.circular(8.r)
                        )
                    ),
                    child: Image.network(
                      '${section.imageUrl}',
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppText.medium(
                    text: section.name!,
                    color: section.isSelected
                        ? HexColor(AppColors.appMainColor)
                        : AppColors.lightBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ],
              ),
              onTap: () {
                for (JobSectionData job in controller.listJobSections) {
                  job.isSelected = false;
                }
                section.isSelected = true;
                controller.update();

                Get.to(JobsAvailableScreen(sectionId: section.id));
              },
            ),
          ));
}
