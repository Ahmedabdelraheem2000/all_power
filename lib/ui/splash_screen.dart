import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/settings_controller.dart';
import 'package:hire_me/controller/splash_controller.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';

class SplashScreen extends GetView<SplashController> {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // alignment: Alignment.bottomRight,
        children: [
          Image.asset('${Const.images}background.png',
              fit: BoxFit.cover, width: double.infinity),
          Container(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  child: Image.asset(
                    '${Const.images}new_logo_profile.png',
                  ),
                ),
                Image.asset(
                  '${Const.images}extra_supers.png',
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(right: 16, bottom: 50),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO للاتسفسار هاتفياً الاتصال على هاتف رقم 02581111
                // TODO للاتسفسار داخل المكتب  "  مجمع البركة، شارع نعومي كيس
                AppText.medium(text: '',
                fontSize: 12),
                AppText.medium(text: '',
                    fontSize: 11),
              ],
            ),
          )
        ],
      ),
    );
  }
}
