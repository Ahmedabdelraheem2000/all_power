import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/constants.dart';

class AppText {
  static Widget larg(
      {required String text,
      Color? color = AppColors.lightBlack,
      double fontSize = 22,
      FontWeight fontWeight = FontWeight.w700,
      TextAlign? textAlign}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: Platform.isAndroid ? fontSize.sp : 15.sp,
          fontWeight: fontWeight,
          color: color),
    );
  }

  static Widget semiLarg(
      {required String text,
        Color? color = AppColors.lightBlack,
        double fontSize = 20,
        FontWeight fontWeight = FontWeight.w600,
        TextAlign? textAlign}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: Platform.isAndroid ? fontSize.sp : 15.sp,
          fontWeight: fontWeight,
          color: color),
    );
  }

  static Widget medium(
      {required String text,
      Color? color = Colors.black,
      double fontSize = 16,
      double? height,
      FontWeight fontWeight = FontWeight.w500,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      int? maxline}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: textDecoration,
          overflow: TextOverflow.ellipsis,
          fontFamily: Const.appFont,
          fontSize: Platform.isAndroid ? fontSize.sp : 13.sp,
          color: color,
          height: height,
          fontWeight: fontWeight),
    );
  }

  static Widget small(
      {required String text,
      fontWeight = FontWeight.w400,
      Color? color = AppColors.lightBlack,
      TextAlign? textAlign,
      double fontSize = 14,
      int maxLines = 1}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontWeight: fontWeight,
          fontSize: Platform.isAndroid ? fontSize : 12,
          color: color,
          overflow: TextOverflow.ellipsis),
      maxLines: maxLines,
    );
  }

  static Widget soSmall(
      {required String text,
      Color? color = AppColors.lightBlack,
      fontWeight = FontWeight.w400,
      int fontSize = 12,
      TextAlign? textAlign}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: fontSize.sp,
          color: color,
          fontWeight: fontWeight),
    );
  }

  static Widget subText({required String text}) {
    return Text(
      text.tr,
      style: TextStyle(
          fontFamily: Const.appFont, fontSize: 12, color: AppColors.lightGray),
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
  static Widget authText({required String text}) {
    return Text(
      text.tr,
      style: const TextStyle(
          fontFamily: Const.appFont, fontSize: 24, color:Colors.black),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
