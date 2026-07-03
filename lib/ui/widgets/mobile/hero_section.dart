import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 36.h),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(color: shadow, blurRadius: 30, offset: const Offset(0, 15)),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(color: blush, shape: BoxShape.circle),
            child: Center(
              child: Text(
                "♡",
                style: TextStyle(fontSize: 28.sp, color: accentPink),
              ),
            ),
          ),

          SizedBox(height: 22.h),

          Text(
            "CIELUNA",
            style: AppTextStyles.title.copyWith(
              fontSize: 30.sp,
              letterSpacing: 6,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            "DIGITAL STATIONERY",
            style: AppTextStyles.subtitle.copyWith(
              letterSpacing: 3,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 24.h),

          Text(
            "Beautiful digital planners\nfor everyday life.",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading.copyWith(fontSize: 25.sp, height: 1.3),
          ),

          SizedBox(height: 16.h),

          Text(
            "Minimal printable planners, journals\nand templates designed with elegance.",
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle.copyWith(height: 1.6),
          ),

          // SizedBox(height: 28.h),

          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
          //   decoration: BoxDecoration(
          //     color: primaryPink,
          //     borderRadius: BorderRadius.circular(50.r),
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text("Explore Collection", style: AppTextStyles.button),

          //       SizedBox(width: 8.w),

          //       Icon(
          //         Icons.arrow_forward_rounded,
          //         color: Colors.white,
          //         size: 20.sp,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
