import 'package:flutter/material.dart';

import '../../../data/products.dart';
import '../shared/section_title.dart';
import 'desktop_featured_card.dart';

class DesktopFeaturedSection extends StatelessWidget {
  const DesktopFeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Featured products are independent from Browse Collection filters
    final featured = products
        .where((product) => product.featured)
        .take(6)
        .toList();

    if (featured.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
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
