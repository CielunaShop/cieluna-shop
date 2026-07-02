import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color: blush,
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        SizedBox(height: 10),
        Text(
          "♡",
          style: TextStyle(fontSize: 20.sp, color: accentPink),
        ),

        SizedBox(height: 8.h),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.title.copyWith(
            fontSize: 30.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 8.h),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle.copyWith(fontSize: 15.sp, height: 1.6),
        ),
      ],
    );
  }
}
