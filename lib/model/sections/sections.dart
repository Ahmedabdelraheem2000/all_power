class Sections {
  bool? status;
  String? msg;
  Result? result;

  Sections({this.status, this.msg, this.result});

  Sections.fromJson(Map<String, dynamic> json) {
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
  List<JobSectionData>? sections;

  Result({this.sections});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['job_sections'] != null) {
      sections = <JobSectionData>[];
      json['job_sections'].forEach((v) {
        sections!.add(new JobSectionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sections != null) {
      data['job_sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobSectionData {
  int? id;
  String? image;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  bool isSelected = false;

  JobSectionData(
      {this.id,
      this.image,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.isSelected = false});

  JobSectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
