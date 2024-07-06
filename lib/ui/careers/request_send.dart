import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
class ReauestSend extends StatelessWidget {
  const ReauestSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              '${Const.images}rquest_images.png',
              height: 182.h,
              width: 182.w,
            ),
          ),
          Text('application_has_been_sent'.tr,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
              fontFamily: Const.appFont,
            color: const Color(0xff000000),
          ),),
          SizedBox(height: 11.h,),
          Text('Thank_choosing_company!'.tr,style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            fontFamily: Const.appFont,
            color: const Color(0xff000000),height: 1.1
          ),),
        ],
      ),
    );
  }
}
