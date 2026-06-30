import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.all(20.w),

      padding: EdgeInsets.symmetric(
        horizontal: 28.w,
        vertical: 55.h,
      ),

      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          color: border,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 35,
            offset: const Offset(0, 15),
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: blush,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "♡",
                style: TextStyle(
                  fontSize: 34.sp,
                  color: accentPink,
                ),
              ),
            ),
          ),

          SizedBox(height: 28.h),

          Text(
            "CIELUNA",
            textAlign: TextAlign.center,
            style: AppTextStyles.title.copyWith(
              fontSize: 34.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 7,
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            "DIGITAL STATIONERY",
            style: AppTextStyles.subtitle.copyWith(
              letterSpacing: 3,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 32.h),

          Text(
            "Create a life\nyou'll love planning.",
            textAlign: TextAlign.center,
            style: AppTextStyles.title.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),

          SizedBox(height: 18.h),

          Text(
            "Thoughtfully designed digital stationery\nthat helps you stay organized with beauty,\nclarity and intention.",
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: 16.sp,
              height: 1.8,
            ),
          ),

          SizedBox(height: 36.h),

          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              backgroundColor: primaryPink,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: 34.w,
                vertical: 18.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Explore Collection",
                  style: AppTextStyles.button,
                ),

                SizedBox(width: 10.w),

                Icon(
                  Icons.arrow_forward_rounded,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}