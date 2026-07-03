import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product_category.dart';

class DesktopCategoryBar extends StatelessWidget {
  final ProductCategory? selected;
  final Function(ProductCategory?) onSelect;

  const DesktopCategoryBar({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  static const List<ProductCategory?> categories = [
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
      spacing: 10,
      runSpacing: 10,
      children: categories.map((category) {
        final active = category == selected;

        final label = switch (category) {
          null => "All",
          ProductCategory.planners => "Planners",
          ProductCategory.journals => "Journals",
          ProductCategory.templates => "Templates",
          ProductCategory.worksheets => "Worksheets",
          ProductCategory.notes => "Notes",
          ProductCategory.todos => "To-Do",
          ProductCategory.bundles => "Bundles",
        };

        return InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => onSelect(category),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            decoration: BoxDecoration(
              color: active ? primaryPink : card,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: active ? primaryPink : border),
            ),
            child: Text(
              label,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 15,
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
