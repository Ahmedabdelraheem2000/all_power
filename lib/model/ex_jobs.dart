
class JobSection {
  final int id;
  final String image;
  final String name;
  final String nameAr;
  final String nameHe;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  JobSection({
    required this.id,
    required this.image,
    required this.name,
    required this.nameAr,
    required this.nameHe,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory JobSection.fromJson(Map<String, dynamic> json) {
    return JobSection(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      nameAr: json['name_ar'],
      nameHe: json['name_he'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
    );
  }
}
