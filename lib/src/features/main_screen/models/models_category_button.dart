import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ModelsCategoryButton {
  // ignore: prefer_final_fields
  List<String> _categoryProduct = [
    "All",
    "Nike",
    "Adidas",
    "Under \n Armour",
  ];

  // ignore: prefer_final_fields, unused_field
  List<Widget> _iconProduct = [
    const Icon(
      BoxIcons.bx_category,
      size: 40,
    ),
    Image.asset(
      "assets/icons/brands/nike.png",
      width: 40,
    ),
    Image.asset(
      "assets/icons/brands/adidas.png",
      width: 40,
    ),
    Image.asset(
      "assets/icons/brands/under-armour.png",
      width: 40,
    ),
  ];

  List<Widget> get iconProduct => _iconProduct;
  List<String> get categoryProduct => _categoryProduct;
  set valueCategoryProduct(List<String> value) =>
      _categoryProduct.addAll(value);
}
