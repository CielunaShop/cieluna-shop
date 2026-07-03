import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

import 'desktop_hero_showcase.dart';

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 28, 48, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 44),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: [
            /// LEFT SIDE
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: TextStyle(fontSize: 25, color: accentPink),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  Text(
                    "CIELUNA",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 7,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "DIGITAL STATIONERY",
                    style: AppTextStyles.subtitle.copyWith(
                      fontSize: 11,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 28),

                  Text(
                    "Beautiful planners\nfor everyday life.",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 42,
                      height: 1.12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: 460,
                    child: Text(
                      "Premium printable planners, journals, worksheets and "
                      "templates designed to make planning calm, beautiful "
                      "and enjoyable.",
                      style: AppTextStyles.subtitle.copyWith(
                        fontSize: 16,
                        height: 1.65,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: primaryPink,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(220, 50),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Explore Collection",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded, size: 19),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 50),

            /// RIGHT SIDE
            const Expanded(flex: 4, child: DesktopHeroShowcase()),
          ],
        ),
      ),
    );
  }
}
