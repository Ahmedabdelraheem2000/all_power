import 'dart:ui';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/days.dart';
import 'package:hire_me/model/days_old.dart';
import 'package:hire_me/model/extra_jobs/extra_job_type.dart';
import 'package:hire_me/model/extra_jobs/extra_jobs.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_helper.dart';

class ApplyJobController extends GetxController {
  int tabIndex = 0;

  List<DaysOld> listDaysOld = [];
  List<DayData> listDays = [];
  List<ExtraJobData> listExtraJobs = [];
  bool isSelectedDate = false;
  int daySelectedId = 0;
  int jobSelectedId = 0;
  bool isCheck = false;

  List<ExtraJobType> extraJobsType = [
    ExtraJobType(name: 'morning'.tr, type: 'morning', isSelect: true),
    ExtraJobType(name: 'evening',type: 'evening', isSelect: false)
  ];

  void getDaySelected(bool isSelectedDate) {
    this.isSelectedDate = isSelectedDate;
    update();
  }

  @override
  void onInit() {
    initializeDateFormatting('ar', null);
    getDates();
    super.onInit();
  }

  Future<void> getDates() async {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final today = DateTime(now.year, now.month, now.day);
    final secoundDay = DateTime(now.year, now.month, now.day + 1);
    final thirdDay = DateTime(now.year, now.month, now.day + 2);
    final fourthDay = DateTime(now.year, now.month, now.day + 3);
    final fifthDay = DateTime(now.year, now.month, now.day + 4);
    final sixthDay = DateTime(now.year, now.month, now.day + 5);
    final seventhDay = DateTime(now.year, now.month, now.day + 6);

    // final todya = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

    final yesterdayDate = yesterday.day.toString().padLeft(2, '0');
    final yesterdayName = DateFormat('EEEE', 'ar').format(yesterday).tr;
    final fullDateYesterday =
        '${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}';

    final todayDayDate = today.day.toString().padLeft(2, '0');
    final todayDayName = DateFormat('EEEE', 'ar').format(today).tr;
    final fullDateToday =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

    final secoundDayDate = secoundDay.day.toString().padLeft(2, '0');
    final secoundDayName = DateFormat('EEEE', 'ar').format(secoundDay).tr;
    final fullSecoundDate =
        '${secoundDay.year}-${secoundDay.month.toString().padLeft(2, '0')}-${secoundDay.day.toString().padLeft(2, '0')}';

    final thirdDayDate = thirdDay.day.toString().padLeft(2, '0');
    final thirdDayName = DateFormat('EEEE', 'ar').format(thirdDay).tr;
    final fullThirdDate =
        '${thirdDay.year}-${thirdDay.month.toString().padLeft(2, '0')}-${thirdDay.day.toString().padLeft(2, '0')}';

    final fourthDayDate = fourthDay.day.toString().padLeft(2, '0');
    final fourthDayName = DateFormat('EEEE', 'ar').format(fourthDay).tr;
    final fullFourthDate =
        '${fourthDay.year}-${fourthDay.month.toString().padLeft(2, '0')}-${fourthDay.day.toString().padLeft(2, '0')}';

    final fifthDayDate = fifthDay.day.toString().padLeft(2, '0');
    final fifthDayName = DateFormat('EEEE', 'ar').format(fifthDay).tr;
    final fullFifthDate =
        '${fifthDay.year}-${fifthDay.month.toString().padLeft(2, '0')}-${fifthDay.day.toString().padLeft(2, '0')}';

    final sixthDayDate = sixthDay.day.toString().padLeft(2, '0');
    final sixthDayName = DateFormat('EEEE', 'ar').format(sixthDay).tr;
    final fullSixthDate =
        '${sixthDay.year}-${sixthDay.month.toString().padLeft(2, '0')}-${sixthDay.day.toString().padLeft(2, '0')}';

    final seventhDayDate = seventhDay.day.toString().padLeft(2, '0');
    final seventhDayName = DateFormat('EEEE', 'ar').format(seventhDay).tr;
    final fullSeventhDate =
        '${seventhDay.year}-${seventhDay.month.toString().padLeft(2, '0')}-${seventhDay.day.toString().padLeft(2, '0')}';

    // print('yesterdayD: $yesterdayDate');
    // print('yesterdayD: $yesterdayName');
    // print('yesterdayD: $fullDateYesterday');
    //
    // print('Today: $todayDayDate');
    // print('Today: $todayDayName');
    // print('Today: $fullDateToday');
    //
    // print('secound: $secoundDayDate');
    // print('secound: $secoundDayName');
    //
    // print('third: $thirdDayDate');
    // print('third: $thirdDayName');
    //
    // print('fourth: $fourthDayDate');
    // print('fourth: $fourthDayName');
    //
    // print('fifth: $fifthDayDate');
    // print('fifth: $fifthDayName');
    //
    // print('sixthe: $sixthDayDate');
    // print('sixth: $sixthDayName');
    //
    // print('seventh: $seventhDayDate');
    // print('seventh: $seventhDayName');

    listDaysOld = [
      // Days(
      //     day: 'أمس',
      //     date: yesterdayDate,
      //     fullDate: fullDateYesterday,
      //     isSelected: false),
      DaysOld(
          day: todayDayName,
          date: todayDayDate,
          fullDate: fullDateToday,
          isSelected: true),
      DaysOld(
          day: secoundDayName,
          date: secoundDayDate,
          fullDate: fullSecoundDate,
          isSelected: false),
      DaysOld(
          day: thirdDayName,
          date: thirdDayDate,
          fullDate: fullThirdDate,
          isSelected: false),
      DaysOld(
          day: fourthDayName,
          date: fourthDayDate,
          fullDate: fullFourthDate,
          isSelected: false),
      DaysOld(
          day: fifthDayName,
          date: fifthDayDate,
          fullDate: fullFifthDate,
          isSelected: false),
      DaysOld(
          day: sixthDayName,
          date: sixthDayDate,
          fullDate: fullSixthDate,
          isSelected: false),
      DaysOld(
          day: seventhDayName,
          date: seventhDayDate,
          fullDate: fullSeventhDate,
          isSelected: false),
    ];

    update();
  }

  Future<void> getDays() async {
    await ApiRequests.getDays(language: AppHelper.getAppLanguage())
        .then((value) {
      if (value != null) {
        listDays.clear();
        listDays.addAll(value.result!.days!);
      }
    });
  }

  Future<void> getExtraJobs(
      {int? sectionId,
      int? dayId,
      String? type}) async {

    await ApiRequests.getExtraJobs(
            language: AppHelper.getAppLanguage(),
            token: AppHelper.getCurrentUserToken()!,
            sectionId: sectionId!,
            dayId: dayId!,
            type: type??'')
        .then((value) {
      print('getExtraJobs ->');
      if (value != null) {
        listExtraJobs.clear();
        listExtraJobs.addAll(value.result!.extrajobs!);
        update();
      }
    });
    update();
  }

  void applyJob({required int jobId}) {
    ApiRequests.applyExtraJob(
            language: AppHelper.getAppLanguage(),
            token: AppHelper.getCurrentUserToken()!,
            jobId: jobId)
        .then((value) {
      Get.toNamed(Routes.doneApplyJob);
    });
  }
}
