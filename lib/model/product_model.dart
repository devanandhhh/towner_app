class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? thumbnail;
  final String? image;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.thumbnail,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      image: (json["images"] != null && json["images"].isNotEmpty)
          ? json["images"][0]
          : null,
    );
  }
}
