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
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),

      child: Container(
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: border),
        ),

        child: Padding(
          padding: EdgeInsets.all(10.w),

          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),

                child: AspectRatio(
                  aspectRatio: 1,

                  child: Image.asset(product.images.first, fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 12.h),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      height: 46.h,

                      child: Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: AppTextStyles.title.copyWith(
                          fontSize: 16.sp,
                          height: 1.25,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "₹${product.price}",

                      style: AppTextStyles.title.copyWith(
                        color: accentPink,
                        fontSize: 22.sp,
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
                            fontSize: 13.sp,
                          ),
                        ),

                        const Spacer(),

                        Icon(
                          Icons.arrow_forward_rounded,
                          color: accentPink,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
