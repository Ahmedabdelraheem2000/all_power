
import 'package:hire_me/model/hotel.dart';
import 'package:hire_me/model/sections/sections.dart';

class MainJobsData {
  int? id;
  String? title;
  Hotel? hotel;
  JobSectionData? section;
  String? description;
  String? type;
  String? email;
  String? whatsapp;
  String? imageUrl;

  MainJobsData(
      {this.id,
        this.title,
        this.hotel,
        this.section,
        this.description,
        this.type,
        this.email,
        this.whatsapp,
        this.imageUrl});

  MainJobsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    section =
    json['section'] != null ? new JobSectionData.fromJson(json['section']) : null;
    description = json['description'];
    type = json['type'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    data['description'] = this.description;
    data['type'] = this.type;
    data['email'] = this.email;
    data['whatsapp'] = this.whatsapp;
    data['image_url'] = this.imageUrl;
    return data;
  }
}