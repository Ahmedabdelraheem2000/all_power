import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/main_jobs/main_job_data.dart';
import 'package:hire_me/utils/app_helper.dart';

class JobsAvailableController extends GetxController{

  List<MainJobsData> listJobs = [];

  Future<void> getMainJobs({required int sectionId}) async {
    await ApiRequests.getMainJobs(language: AppHelper.getAppLanguage(),
        sectionId: sectionId,
    jobId: 0)
        .then((value) {
          if(value != null){
            listJobs.clear();
            listJobs.addAll(value.result!.mainJobs!);
          }
    });
  }

  void shareJob(String jobName, String jobAddress, String jobType) async {
    String text = 'هناك وظيفة تناسبك في تطبيق كل القوى للتشغل ';
    String jobDetails = '$jobName في $jobAddress ب $jobType';
    String appUrl = 'https://play.google.com/store/apps/details?id=com.smartpal.allpowerرابط التطبيق ';
    Share.share('$text$jobDetails\n$appUrl', subject: jobDetails);
  }

}