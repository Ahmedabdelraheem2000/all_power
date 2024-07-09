import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/apply_job_controller.dart';
import 'package:hire_me/model/days.dart';
import 'package:hire_me/model/days_old.dart';
import 'package:hire_me/model/extra_jobs/extra_job_type.dart';
import 'package:hire_me/model/extra_jobs/extra_jobs.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class ApplyExtraJobDateScreen extends StatelessWidget {
  final ApplyJobController _controller = Get.put(ApplyJobController());

  int? sectionId;
  ApplyExtraJobDateScreen({this.sectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          /*InkWell(
            child: Container(
                margin: const EdgeInsets.only(left: 16, bottom: 4).r,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage('${Const.defaultImage}'),
                )),
            onTap: () {},
          )*/
        ],
      ),
      body: FutureBuilder(
        future: _controller.getDays(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(start: 16.r, top: 30.r),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GetBuilder<ApplyJobController>(
                      builder: (daysController) => Row(
                        children: daysController.listDays
                            .map((day) => Card(
                          elevation: 8,
                          color: day.isSelected
                              ? HexColor(AppColors.appMainColor)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              side: BorderSide(
                                  color: day.isSelected
                                      ? Colors.white
                                      : HexColor(AppColors.appOtherColor),
                                  width: 1)),
                          child: InkWell(
                            child: Container(
                              width: 50.r,
                              height: 50.r,
                              margin: EdgeInsets.all(4.r),
                              child: CircleAvatar(
                                backgroundColor: day.isSelected
                                    ? HexColor(AppColors.appMainColor)
                                    : Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 4),
                                    AppText.larg(
                                        text: day.name!,
                                        fontSize: 12.sp,
                                        color: day.isSelected
                                            ? Colors.white
                                            : Colors.black)
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              for (DayData days in _controller.listDays) {
                                days.isSelected = false;
                              }
                              day.isSelected = true;
                              _controller.daySelectedId = day.id!;
                              daysController.update();
                              _controller.getExtraJobs(sectionId: sectionId, dayId: day.id);
                              _controller.update();
                              print('DAY SELECTED: ${day.id}');
                            },
                          ),
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _controller.extraJobsType.map((e) => GetBuilder<ApplyJobController>(builder: (controller) => InkWell(
                      child: Container(
                        height: 32,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: e.isSelect ? AppColors.darkMainColor : Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: AppText.medium(
                            textAlign: TextAlign.center,
                            text: e.name, color: e.isSelect ? Colors.white : AppColors.darkMainColor),
                      ),
                      onTap: () {
                        for(ExtraJobType type in _controller.extraJobsType){
                          type.isSelect = false;
                        }

                        e.isSelect = true;
                        _controller.getExtraJobs(sectionId: sectionId, dayId: _controller.daySelectedId, type: e.type);
                        controller.update();
                      },
                    ))).toList(),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: GetBuilder<ApplyJobController>(builder: (controller) => FutureBuilder(
                    future: _controller.getExtraJobs(sectionId: sectionId),
                    builder: (context, snapshot) {
                      if(_controller.listExtraJobs.isNotEmpty || _controller.listExtraJobs== null){
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              GetBuilder<ApplyJobController>(builder: (controller) => ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _controller.listExtraJobs.length,
                                  itemBuilder: (context, index) => buildDatesItem(_controller.listExtraJobs[index]))),
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsetsDirectional.only(
                                    top: 44.r, start: 24.r, end: 24.r),
                                child: AppWidgets.CustomButton(
                                    text: 'save'.tr,
                                    isUpperCase: false,
                                    height: 48.h,
                                    radius: 5,
                                    background: HexColor(AppColors.appMainColor),
                                    borderColor: HexColor(AppColors.appMainColor),
                                    click: () {
                                      print('DAY: ${_controller.jobSelectedId}');
                                      if(_controller.jobSelectedId == 0){
                                        AppHelper.showToast(message: 'Please select any time you want to work it', color: Colors.redAccent);
                                      }else{
                                        _controller.applyJob(jobId: _controller.jobSelectedId);
                                      }
                                    }),
                              ),
                            ],
                          ),
                        );
                      }else {
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
                                  child: SvgPicture.asset('${Const.images}image_job_offers_extra.svg', fit: BoxFit.scaleDown)),
                              AppText.medium(text: 'no_jobs_yet',
                                  fontSize: 20,
                                  color: AppColors.darkMainColor)
                            ],
                          ),
                        );
                      }
                    },
                  )),
                ),
              ],
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else {
            return Container();
          }
        },
      ),
    );
  }

  //fixThis
  Widget buildDatesItem(ExtraJobData extraJob) => GetBuilder<ApplyJobController>(builder: (controller) => Card(
    margin: EdgeInsets.all(10),
    color: AppColors.lightGray6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Container(
      width: 343.w,
      height: 40.h,
      child: Row(
        children: [
          GetBuilder<ApplyJobController>(builder: (controller) => CustomCheckBox(
            value: extraJob.isCheck,
            checkedFillColor: AppColors.darkMainColor,
            splashColor: AppColors.darkMainColor,
            borderColor: Colors.white,
            tooltip: 'Custom Check Box',
            splashRadius: 9,
            onChanged: (val) {
              for(ExtraJobData extra in controller.listExtraJobs){
                extra.isCheck = false;
              }
              controller.jobSelectedId = extraJob.id!;
              extraJob.isCheck = true;
              controller.update();
            },
          )),
          SizedBox(width: 10.r),
          AppText.medium(
              text: '${extraJob.timeForm}-${extraJob.timeTo}', fontWeight: FontWeight.w400),
          SizedBox(width: 10.r),
          AppText.medium(
              text: '', fontWeight: FontWeight.w400),
          SizedBox(width: 10.r),
          AppText.medium(
            text: extraJob.jobTitle == null || extraJob.jobTitle!.trim().isEmpty || extraJob.jobTitle.toString().length<=0
                ? ''
                : '${extraJob.jobTitle}',
            fontWeight: FontWeight.w400,
          )

        ],
      ),
    ),
  ));
}
