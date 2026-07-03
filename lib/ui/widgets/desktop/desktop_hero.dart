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
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 42),
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
            /// HEART
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: blush,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "♡",
                  style: TextStyle(fontSize: 23, color: accentPink),
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// BRAND NAME
            Text(
              "CIELUNA",
              textAlign: TextAlign.center,
              style: AppTextStyles.title.copyWith(
                fontSize: 29,
                fontWeight: FontWeight.w700,
                letterSpacing: 7,
              ),
            ),

            const SizedBox(height: 7),

            /// BRAND SIGNATURE
            Text(
              "A FANTASY DESIGNER'S DIGITAL UNIVERSE",
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 10,
                letterSpacing: 2.8,
                color: accentPink,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 28),

            /// MAIN HEADING
            Text(
              "Planners, pages & little worlds\nmade to feel like yours.",
              textAlign: TextAlign.center,
              style: AppTextStyles.heading.copyWith(
                fontSize: 37,
                height: 1.16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 18),

            /// DESCRIPTION
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Text(
                "Digital printables for planning, journaling and everything "
                "in between — created for people who like their everyday "
                "pages with a little more personality.",
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 14,
                  height: 1.65,
                ),
              ),
            ),

            const SizedBox(height: 22),

            /// CATEGORIES
            Text(
              "PLANNERS  •  JOURNALING  •  AESTHETIC PAGES  •  CUSTOM REQUESTS",
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 10,
                letterSpacing: 1.7,
                color: accentPink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
