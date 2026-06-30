import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product_category.dart';

class CategorySelector extends StatelessWidget {
  final ProductCategory? selected;

  final Function(ProductCategory?) onSelect;

  const CategorySelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  static const categories = <ProductCategory?>[
    null,
    ProductCategory.planners,
    ProductCategory.journals,
    ProductCategory.templates,
    ProductCategory.worksheets,
    ProductCategory.bundles,
  ];

  String getLabel(ProductCategory? category) {
    switch (category) {
      case null:
        return "All";
      case ProductCategory.planners:
        return "Planners";
      case ProductCategory.journals:
        return "Journals";
      case ProductCategory.templates:
        return "Templates";
      case ProductCategory.worksheets:
        return "Worksheets";
      case ProductCategory.bundles:
        return "Bundles";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,

        itemCount: categories.length,

        separatorBuilder: (_, __) => SizedBox(width: 10.w),

        itemBuilder: (_, index) {
          final category = categories[index];

          final active = category == selected;

          return GestureDetector(
            onTap: () => onSelect(category),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),

              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: active ? primaryPink : card,

                borderRadius: BorderRadius.circular(40),

                border: Border.all(color: active ? primaryPink : border),

                boxShadow: [
                  if (active)
                    BoxShadow(
                      color: primaryPink.withOpacity(.18),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                ],
              ),

              child: Center(
                child: Text(
                  getLabel(category),

                  style: AppTextStyles.subtitle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: active ? Colors.white : textDark,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
