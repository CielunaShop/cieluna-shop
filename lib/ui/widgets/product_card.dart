import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/product.dart';
import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12.r),
    child: product.images.isNotEmpty
        ? Image.asset(product.images.first, fit: BoxFit.cover)
        : Container(
            color: blush,
            child: Center(child: Text("No Image")),
          ),
  ),
),


            SizedBox(height: 10.h),
            Text(product.title, style: AppTextStyles.title.copyWith(fontSize: 14.sp)),
            SizedBox(height: 4.h),
            Text(product.tagline, style: AppTextStyles.subtitle.copyWith(fontSize: 12.sp), maxLines: 1),
            SizedBox(height: 10.h),
            Text("₹${product.price}", style: AppTextStyles.price.copyWith(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}
