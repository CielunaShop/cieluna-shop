import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _openEmail() async {
    final uri = Uri(scheme: 'mailto', path: 'cielunashop@gmail.com');

    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 26.h),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          // HEART
          Container(
            width: 45.w,
            height: 45.w,
            decoration: const BoxDecoration(
              color: blush,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "♡",
              style: TextStyle(fontSize: 21.sp, color: accentPink),
            ),
          ),
    
          SizedBox(height: 14.h),
    
          // BRAND
          Text(
            "CIELUNA",
            style: AppTextStyles.title.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 3.5,
            ),
          ),
    
          SizedBox(height: 10.h),
    
          // DESCRIPTION
          Text(
            "Beautiful digital planners and printable stationery "
            "created to make everyday planning feel a little more special.",
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: 13.sp,
              height: 1.6,
            ),
          ),
    
          SizedBox(height: 20.h),
    
          // EMAIL BUTTON
          InkWell(
            onTap: _openEmail,
            borderRadius: BorderRadius.circular(50.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: blush,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.mail_outline_rounded,
                    size: 18.sp,
                    color: accentPink,
                  ),
    
                  SizedBox(width: 8.w),
    
                  Text(
                    "cielunashop@gmail.com",
                    style: AppTextStyles.small.copyWith(
                      fontSize: 14.sp,
                      color: accentPink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
    
          SizedBox(height: 20.h),
    
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 1.3,
            color: border,
          ),
    
          SizedBox(height: 16.h),
    
          Text(
            "Made with ♡ by Cieluna Shop",
            style: AppTextStyles.small.copyWith(
              fontSize: 13.sp,
              color: accentPink,
            ),
          ),
        ],
      ),
    );
  }
}
