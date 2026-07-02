import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';

class MobileProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const MobileProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),

      child: Container(
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// IMAGE
            Padding(
              padding: EdgeInsets.all(10.w),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),

                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    product.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 16.sp,
                      height: 1.25,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    "₹${product.price}",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 20.sp,
                      color: accentPink,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    "View Details →",
                    style: AppTextStyles.subtitle.copyWith(
                      color: accentPink,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),

                  SizedBox(height: 14.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}