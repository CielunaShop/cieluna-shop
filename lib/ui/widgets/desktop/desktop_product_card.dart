import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';
import '../../pages/product_detail/product_detail_page.dart';

class DesktopProductCard extends StatefulWidget {
  final Product product;

  const DesktopProductCard({super.key, required this.product});

  @override
  State<DesktopProductCard> createState() => _DesktopProductCardState();
}

class _DesktopProductCardState extends State<DesktopProductCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, hovering ? -5 : 0, 0),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: hovering ? 22 : 14,
              offset: Offset(0, hovering ? 12 : 7),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailPage(product: product),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 220),
                      scale: hovering ? 1.025 : 1,
                      child: Image.asset(
                        product.images.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title.copyWith(
                    fontSize: 17,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  product.tagline,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),

                const Spacer(),

                Row(
                  children: [
                    Text(
                      "₹${product.price}",
                      style: AppTextStyles.title.copyWith(
                        color: accentPink,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      "View Details",
                      style: AppTextStyles.subtitle.copyWith(
                        fontSize: 12,
                        color: accentPink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(width: 4),

                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: accentPink,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
