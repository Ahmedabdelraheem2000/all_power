
import 'package:hire_me/model/main_jobs/main_job_data.dart';

class MainJobDetails {
  bool? status;
  String? msg;
  Result? result;

  MainJobDetails({this.status, this.msg, this.result});

  MainJobDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  MainJobsData? mainJobs;

  Result({this.mainJobs});

  Result.fromJson(Map<String, dynamic> json) {
    mainJobs = json['main_jobs'] != null
        ? new MainJobsData.fromJson(json['main_jobs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainJobs != null) {
      data['main_jobs'] = this.mainJobs!.toJson();
    }
    return data;
  }
}