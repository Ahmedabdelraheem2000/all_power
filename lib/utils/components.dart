import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppWidgets {


  static Widget CustomButton({
    required String text,
    required Function() click,
    double width = double.infinity,
    double height = 48.0,
    Color background = AppColors.darkMainColor,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w700,
    double radius = 0.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.darkMainColor,
    double borderWidth = 1.5,
  }) =>
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(color: borderColor, width: borderWidth)),
        child: MaterialButton(
          onPressed: click,
          child: Text(
            isUpperCase ? text.toUpperCase().tr : text.tr,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontFamily: fontfamily,
                fontWeight: fontWeight),
          ),
        ),
      );

  static Widget CustomAnimationProgress() => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 40.w,
          height: 40.h,
          child: LoadingAnimationWidget.fourRotatingDots(
              color: AppColors.darkMainColor,
              size: 25.h)));
}

class MainToolBar extends StatelessWidget {
  String? title;
  String? route = '';
  bool? isBack = false;

  MainToolBar({required this.title, this.route, this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            SizedBox(width: 20),
            isBack!
                ? InkWell(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () => Get.offAndToNamed(route!))
                : Container(),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                '$title'.tr,
                style: TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: Const.appFont),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TextAbout extends StatelessWidget {
  const TextAbout({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Text(title.tr, style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: const Color(0xff000000),
          fontFamily: Const.appFont
      ),),
    );
  }
}