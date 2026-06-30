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
          borderRadius: BorderRadius.circular(28.r),
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
                topLeft: Radius.circular(28.r),
                topRight: Radius.circular(28.r),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(product.images.first, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(18.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    if (product.featured)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),

                        decoration: BoxDecoration(
                          color: blush,
                          borderRadius: BorderRadius.circular(30.r),
                        ),

                        child: Text(
                          "FEATURED",
                          style: AppTextStyles.subtitle.copyWith(
                            fontSize: 11.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                            color: accentPink,
                          ),
                        ),
                      ),

                    SizedBox(height: 12.h),

                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 22.sp,
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      product.tagline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.subtitle.copyWith(height: 1.5),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Text(
                          "₹${product.price}",
                          style: AppTextStyles.title.copyWith(
                            color: accentPink,
                            fontSize: 26.sp,
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),

                          decoration: BoxDecoration(
                            color: primaryPink,
                            borderRadius: BorderRadius.circular(30.r),
                          ),

                          child: Text(
                            "View",
                            style: AppTextStyles.button.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
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
