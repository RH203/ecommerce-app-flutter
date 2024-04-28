class ModelsProduct {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double ratingRate;
  final int ratingCount;

  ModelsProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingRate,
    required this.ratingCount,
  });

  factory ModelsProduct.fromJson(Map<String, dynamic> json) {
    return ModelsProduct(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as double,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      ratingRate: json['rating']['rate'] as double,
      ratingCount: json['rating']['count'] as int,
    );
  }
}
