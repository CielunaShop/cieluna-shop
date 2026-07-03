import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopNavbar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onShopTap;

  const DesktopNavbar({
    super.key,
    required this.onHomeTap,
    required this.onShopTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          InkWell(
            onTap: onHomeTap,
            borderRadius: BorderRadius.circular(12),
            child: Row(
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
          ),

          const Spacer(),

          _NavItem(title: "Home", onTap: onHomeTap),

          const SizedBox(width: 10),

          _NavItem(title: "Shop", onTap: onShopTap),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
