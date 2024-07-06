class Days {
  bool? status;
  String? msg;
  Result? result;

  Days({this.status, this.msg, this.result});

  Days.fromJson(Map<String, dynamic> json) {
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
  List<DayData>? days;

  Result({this.days});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['days'] != null) {
      days = <DayData>[];
      json['days'].forEach((v) {
        days!.add(new DayData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  bool isSelected = false;

  DayData({this.id, this.name, this.createdAt, this.updatedAt, this.isSelected = false});

  DayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}