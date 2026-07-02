import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';
import '../../pages/product_detail_page.dart';

class DesktopProductCard extends StatefulWidget {
  final Product product;

  const DesktopProductCard({
    super.key,
    required this.product,
  });

  @override
  State<DesktopProductCard> createState() =>
      _DesktopProductCardState();
}

class _DesktopProductCardState
    extends State<DesktopProductCard> {

  bool hovering = false;

  @override
  Widget build(BuildContext context) {

    final product = widget.product;

    return MouseRegion(

      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },

      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),

        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovering ? -8 : 0,
          ),

        child: InkWell(
          borderRadius: BorderRadius.circular(28),

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
            decoration: BoxDecoration(
              color: card,

              borderRadius: BorderRadius.circular(28),

              border: Border.all(color: border),

              boxShadow: [
                BoxShadow(
                  color: shadow,
                  blurRadius: hovering ? 28 : 18,
                  offset: Offset(
                    0,
                    hovering ? 18 : 10,
                  ),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(18),

                    child: AspectRatio(
                      aspectRatio: 1,

                      child: AnimatedScale(
                        duration:
                            const Duration(milliseconds: 250),

                        scale: hovering
                            ? 1.04
                            : 1,

                        child: Image.asset(
                          product.images.first,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    product.title,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style: AppTextStyles.title.copyWith(
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.tagline,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style: AppTextStyles.subtitle,
                  ),

                  const Spacer(),

                  Row(
                    children: [

                      Text(
                        "₹${product.price}",

                        style: AppTextStyles.title.copyWith(
                          color: accentPink,
                          fontSize: 26,
                        ),
                      ),

                      const Spacer(),

                      Text(
                        "View Details",

                        style: AppTextStyles.subtitle.copyWith(
                          color: accentPink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 6),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: accentPink,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}