import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Text("Contact: cielunashop@gmail.com", style: AppTextStyles.small, textAlign: TextAlign.center,),
    );
  }
}
