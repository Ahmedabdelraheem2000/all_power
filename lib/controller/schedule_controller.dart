import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/schedule/schedule.dart';
import 'package:hire_me/utils/app_helper.dart';

class SchedulesController extends GetxController {
  List<ScheduleData> listSchedules = [];

  String dateSelected = '';
  DateTime date = DateTime.now();

  // TODO TEST TOKEN Bearer 8|MInieFmfj5V2xTwOrwc8BjvlQntabk2FHU5NRanj
  Future<void> getSchedule(String date) async {
    await ApiRequests.getSchedules(
            date: date,
            language: AppHelper.getAppLanguage(),
            token: AppHelper.getCurrentUserToken()!)
        .then((value) {
      if (value != null) {
        listSchedules.clear();
        listSchedules.addAll(value.result!.schedules!);
        update();
      }
    });
    update();
  }

  void showDateDialog(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) return;
    date = newDate;
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    dateSelected = formattedDate;
    print('DATE: $formattedDate');
    getSchedule(dateSelected);
    update();
  }
}
