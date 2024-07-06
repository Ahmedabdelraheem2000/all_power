class ApplyMainJob {
  bool? status;
  String? msg;
  List<Object>? result;

  ApplyMainJob({this.status, this.msg, this.result});

  ApplyMainJob.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = <Object>[];
      json['result'].forEach((v) {
        result!.add(new Object());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v).toList();
    }
    return data;
  }
}