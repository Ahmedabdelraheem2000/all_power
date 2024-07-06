
import 'package:hire_me/model/auth/user.dart';

class EditProfile {
  bool? status;
  String? msg;
  Result? result;

  EditProfile({this.status, this.msg, this.result});

  EditProfile.fromJson(Map<String, dynamic> json) {
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
  User? customer;

  Result({this.customer});

  Result.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new User.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}