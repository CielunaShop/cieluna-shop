import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.sizeOf(context).width >= 900;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: isDesktop ? 0 : 10,
          ),
          width: double.infinity,
          height: 
          // isDesktop ? 2 :
           2,
          decoration: BoxDecoration(
            color: blush,
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        SizedBox(height: isDesktop ? 24 : 10),

        Text(
          "♡",
          style: TextStyle(
            fontSize: isDesktop ? 28 : 20,
            color: accentPink,
            fontWeight: FontWeight.w300,
          ),
        ),

        SizedBox(height: isDesktop ? 10 : 8),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.title.copyWith(
            fontSize: isDesktop ? 42 : 30,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),

        SizedBox(height: isDesktop ? 10 : 8),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle.copyWith(
            fontSize: isDesktop ? 18 : 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}