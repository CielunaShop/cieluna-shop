import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product_category.dart';

class DesktopCategoryBar extends StatelessWidget {
  final ProductCategory? selected;
  final Function(ProductCategory?) onSelect;

  DesktopCategoryBar({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  final List<ProductCategory?> categories = const [
    null,
    ProductCategory.planners,
    ProductCategory.journals,
    ProductCategory.templates,
    ProductCategory.worksheets,
    ProductCategory.notes,
    ProductCategory.todos,
    ProductCategory.bundles,
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,

      children: categories.map((category) {
        final active = category == selected;

        final label = switch (category) {
          null => "ALL",
          ProductCategory.planners => "PLANNERS",
          ProductCategory.journals => "JOURNALS",
          ProductCategory.templates => "TEMPLATES",
          ProductCategory.worksheets => "WORKSHEETS",
          ProductCategory.notes => "NOTES",
          ProductCategory.todos => "TO-DO",
          ProductCategory.bundles => "BUNDLES",
        };

        return InkWell(
          borderRadius: BorderRadius.circular(50),

          onTap: () => onSelect(category),

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),

            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),

            decoration: BoxDecoration(
              color: active ? primaryPink : card,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: active ? primaryPink : border),
            ),

            child: Text(
              label,
              style: AppTextStyles.subtitle.copyWith(
                color: active ? Colors.white : textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
