import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';
import '../../pages/product_detail_page.dart';

class DesktopFeaturedCard extends StatelessWidget {
  final Product product;

  const DesktopFeaturedCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              product: product,
            ),
          ),
        );
      },

      child: Container(
        width: 250,

        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: border),

          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),

                child: AspectRatio(
                  aspectRatio: 1,

                  child: Image.asset(
                    product.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                style: AppTextStyles.title.copyWith(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                product.tagline,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Text(
                    "₹${product.price}",

                    style: AppTextStyles.title.copyWith(
                      fontSize: 24,
                      color: accentPink,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: blush,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Text(
                      "View",

                      style: AppTextStyles.subtitle.copyWith(
                        color: accentPink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}