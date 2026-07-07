import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import 'product_info_card.dart';

class ProductIncludedList extends StatelessWidget {
  final List<String> contents;
  final bool isDesktop;

  const ProductIncludedList({
    super.key,
    required this.contents,
    this.isDesktop = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProductInfoCard(
      isDesktop: isDesktop,
      child: Column(
        children: contents.map((item) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: isDesktop ? 9 : 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "♡",
                  style: TextStyle(
                    color: accentPink,
                    fontSize: isDesktop ? 16 : 15,
                  ),
                ),

                SizedBox(
                  width: isDesktop ? 12 : 10,
                ),

                Expanded(
                  child: Text(
                    item,
                    style: AppTextStyles.body.copyWith(
                      fontSize: isDesktop ? 14 : 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}