class ExtraSections {
  bool? status;
  String? msg;
  Result? result;

  ExtraSections({this.status, this.msg, this.result});

  ExtraSections.fromJson(Map<String, dynamic> json) {
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
  List<ExtraSectionsData>? jobSections;

  Result({this.jobSections});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['job_sections'] != null) {
      jobSections = <ExtraSectionsData>[];
      json['job_sections'].forEach((v) {
        jobSections!.add(new ExtraSectionsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobSections != null) {
      data['job_sections'] = this.jobSections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExtraSectionsData {
  int? id;
  String? image;
  String? name;
  String? nameAr;
  String? nameHe;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  bool isSelected = false;

  ExtraSectionsData(
      {this.id,
        this.image,
        this.name,
        this.nameAr,
        this.nameHe,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.isSelected = false});

  ExtraSectionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    nameAr = json['name_ar'];
    nameHe = json['name_he'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['name_he'] = this.nameHe;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}