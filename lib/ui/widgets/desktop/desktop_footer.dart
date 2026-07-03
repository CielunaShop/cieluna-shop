import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  Future<void> _launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 48),
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 32),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CIELUNA",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: 430,
                  child: Text(
                    "Beautiful digital planners and printable stationery "
                    "created to make everyday planning feel a little more special.",
                    style: AppTextStyles.subtitle.copyWith(
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  "Made with ♡ by Cieluna Shop",
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 12,
                    color: accentPink,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              _SocialLink(
                title: "Pinterest",
                onTap: () => _launch("https://in.pinterest.com/cielunashop/"),
              ),

              const SizedBox(width: 30),

              _SocialLink(
                title: "YouTube",
                onTap: () => _launch("https://youtube.com/"),
              ),

              const SizedBox(width: 30),

              _SocialLink(
                title: "cielunashop@gmail.com",
                onTap: () => _launch("mailto:cielunashop@gmail.com"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SocialLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: blush,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(
            fontSize: 13,
            color: accentPink,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
