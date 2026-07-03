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
      padding: const EdgeInsets.fromLTRB(42, 34, 42, 32),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT BRAND AREA
          SizedBox(
            width: 390,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CIELUNA",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  "Beautiful digital planners, journals and printable "
                  "stationery created with simplicity and elegance.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 14,
                    height: 1.65,
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  "Made with ♡ by Cieluna Shop",
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 13,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          _FooterColumn(
            title: "Shop",
            children: [
              _FooterLink(title: "All Products", onTap: () {}),
              _FooterLink(title: "Planners", onTap: () {}),
              _FooterLink(title: "Journals", onTap: () {}),
              _FooterLink(title: "Templates", onTap: () {}),
            ],
          ),

          const SizedBox(width: 85),

          _FooterColumn(
            title: "Connect",
            children: [
              _FooterLink(
                title: "Pinterest",
                onTap: () => _launch("https://www.pinterest.com/"),
              ),
              _FooterLink(
                title: "YouTube",
                onTap: () => _launch("https://youtube.com/"),
              ),
              _FooterLink(title: "Email", onTap: () {}),
            ],
          ),

          const SizedBox(width: 85),

          _FooterColumn(
            title: "Information",
            children: [
              _FooterLink(title: "Terms", onTap: () {}),
              _FooterLink(title: "Privacy", onTap: () {}),
              _FooterLink(title: "FAQ", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.title.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 14),

          ...children,
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _FooterLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            title,
            style: AppTextStyles.subtitle.copyWith(fontSize: 13, height: 1.3),
          ),
        ),
      ),
    );
  }
}
