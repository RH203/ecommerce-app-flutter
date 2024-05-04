import 'package:ecommerce_app/src/utils/services/api/products_api.dart';

class ModelsProduct {
  final String title;
  final String brand;
  final double price;
  final List<String> colors;
  final List<String> sizes;
  final String image;

  ModelsProduct({
    required this.title,
    required this.brand,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.image,
  });

  factory ModelsProduct.fromJson(Map<String, dynamic> json) {
    return ModelsProduct(
      title: json['name'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      colors: (json['colors'] as List<dynamic>)
          .map((color) => color.toString())
          .toList(),
      sizes: (json['sizes'] as List<dynamic>)
          .map((size) => size.toString())
          .toList(),
      image: ProductsApi.imageUrl + json['image'] as String,
    );
  }
}
