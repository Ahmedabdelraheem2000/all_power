
import 'package:hire_me/model/hotel.dart';

class Schedules {
  bool? status;
  String? msg;
  Result? result;

  Schedules({this.status, this.msg, this.result});

  Schedules.fromJson(Map<String, dynamic> json) {
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
  List<ScheduleData>? schedules;

  Result({this.schedules});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['my_schedule'] != null) {
      schedules = <ScheduleData>[];
      json['my_schedule'].forEach((v) {
        schedules!.add(new ScheduleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedules != null) {
      data['my_schedule'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleData {
  Hotel? hotel;
  String? timeForm;
  String? timeTo;
  String? date;

  ScheduleData({this.hotel, this.timeForm, this.timeTo, this.date});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    timeForm = json['time_form'];
    timeTo = json['time_to'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    data['time_form'] = this.timeForm;
    data['time_to'] = this.timeTo;
    data['date'] = this.date;
    return data;
  }
}
