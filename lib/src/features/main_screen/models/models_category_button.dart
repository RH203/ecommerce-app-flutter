class ModelsCategoryButton {
  List<String> _categoryProduct = ["All"];

  List<String> get categoryProduct => _categoryProduct;
  set valueCategoryProduct(List<String> value) =>
      _categoryProduct.addAll(value);
}
