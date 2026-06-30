import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import '../models/product_category.dart';

class ProductProvider extends ChangeNotifier {
  ProductCategory? _selected;

  ProductCategory? get selected => _selected;

  List<Product> get productsFiltered {
    if (_selected == null) {
      return products;
    }

    return products.where((p) => p.category == _selected).toList();
  }

  void selectCategory(ProductCategory? category) {
    _selected = category;

    notifyListeners();
  }
}
