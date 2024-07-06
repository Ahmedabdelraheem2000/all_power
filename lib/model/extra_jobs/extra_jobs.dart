
import 'package:hire_me/model/days.dart';
import 'package:hire_me/model/hotel.dart';
import 'package:hire_me/model/pagination.dart';
import 'package:hire_me/model/sections/sections.dart';

class ExtraJobs {
  bool? status;
  String? msg;
  Result? result;

  ExtraJobs({this.status, this.msg, this.result});

  ExtraJobs.fromJson(Map<String, dynamic> json) {
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
  List<ExtraJobData>? extrajobs;
  Pagination? pagination;

  Result({this.extrajobs, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['extrajob'] != null) {
      extrajobs = <ExtraJobData>[];
      json['extrajob'].forEach((v) {
        extrajobs!.add(new ExtraJobData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.extrajobs != null) {
      data['extrajob'] = this.extrajobs!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class ExtraJobData {
  int? id;
  String? jobTitle;
  JobSectionData? category;
  DayData? day;
  Hotel? hotel;
  String? customer;
  String? type;
  String? timeForm;
  String? timeTo;
  String? date;
  bool isCheck = false;

  ExtraJobData(
      {this.id,
        this.jobTitle,
        this.category,
        this.day,
        this.hotel,
        this.customer,
        this.type,
        this.timeForm,
        this.timeTo,
        this.date,
        bool isCheck = false});

  ExtraJobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    category = json['category'] != null
        ? new JobSectionData.fromJson(json['category'])
        : null;
    day = json['day'] != null ? new DayData.fromJson(json['day']) : null;
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    customer = json['customer'];
    type = json['type'];
    timeForm = json['time_form'];
    timeTo = json['time_to'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_title'] = this.jobTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    data['customer'] = this.customer;
    data['type'] = this.type;
    data['time_form'] = this.timeForm;
    data['time_to'] = this.timeTo;
    data['date'] = this.date;
    return data;
  }
}

