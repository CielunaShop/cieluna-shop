import 'package:flutter/material.dart';

import '../../../data/products.dart';
import 'desktop_featured_card.dart';
import '../shared/section_title.dart';

import 'package:provider/provider.dart';
import '../../../providers/product_provider.dart';

class DesktopFeaturedSection extends StatelessWidget {
  const DesktopFeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    final featured = provider.productsFiltered
        .where((e) => e.featured)
        .take(6)
        .toList();
    if (featured.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "Featured Collection",
            subtitle: "Handpicked favourites from Cieluna.",
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 320,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              physics: const BouncingScrollPhysics(),

              itemCount: featured.length,

              separatorBuilder: (_, __) => const SizedBox(width: 22),

              itemBuilder: (_, index) {
                return DesktopFeaturedCard(product: featured[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
