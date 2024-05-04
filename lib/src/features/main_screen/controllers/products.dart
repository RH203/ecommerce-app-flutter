import 'package:ecommerce_app/src/features/main_screen/models/models_product.dart';
import 'package:ecommerce_app/src/utils/services/api/products_api.dart';
import 'package:flutter/material.dart';

class Products extends ChangeNotifier {
  ProductsApi productsApi = ProductsApi();
  List<ModelsProduct>? _products;

  List<ModelsProduct>? get products => _products;

  Future<void> getAllProduct() async {
    // Perubahan 2
    try {
      _products = await productsApi.getAllProducts();
      notifyListeners();
    } catch (e) {
      print('Error fetching products [PROVIDER]: $e');
    }
  }
}
