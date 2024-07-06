class Sliders {
  int id;
  String image;
  String imageHe;
  String description;
  int order;
  int isActive;
  String createdAt;
  String updatedAt;
  String imageUrl;

  Sliders({
    required this.id,
    required this.image,
    required this.imageHe,
    required this.description,
    required this.order,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Sliders.fromJson(Map<String, dynamic> json) {
    return Sliders(
      id: json['id'] as int,
      image: json['image'] as String,
      imageHe: json['image_he'] as String,
      description: json['description'] as String,
      order: json['order'] as int,
      isActive: json['is_active'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}
