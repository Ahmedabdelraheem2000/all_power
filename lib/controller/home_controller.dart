
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me/ui/home/pages/home_page.dart';
import 'package:hire_me/ui/home/pages/notifications_page.dart';
import 'package:hire_me/ui/home/pages/schedules_page.dart';
import 'package:hire_me/ui/home/pages/settings_page.dart';

class HomeController extends GetxController {

  List<Widget> listScreens = [
    HomePage(),
    SchedulesPage(),
    NotificationsPage(),
    SettingsPage()
  ];

  var navIndex = 0;

  void getCurrenNavIndex({required int navIndex}) async {
    this.navIndex = navIndex;
    update();
  }
}
