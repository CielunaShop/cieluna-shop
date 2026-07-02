import 'package:flutter/material.dart';

import '../../../models/product.dart';
import 'desktop_product_card.dart';

class DesktopProductGrid extends StatelessWidget {
  final List<Product> products;

  const DesktopProductGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {

        int columns = 4;

        if (constraints.maxWidth < 1350) {
          columns = 3;
        }

        return GridView.builder(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: products.length,

          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,

            crossAxisSpacing: 28,

            mainAxisSpacing: 28,

            childAspectRatio: .78,
          ),

          itemBuilder: (_, index) {
            return DesktopProductCard(
              product: products[index],
            );
          },
        );
      },
    );
  }
}