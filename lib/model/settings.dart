class ApiResponse {
  bool status;
  String msg;
  Condition? condition;
  Setting? setting;

  ApiResponse({
    required this.status,
    required this.msg,
    this.condition,
    this.setting,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      msg: json['msg'],
      condition: json['result']['condition'] != null ? Condition.fromJson(json['result']['condition']) : null,
      setting: json['result']['setting'] != null ? Setting.fromJson(json['result']['setting']) : null,
    );
  }
}

class Condition {
  int id;
  String name;
  String description;
  String link;
  String? image;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  Condition({
    required this.id,
    required this.name,
    required this.description,
    required this.link,
    this.image,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      link: json['link'],
      image: json['image'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      imageUrl: json['image_url'],
    );
  }
}

class Setting {
  int id;
  String websiteName;
  String email;
  String address;
  String seoKeywords;
  String seoDescription;
  String phone;
  String mobile;
  String facebook;
  String instagram;
  String whatsapp;
  String twitter;
  String linkedIn;
  String logo;
  String favicon;
  String description;
  DateTime? createdAt;
  DateTime updatedAt;
  String logoUrl;
  String faviconUrl;

  Setting({
    required this.id,
    required this.websiteName,
    required this.email,
    required this.address,
    required this.seoKeywords,
    required this.seoDescription,
    required this.phone,
    required this.mobile,
    required this.facebook,
    required this.instagram,
    required this.whatsapp,
    required this.twitter,
    required this.linkedIn,
    required this.logo,
    required this.favicon,
    required this.description,
    this.createdAt,
    required this.updatedAt,
    required this.logoUrl,
    required this.faviconUrl,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      id: json['id'],
      websiteName: json['website_name'],
      email: json['email'],
      address: json['address'],
      seoKeywords: json['seo_keywords'],
      seoDescription: json['seo_description'],
      phone: json['phone'],
      mobile: json['mobile'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      whatsapp: json['whatsapp'],
      twitter: json['twitter'],
      linkedIn: json['linked_in'],
      logo: json['logo'],
      favicon: json['favicon'],
      description: json['description'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: DateTime.parse(json['updated_at']),
      logoUrl: json['logo_url'],
      faviconUrl: json['favicon_url'],
    );
  }
}
