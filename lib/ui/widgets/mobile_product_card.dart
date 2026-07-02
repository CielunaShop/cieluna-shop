import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';

class DesktopProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const DesktopProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28.r),

      child: Container(
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Expanded(
              flex: 6,

              child: Padding(
                padding: EdgeInsets.all(16.w),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),

                  child: SizedBox(
                    width: double.infinity,

                    child: Image.asset(
                      product.images.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 4,

              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 18.h),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 22.sp,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      product.tagline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.subtitle,
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

                        Text(
                          "View →",
                          style: AppTextStyles.subtitle.copyWith(
                            color: accentPink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
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