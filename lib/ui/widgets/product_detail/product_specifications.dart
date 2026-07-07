import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';

import 'product_info_card.dart';

class ProductSpecifications extends StatelessWidget {
  final Product product;
  final bool isDesktop;

  const ProductSpecifications({
    super.key,
    required this.product,
    this.isDesktop = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProductInfoCard(
      isDesktop: isDesktop,
      child: Column(
        children: [
          _SpecRow(
            title: "Format",
            value: product.format,
            isDesktop: isDesktop,
          ),

          const Divider(color: border),

          _SpecRow(
            title: "Page Size",
            value: product.pageSize,
            isDesktop: isDesktop,
          ),

          const Divider(color: border),

          _SpecRow(
            title: "Pages",
            value: "${product.pageCount}",
            isDesktop: isDesktop,
          ),
        ],
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isDesktop;

  const _SpecRow({
    required this.title,
    required this.value,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 12 : 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: isDesktop ? 14 : 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTextStyles.body.copyWith(
                fontSize: isDesktop ? 14 : 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}