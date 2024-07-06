
import 'package:hire_me/model/main_jobs/main_job_data.dart';
import 'package:hire_me/model/pagination.dart';

class MainJobs {
  bool? status;
  String? msg;
  Result? result;

  MainJobs({this.status, this.msg, this.result});

  MainJobs.fromJson(Map<String, dynamic> json) {
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
  List<MainJobsData>? mainJobs;
  Pagination? pagination;

  Result({this.mainJobs, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['main_jobs'] != null) {
      mainJobs = <MainJobsData>[];
      json['main_jobs'].forEach((v) {
        mainJobs!.add(new MainJobsData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainJobs != null) {
      data['main_jobs'] = this.mainJobs!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}