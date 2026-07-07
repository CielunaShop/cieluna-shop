import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class ProductHighlights extends StatelessWidget {
  final List<String> highlights;
  final bool isDesktop;

  const ProductHighlights({
    super.key,
    required this.highlights,
    this.isDesktop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: isDesktop ? 9 : 8,
      runSpacing: isDesktop ? 9 : 8,
      children: highlights.map((highlight) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 13 : 12,
            vertical: isDesktop ? 8 : 7,
          ),
          decoration: BoxDecoration(
            color: blush,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            "♡  $highlight",
            style: AppTextStyles.subtitle.copyWith(
              color: accentPink,
              fontSize: isDesktop ? 12 : 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }
}