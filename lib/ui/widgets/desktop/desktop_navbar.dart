import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          /// LOGO
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: blush,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "♡",
                    style: TextStyle(fontSize: 19, color: accentPink),
                  ),
                ),
              ),

              const SizedBox(width: 13),

              Text(
                "CIELUNA",
                style: AppTextStyles.title.copyWith(
                  letterSpacing: 3.5,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const Spacer(),

          const _NavItem("Home"),
          const _NavItem("Shop"),
          const _NavItem("Featured"),
          const _NavItem("About"),

          const SizedBox(width: 22),

          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: primaryPink,
              foregroundColor: Colors.white,
              minimumSize: const Size(135, 42),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              "Browse Shop",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            title,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
