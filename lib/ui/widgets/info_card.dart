import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';

class InfoCard extends StatelessWidget {
  final Widget child;

  const InfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(22.w),

      decoration: BoxDecoration(
        color: card,

        borderRadius: BorderRadius.circular(24.r),

        border: Border.all(color: border),

        boxShadow: [
          BoxShadow(color: shadow, blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),

      child: child,
    );
  }
}
