import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/schedule_controller.dart';
import 'package:hire_me/model/schedule/schedule.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class SchedulesPage extends StatelessWidget {

  final _controller = Get.put(SchedulesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'your_table',
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: Container(
            child: InkWell(
              child: Icon(Icons.date_range_rounded),
              onTap: () => _controller.showDateDialog(context),
            )),
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
      body: FutureBuilder(
        future: _controller.getSchedule(''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listSchedules.isNotEmpty){
              return GetBuilder<SchedulesController>(builder: (controller) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsetsDirectional.only(start: 30, end: 30, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.medium(text: 'hotel_name', color: AppColors.darkMainColor),
                            AppText.medium(text: 'date_work', color: AppColors.darkMainColor),
                            AppText.medium(text: 'work_time', color: AppColors.darkMainColor),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 8.r, right: 8.r),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _controller.listSchedules.length,
                            itemBuilder: (context, index) => buildPublicJobsItem(_controller.listSchedules[index]))
                    ),
                  ],
                ),

              ));
            }else {
              return GetBuilder<SchedulesController>(builder: (controller) => Container(
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
                    AppText.medium(text: 'you_have_not_applied_jobs',
                        fontSize: 20,
                        color: AppColors.darkMainColor)
                  ],
                ),
              ));
            }
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return GetBuilder<SchedulesController>(builder: (controller) => AppWidgets.CustomAnimationProgress());
          }else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildPublicJobsItem(ScheduleData schedule) => Padding(
    padding: const EdgeInsetsDirectional.only(start: 10,end: 10,top: 15),
    child: Card(
      elevation: 3,
      child: Container(
        width: 343.w,
        height:
        70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8).r,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 17,end: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppText.medium(
                    text: '${schedule.hotel!.name}',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  maxline: 2,
                  color: AppColors.lightBlack),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium(text: '${schedule.date}',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.lightBlack),
                  ],
                ),
              ),
              Expanded(
                child: AppText.medium(text: '${schedule.timeForm}-${schedule.timeTo}',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.lightBlack),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
