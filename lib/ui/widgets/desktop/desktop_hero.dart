import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 40, 48, 0),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 70),

        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: border),

          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 35,
              offset: const Offset(0, 18),
            ),
          ],
        ),

        child: Row(
          children: [
            /// LEFT
            Expanded(
              flex: 5,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 82,
                    height: 82,

                    decoration: const BoxDecoration(
                      color: blush,
                      shape: BoxShape.circle,
                    ),

                    child: Center(
                      child: Text(
                        "♡",
                        style: TextStyle(fontSize: 38, color: accentPink),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    "CIELUNA",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 10,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "DIGITAL STATIONERY",
                    style: AppTextStyles.subtitle.copyWith(
                      fontSize: 15,
                      letterSpacing: 4,
                    ),
                  ),

                  const SizedBox(height: 42),

                  Text(
                    "Beautiful planners\nfor everyday life.",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 58,
                      height: 1.12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: 520,

                    child: Text(
                      "Premium printable planners, journals, worksheets and templates designed to make planning calm, beautiful and enjoyable.",
                      style: AppTextStyles.subtitle.copyWith(
                        fontSize: 20,
                        height: 1.8,
                      ),
                    ),
                  ),

                  const SizedBox(height: 42),

                  FilledButton(
                    onPressed: () {},

                    style: FilledButton.styleFrom(
                      backgroundColor: primaryPink,
                      foregroundColor: Colors.white,

                      minimumSize: const Size(250, 60),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Explore Collection",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(width: 10),

                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 60),

            /// RIGHT
            Expanded(
              flex: 4,

              child: AspectRatio(
                aspectRatio: .82,

                child: Container(
                  decoration: BoxDecoration(
                    color: blush,
                    borderRadius: BorderRadius.circular(32),
                  ),

                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 30,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.35),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 40,
                        right: 40,
                        child: Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.25),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              "♡",
                              style: TextStyle(
                                fontSize: 80,
                                color: accentPink.withOpacity(.75),
                              ),
                            ),

                            const SizedBox(height: 18),

                            Text(
                              "Planner Preview",
                              style: AppTextStyles.title.copyWith(fontSize: 28),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "Product mockups will\nappear here.",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.subtitle.copyWith(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
