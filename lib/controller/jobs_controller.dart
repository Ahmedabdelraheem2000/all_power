import 'package:get/get.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/extra_sections/extra_sections.dart';
import 'package:hire_me/model/sections/sections.dart';
import 'package:hire_me/utils/app_helper.dart';


class JobsController extends GetxController{

  List<JobSectionData> listJobSections = [];
  List<ExtraSectionsData> listExtraSections = [];

  Future<void> getSections() async {
    try {
      await ApiRequests.getJobSections(language: AppHelper.getAppLanguage())
          .then((value) {
        if (value != null && value.result != null && value.result!.sections != null) {
          listJobSections.clear();
          listJobSections.addAll(value.result!.sections!);
        }
      });
    } catch (e) {
      print('Error in getSections: $e');
    }
  }

  Future<void> getExtraSections() async {
    try {
      await ApiRequests.getExtraSections(language: AppHelper.getAppLanguage())
          .then((value) {
        print(value.toString());
        if (value != null && value.result != null && value.result!.jobSections != null) {
          listExtraSections.clear();
          listExtraSections.addAll(value.result!.jobSections!);
          print(listExtraSections.toString());
        }
      });
    } catch (e) {
      print('Error in getExtraSections: $e');
    }
  }


}