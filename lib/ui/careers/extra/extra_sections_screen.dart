import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/jobs_controller.dart';
import 'package:hire_me/model/extra_sections/extra_sections.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/ui/careers/apply_job_date_screen.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';

class ExtraSectionsScreen extends StatefulWidget {
  int? jobTypeId;

  ExtraSectionsScreen({this.jobTypeId});

  @override
  State<ExtraSectionsScreen> createState() => _ExtraSectionsScreenState();
}

class _ExtraSectionsScreenState extends State<ExtraSectionsScreen> {
  final _controller = Get.put(JobsController());

  @override
  Widget build(BuildContext context) {
    print('JOB TYPE: ${widget.jobTypeId}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'extra_jobs',
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
            onTap: () => Get.toNamed(Routes.map),
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
        future: _controller.getExtraSections(),
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
                        itemCount: _controller.listExtraSections.length,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 190 / 155,
                          crossAxisSpacing: 300 / 20,
                          mainAxisSpacing: 25,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => buildJobsItem(
                            _controller.listExtraSections[index])),
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

  Widget buildJobsItem(ExtraSectionsData extraSection) =>
      GetBuilder<JobsController>(
          builder: (controller) => Card(
                color: Colors.white,
                margin: EdgeInsetsDirectional.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8).r,
                  side: BorderSide(
                      color: extraSection.isSelected
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
                                topLeft: Radius.circular(8.r))),
                        child: Image.network(
                          '${extraSection.imageUrl}',
                          // fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      AppText.medium(
                        text: extraSection.name!,
                        color: extraSection.isSelected
                            ? HexColor(AppColors.appMainColor)
                            : AppColors.lightBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  onTap: () {
                    for (ExtraSectionsData extra
                        in controller.listExtraSections) {
                      extra.isSelected = false;
                    }
                    extraSection.isSelected = true;
                    controller.update();

                    Get.to(ApplyExtraJobDateScreen(sectionId: extraSection.id));
                  },
                ),
              ));
}
