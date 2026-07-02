import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  Future<void> _launch(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.symmetric(
        horizontal: 48,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 42,
      ),

      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: border),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CIELUNA",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 30,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: 360,
                  child: Text(
                    "Beautiful digital planners, journals and printable stationery created with simplicity and elegance.",
                    style: AppTextStyles.subtitle.copyWith(
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  "Made with ♡ by Cieluna Shop",
                  style: AppTextStyles.subtitle.copyWith(
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 80),

          /// SHOP
          Expanded(
            child: _FooterColumn(
              title: "Shop",
              children: [
                _FooterLink(
                  title: "All Products",
                  onTap: () {},
                ),
                _FooterLink(
                  title: "Planners",
                  onTap: () {},
                ),
                _FooterLink(
                  title: "Journals",
                  onTap: () {},
                ),
                _FooterLink(
                  title: "Templates",
                  onTap: () {},
                ),
              ],
            ),
          ),

          /// SOCIALS
          Expanded(
            child: _FooterColumn(
              title: "Connect",
              children: [
                _FooterLink(
                  title: "Pinterest",
                  onTap: () => _launch(
                    "https://www.pinterest.com/",
                  ),
                ),
                _FooterLink(
                  title: "YouTube",
                  onTap: () => _launch(
                    "https://youtube.com/",
                  ),
                ),
                _FooterLink(
                  title: "Email",
                  onTap: () {},
                ),
              ],
            ),
          ),

          /// INFO
          Expanded(
            child: _FooterColumn(
              title: "Information",
              children: [
                _FooterLink(
                  title: "Terms",
                  onTap: () {},
                ),
                _FooterLink(
                  title: "Privacy",
                  onTap: () {},
                ),
                _FooterLink(
                  title: "FAQ",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title.copyWith(
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 18),

        ...children,
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _FooterLink({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}