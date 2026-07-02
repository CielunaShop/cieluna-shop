import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,

      padding: const EdgeInsets.symmetric(horizontal: 48),

      child: Row(
        children: [
          /// LOGO
          Row(
            children: [
              Container(
                width: 44,
                height: 44,

                decoration: const BoxDecoration(
                  color: blush,
                  shape: BoxShape.circle,
                ),

                child: Center(
                  child: Text(
                    "♡",
                    style: TextStyle(
                      fontSize: 22,
                      color: accentPink,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Text(
                "CIELUNA",
                style: AppTextStyles.title.copyWith(
                  letterSpacing: 4,
                  fontSize: 24,
                ),
              ),
            ],
          ),

          const Spacer(),

          _NavItem("Home"),
          _NavItem("Shop"),
          _NavItem("Featured"),
          _NavItem("About"),

          const SizedBox(width: 30),

          FilledButton(
            onPressed: () {},

            style: FilledButton.styleFrom(
              backgroundColor: primaryPink,
              foregroundColor: Colors.white,

              minimumSize: const Size(160, 48),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),

            child: const Text("Browse Shop"),
          )
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;

  const _NavItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),

      child: InkWell(
        onTap: () {},

        child: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}