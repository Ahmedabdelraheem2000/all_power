
import 'package:hire_me/model/auth/user.dart';
import 'package:hire_me/model/days.dart';
import 'package:hire_me/model/hotel.dart';
import 'package:hire_me/model/sections/sections.dart';

class ApplyExtraJob {
  bool? status;
  String? msg;
  Result? result;

  ApplyExtraJob({this.status, this.msg, this.result});

  ApplyExtraJob.fromJson(Map<String, dynamic> json) {
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
  Extrajob? extrajob;

  Result({this.extrajob});

  Result.fromJson(Map<String, dynamic> json) {
    extrajob = json['extrajob'] != null
        ? new Extrajob.fromJson(json['extrajob'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.extrajob != null) {
      data['extrajob'] = this.extrajob!.toJson();
    }
    return data;
  }
}

class Extrajob {
  int? id;
  JobSectionData? category;
  DayData? day;
  Hotel? hotel;
  User? customer;
  String? type;
  String? timeForm;
  String? timeTo;
  String? date;

  Extrajob(
      {this.id,
        this.category,
        this.day,
        this.hotel,
        this.customer,
        this.type,
        this.timeForm,
        this.timeTo,
        this.date});

  Extrajob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new JobSectionData.fromJson(json['category'])
        : null;
    day = json['day'] != null ? new DayData.fromJson(json['day']) : null;
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    customer = json['customer'] != null
        ? new User.fromJson(json['customer'])
        : null;
    type = json['type'];
    timeForm = json['time_form'];
    timeTo = json['time_to'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['type'] = this.type;
    data['time_form'] = this.timeForm;
    data['time_to'] = this.timeTo;
    data['date'] = this.date;
    return data;
  }
}

