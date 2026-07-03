import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 28, 48, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 58),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                color: blush,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "♡",
                  style: TextStyle(fontSize: 26, color: accentPink),
                ),
              ),
            ),

            const SizedBox(height: 22),

            Text(
              "CIELUNA",
              textAlign: TextAlign.center,
              style: AppTextStyles.title.copyWith(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                letterSpacing: 8,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "DIGITAL STATIONERY",
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 11,
                letterSpacing: 4,
              ),
            ),

            const SizedBox(height: 34),

            Text(
              "Beautiful planners\nfor everyday life.",
              textAlign: TextAlign.center,
              style: AppTextStyles.heading.copyWith(
                fontSize: 42,
                height: 1.15,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 22),

            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                "Premium printable planners, journals, worksheets and "
                "templates designed to make planning calm, beautiful "
                "and enjoyable.",
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
