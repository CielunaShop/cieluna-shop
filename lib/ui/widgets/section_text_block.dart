import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/text_styles.dart';

class SectionTextBlock extends StatelessWidget {
  final String content;
  const SectionTextBlock(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 28.h),
      child: Text(
        content,
        style: AppTextStyles.body.copyWith(fontSize: 15.sp, height: 1.5),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
