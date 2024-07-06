/*
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';


class ScheduleScreen extends StatelessWidget {

  final List<Widget> screen =[

    Container(
      color: Colors.amber,
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
    ),
    Container(
      color: Colors.redAccent,
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
    ),

  ];
   ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor(isHome: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'terms'.tr,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: true,
        actions: [
          InkWell(
            child: Container(
                margin: const EdgeInsets.only(left: 16, bottom: 4).r,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('${Const.defaultImage}'),
                )),
            onTap: (){},
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
          onPressed: () => Navigator.maybePop(context))

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 52,end: 52,top: 29),
            child: Container(
              height: 65.h,
              width: 269,
              child: SwitchTab(
                text: const ["عام", "إكسترا"],
                shape: SwitchTabShape.rounded,
                selectedTextColor: Colors.white,
                thumbColor: Color(0xff0565AC),
                backgroundColour: Color(0xffF2F2F2),
                unselectedTextColor:Color(0xff0565AC) ,
                onValueChanged: (index) => screen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
