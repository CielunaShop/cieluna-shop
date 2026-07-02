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
      borderRadius: BorderRadius.circular(28.r),
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
            Padding(
              padding: EdgeInsets.all(16.w),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),

                child: AspectRatio(
                  aspectRatio: 1,

                  child: Image.asset(product.images.first, fit: BoxFit.cover),
                ),
              ),
            ),

            Padding(
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

                  SizedBox(height: 18.h),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
