import 'package:ecommerce_app/src/features/main_screen/models/models_product.dart';
import 'package:ecommerce_app/src/utils/services/api/products_api.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Products extends ChangeNotifier {
  var log = Logger();
  ProductsApi productsApi = ProductsApi();
  List<ModelsProduct> _allProducts = [];
  List<ModelsProduct> _products = [];

  List<ModelsProduct>? get products => _products;

  Future<void> getAllProduct() async {
    log.i(_allProducts);
    try {
      _allProducts = await productsApi.getAllProducts();
      _products = List.from(_allProducts);
      notifyListeners();
    } catch (e) {
      log.d('Error fetching products [PROVIDER]: $e');
    }
  }

  void getAllProductByBrand(String brand) {
    try {
      log.i(_allProducts);
      List<ModelsProduct> filteredProducts = [];
      for (var temp in _allProducts) {
        if (temp.brand == brand) {
          filteredProducts.add(temp);
        }
      }
      _products = filteredProducts;
      notifyListeners();
    } catch (e) {
      log.e(e);
    }
  }

  void resetProducts() {
    // log.i(_allProducts);
    _products = List.from(_allProducts);
    notifyListeners();
  }
}
