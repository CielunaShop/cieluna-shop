import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';
import '../pages/product_detail_page.dart';

class FeaturedProductCard extends StatelessWidget {
  final Product product;

  const FeaturedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(26.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 180.w,
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Padding(
              padding: EdgeInsets.all(16.w),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),

                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(product.images.first, fit: BoxFit.cover),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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

                  // SizedBox(height: 8.h),

                  // Text(
                  //   product.category.name.toUpperCase(),
                  //   style: AppTextStyles.subtitle.copyWith(
                  //     fontSize: 11.sp,
                  //     letterSpacing: 2,
                  //     color: subtitleColor,
                  //   ),
                  // ),
                  SizedBox(height: 10.h),

                  Text(
                    "₹${product.price}",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 18.sp,
                      color: accentPink,
                    ),
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
