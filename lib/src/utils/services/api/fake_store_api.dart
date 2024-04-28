import 'dart:convert';

import 'package:ecommerce_app/src/features/main_screen/models/models_category_button.dart';
import 'package:ecommerce_app/src/features/main_screen/models/models_product.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class FakeStoreApi {
  // Api Product
  final String getAllProductsUrl = "https://fakestoreapi.com/products";
  final String getASingleProductUrl =
      "https://fakestoreapi.com/products/"; // ID
  final String getAllCategoryProductUrl =
      "https://fakestoreapi.com/products/categories";
  final String getProducyByCategoryUrl =
      "https://fakestoreapi.com/products/category/"; // Category
  // Api Product

  // Api Cart
  final String getAllProductCartsUrl = "https://fakestoreapi.com/carts";
  final String getProductInCartsUrl = "https://fakestoreapi.com/carts/"; // ID
  // Api Cart

  // declare Variabel
  final client = http.Client();
  ModelsCategoryButton modelsCategoryButton = ModelsCategoryButton();
  final log = Logger('Services API');

  // Function to get all categories
  Future<void> getAllCategories() async {
    try {
      var response = await client.get(Uri.parse(getAllCategoryProductUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        modelsCategoryButton.valueCategoryProduct = List<String>.from(data);
      }
    } catch (e) {
      log.warning("Error: fetching categories: $e");
    }
  }

  Future<void> getAllProducts() async {
    try {
      final response = await http.get(Uri.parse(getAllProductsUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        Map<String, ModelsProduct> productMap = {};

        data.forEach((key, value) {
          productMap[key] = ModelsProduct.fromJson(value);
        });

      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
