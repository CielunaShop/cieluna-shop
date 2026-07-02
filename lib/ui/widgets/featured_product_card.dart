import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';
import '../pages/product_detail_page.dart';

class FeaturedProductCard extends StatelessWidget {
  final Product product;

  const FeaturedProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 155.w,

        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: border),
          // boxShadow: [
          //   BoxShadow(
          //     color: shadow,
          //     blurRadius: 18,
          //     offset: const Offset(0, 8),
          //   ),
          // ],
        ),

        child: Padding(
          padding: EdgeInsets.all(12.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    product.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 14.h),

              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.title.copyWith(
                  fontSize: 12.sp,
                  height: 1.25,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                "₹${product.price}",
                style: AppTextStyles.title.copyWith(
                  fontSize: 16.sp,
                  color: accentPink,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}