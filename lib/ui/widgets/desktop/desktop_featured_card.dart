import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';
import '../../pages/product_detail_page.dart';

class DesktopFeaturedCard extends StatelessWidget {
  final Product product;

  const DesktopFeaturedCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 210,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border),
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: SizedBox(
                width: double.infinity,
                height: 175,
                child: Image.asset(product.images.first, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 11),

            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.title.copyWith(
                fontSize: 16,
                height: 1.2,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              product.tagline,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.subtitle.copyWith(fontSize: 12, height: 1.3),
            ),

            const Spacer(),

            Row(
              children: [
                Text(
                  "₹${product.price}",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 18,
                    color: accentPink,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Spacer(),

                Text(
                  "View",
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 12,
                    color: accentPink,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(width: 3),

                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 14,
                  color: accentPink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
