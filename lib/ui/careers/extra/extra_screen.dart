import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/utils/constants.dart';


class ExtraScreen extends StatelessWidget {
  const ExtraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23, end: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'hotel'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Color(0xff0565AC),
                  ),
                ),
                Text(
                  'work'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Color(0xff0565AC),
                  ),
                ),
                Text(
                  'order_status'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Color(0xff0565AC),
                    fontFamily: Const.appFont,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 14, end: 14, top: 15),
            child: Card(
              elevation: 3,
              child: Container(
                width: 343.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 17, end: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'جلوريا'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          fontFamily: Const.appFont,
                          color: Color(0xff000000),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'الأحد -الثلاثاء-الخميس '.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: Const.appFont,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            '10:00-13:00'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              fontFamily: Const.appFont,
                              color: Color(0xff000000).withAlpha(40),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'مقبول'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: Const.appFont,
                          fontSize: 16.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
