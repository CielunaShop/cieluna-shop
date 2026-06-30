import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/text_styles.dart';

class SectionList extends StatelessWidget {
  final List<String> items;
  const SectionList(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Column(
        children: items.map((i) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: AppTextStyles.body.copyWith(fontSize: 16.sp)),
                Expanded(
                  child: Text(
                    i,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 15.sp,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
