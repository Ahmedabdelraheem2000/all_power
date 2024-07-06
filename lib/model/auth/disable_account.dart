class DisableAccount {
  bool? status;
  String? msg;
  Result? result;

  DisableAccount({this.status, this.msg, this.result});

  DisableAccount.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? guard;
  String? token;

  Result({this.user, this.guard, this.token});

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    guard = json['guard'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['guard'] = this.guard;
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? image;
  String? name;
  String? idCard;
  String? birthDate;
  String? phone;
  String? gender;
  String? email;
  String? password;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  User(
      {this.id,
        this.image,
        this.name,
        this.idCard,
        this.birthDate,
        this.phone,
        this.gender,
        this.email,
        this.password,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    idCard = json['id_card'];
    birthDate = json['birth_date'];
    phone = json['phone'];
    gender = json['gender'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['id_card'] = this.idCard;
    data['birth_date'] = this.birthDate;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['password'] = this.password;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}