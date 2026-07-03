import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../product_detail/mobile_product_detail.dart';
import '../product_detail/desktop_product_detail.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return DesktopProductDetail(product: product);
        }

        return MobileProductDetail(product: product);
      },
    );
  }
}