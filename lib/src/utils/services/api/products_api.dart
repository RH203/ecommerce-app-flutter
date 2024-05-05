// ignore_for_file: unused_field

import 'dart:convert';

import 'package:ecommerce_app/src/features/main_screen/models/models_category_button.dart';
import 'package:ecommerce_app/src/features/main_screen/models/models_product.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ProductsApi {
  // Api Product
  final String _getAllProductsUrl =
      "https://raw.githubusercontent.com/RH203/my-static-api/main/basketball_shoes.json";
  static String imageUrl =
      "https://raw.githubusercontent.com/RH203/my-static-api/main/";
  // declare Variabel

  final client = http.Client();
  ModelsCategoryButton modelsCategoryButton = ModelsCategoryButton();
  final log = Logger();

  // Function to get all kinds of products
  Future<List<ModelsProduct>> getAllProducts() async {
    try {
      final response = await http.get(Uri.parse(_getAllProductsUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        List<ModelsProduct> products = jsonData
            .map((jsonProduct) => ModelsProduct.fromJson(jsonProduct))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products [API]: $e');
    }
  }
}
