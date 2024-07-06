
import 'package:hire_me/model/hotel.dart';

class NotificationData {
  int? id;
  String? date;
  String? title;
  dynamic? jobId;
  Hotel? hotel;

  NotificationData({this.id, this.date, this.title, this.hotel});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    jobId = json['job_id'];
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['title'] = this.title;
    data['job_id'] = this.jobId;
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    return data;
  }
}