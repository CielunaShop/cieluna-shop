import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class ProductInfoCard extends StatelessWidget {
  final Widget child;
  final bool isDesktop;

  const ProductInfoCard({
    super.key,
    required this.child,
    this.isDesktop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isDesktop ? 26 : 20,
      ),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(
          isDesktop ? 24 : 22,
        ),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}