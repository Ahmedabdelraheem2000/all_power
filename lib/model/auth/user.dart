class User {
  int? id;
  String? image;
  String? name;
  String? idCard;
  String? phone;
  String? birthDate;
  String? gender;
  String? email;
  String? password;
  dynamic? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  User(
      {this.id,
        this.image,
        this.name,
        this.idCard,
        this.phone,
        this.birthDate,
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
    phone = json['phone'];
    birthDate = json['birth_date'];
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
    data['phone'] = this.phone;
    data['birth_date'] = this.birthDate;
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