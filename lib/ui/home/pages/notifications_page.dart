import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/notification_controller.dart';
import 'package:hire_me/model/notification/notification_data.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/ui/careers/main_job_details_screen.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';

class NotificationsPage extends StatelessWidget {

  final _controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'notifications',
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
              GoogleMapUtils.openGoogleMap(
                  latitude: double.parse('31.784944'),
                  longitude: double.parse('35.227806'));
            },
          )
          // InkWell(
          //   child: Container(
          //       margin: const EdgeInsets.only(left: 16, bottom: 4).r,
          //       child: const CircleAvatar(
          //         backgroundImage: NetworkImage(Const.defaultImage),
          //       )),
          //   onTap: () => Get.toNamed(Routes.profile),
          // )
        ],
      ),
      body: FutureBuilder(
        future: _controller.getNotifications(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listNotifications.isNotEmpty){
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.listNotifications.length,
                  itemBuilder: (context, index) =>  buildNotificationItem(_controller.listNotifications[index]));
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
                        child: SvgPicture.asset('${Const.images}image_my_notifications.svg', fit: BoxFit.scaleDown)),
                    AppText.medium(text: 'no_notifications',
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

  Widget buildNotificationItem(NotificationData notification) => InkWell(
    child: Card(
      margin: EdgeInsets.only(top: 16.r, bottom: 16.r, left: 12.r, right: 12.r),
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
        width: double.infinity,
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(Const.defaultUserImage),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: notification.hotel != null ? '${notification.hotel!.name}' : ''),
                    AppText.medium(text: '${notification.title}',
                        fontSize: 14,
                        maxline: 2),
                    AppText.medium(text: '${notification.date}',
                        fontSize: 12),
                  ],
                ),
              ),
            ),
            const CircleAvatar(
                radius: 4,
                backgroundColor: AppColors.darkMainColor),
          ],
        ),
      ),
    ),
    onTap: () {
      print('Job ID: ${notification.jobId}');
      if(notification.jobId != '')
        Get.to(MainJobDetailsScreen(jobId: notification.jobId));
    },
  );
}