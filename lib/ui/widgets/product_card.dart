import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: border, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
              child: AspectRatio(
                aspectRatio: .82,
                child: Image.asset(product.images.first, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 19.sp,
                        height: 1.3,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      "₹${product.price}",
                      style: AppTextStyles.title.copyWith(
                        color: accentPink,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Text(
                          "♡ View Details",
                          style: AppTextStyles.subtitle.copyWith(
                            color: accentPink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(width: 4.w),

                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16.sp,
                          color: accentPink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
