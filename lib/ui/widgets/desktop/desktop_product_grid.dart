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
        final width = constraints.maxWidth;

        int columns;

        if (width >= 1200) {
          columns = 4;
        } else if (width >= 850) {
          columns = 3;
        } else {
          columns = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,

            // More vertical room for image + title + tagline + price
            childAspectRatio: 0.72,
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