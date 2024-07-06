import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/jobs_available_controller.dart';
import 'package:hire_me/model/main_jobs/main_job_data.dart';
import 'package:hire_me/model/main_jobs/main_jobs.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/ui/careers/main_job_details_screen.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';


class JobsAvailableScreen extends StatelessWidget {

  final _controller = Get.put(JobsAvailableController());

  int? sectionId;

  JobsAvailableScreen({this.sectionId});

  @override
  Widget build(BuildContext context) {
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
        future: _controller.getMainJobs(sectionId: sectionId!),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listJobs.isNotEmpty){
              return Column(
                children: [
                  InkWell(
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
                              enabled: true,
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
                    onTap: () {},
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(start: 16, top: 18),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'available_jobs'.tr,
                        style: TextStyle(
                          color: AppColors.darkMainColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          fontFamily: Const.appFont,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        itemBuilder: (context,index) => buildJobsAvailableItem(_controller.listJobs[index]), separatorBuilder: (context,index){
                      return SizedBox(height: 16,);
                    }, itemCount: _controller.listJobs.length),
                  ),
                ],
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
                        child: SvgPicture.asset('${Const.images}image_job_hunt_main.svg', fit: BoxFit.scaleDown)),
                    AppText.medium(text: 'no_jobs_yet',
                        fontSize: 20,
                        color: AppColors.darkMainColor)
                  ],
                ),
              );
            }
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildJobsAvailableItem(MainJobsData job) => Container(
    margin: const EdgeInsetsDirectional.only(start:16 ,end: 16),
    child: InkWell(
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
                margin:
                const EdgeInsetsDirectional.only(start: 12, top: 8),
                child: AppText.medium(text:
                  '${job.title}',
                  color: AppColors.darkMainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                margin:
                const EdgeInsetsDirectional.only(start: 12, top: 2),
                child: AppText.medium(text:
                  '${job.hotel!.name}',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              Container(
                margin:
                const EdgeInsetsDirectional.only(start: 10, top: 5),
                child: Row(
                  children: [
                    Image.asset('${Const.icons}icon_job_address.png'),
                    SizedBox(
                      width: 3.w,
                    ),
                    AppText.medium(text:
                      '${job.hotel!.address}',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                const EdgeInsetsDirectional.only(start: 10, top: 5),
                child: Row(
                  children: [
                    Image.asset('${Const.icons}icon_job_type1.png'),
                    SizedBox(
                      width: 3.w,
                    ),
                    AppText.medium(text:
                      '${job.type}'.tr,
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
                    AppText.medium(text:
                      'hours'.tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                    const Spacer(),
                    Image.asset('${Const.icons}icon_apply_job.png'),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      child: AppText.medium(text:
                        'Apply_for_the_job'.tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                      onTap: (){
                        Get.to(MainJobDetailsScreen(jobId: job.id, sectionId: job.section!.id));
                      }
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Image.asset('${Const.icons}icon_share_job.png'),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      child: AppText.medium(text:
                        'Job_sharing'.tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                      onTap: () => _controller.shareJob(job.title!, job.hotel!.address!, job.type!),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Get.to(MainJobDetailsScreen(jobId: job.id, sectionId: job.section!.id)),
    ),
  );

}
