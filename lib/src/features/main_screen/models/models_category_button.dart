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
  List<Widget> _iconProductLightMode = [
    const Icon(
      BoxIcons.bx_category,
      size: 40,
      color: Colors.black,
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

  // ignore: prefer_final_fields, unused_field
  List<Widget> _iconProductDarkMOde = [
    const Icon(
      BoxIcons.bx_category,
      size: 40,
      color: Colors.white,
    ),
    Image.asset(
      "assets/icons/brands/nike-dark.png",
      width: 40,
    ),
    Image.asset(
      "assets/icons/brands/adidas-dark.png",
      width: 40,
    ),
    Image.asset(
      "assets/icons/brands/under-armour-dark.png",
      width: 40,
    ),
  ];

  List<Widget> get iconProductLightMode => _iconProductLightMode;
  List<Widget> get iconProductDarkMode => _iconProductDarkMOde;
  List<String> get categoryProduct => _categoryProduct;
  set valueCategoryProduct(List<String> value) =>
      _categoryProduct.addAll(value);
}
