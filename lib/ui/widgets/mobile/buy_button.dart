import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class BuyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BuyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
  borderRadius: BorderRadius.circular(24.r),
  onTap: onTap,
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      vertical: 18.h,
    ),
    decoration: BoxDecoration(
      color: primaryPink,
      borderRadius: BorderRadius.circular(24.r),
      boxShadow: [
        BoxShadow(
          color: shadow,
          blurRadius: 22,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.button,
        ),
        SizedBox(width: 10.w),
        Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
          size: 20.sp,
        ),
      ],
    ),
  ),
);
  }
}
