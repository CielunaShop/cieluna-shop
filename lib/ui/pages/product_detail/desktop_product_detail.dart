import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';

import '../../widgets/desktop/desktop_footer.dart';
import '../../widgets/shared/product_image_viewer.dart';

class DesktopProductDetail extends StatelessWidget {
  final Product product;

  const DesktopProductDetail({super.key, required this.product});

  Future<void> _openLink(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500),
            child: Column(
              children: [
                const SizedBox(height: 28),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _BackButton(onTap: () => Navigator.pop(context)),
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: _ProductHero(
                    product: product,
                    onPurchase: () => _openLink(product.purchaseUrl),
                  ),
                ),

                const SizedBox(height: 70),

                _SectionHeading(
                  title: "About this Planner",
                  subtitle: "Designed to make planning beautiful.",
                ),

                const SizedBox(height: 26),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 15,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(height: 70),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _DetailSection(
                          title: "What's Included",
                          subtitle: "Everything in your purchase.",
                          child: Column(
                            children: product.contents
                                .map((item) => _IncludedItem(text: item))
                                .toList(),
                          ),
                        ),
                      ),

                      const SizedBox(width: 28),

                      Expanded(
                        child: _DetailSection(
                          title: "Product Details",
                          subtitle: "Quick specifications.",
                          child: Column(
                            children: [
                              _SpecRow(title: "Format", value: product.format),
                              const Divider(color: border),
                              _SpecRow(
                                title: "Page Size",
                                value: product.pageSize,
                              ),
                              const Divider(color: border),
                              _SpecRow(
                                title: "Pages",
                                value: "${product.pageCount}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 80),

                const DesktopFooter(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.arrow_back_rounded, size: 18, color: accentPink),
            const SizedBox(width: 7),
            Text(
              "Back to Collection",
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 14,
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

class _ProductHero extends StatefulWidget {
  final Product product;
  final VoidCallback onPurchase;

  const _ProductHero({required this.product, required this.onPurchase});

  @override
  State<_ProductHero> createState() => _ProductHeroState();
}

class _ProductHeroState extends State<_ProductHero> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(42),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(color: shadow, blurRadius: 28, offset: const Offset(0, 14)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.images.length > 1) ...[
                  SizedBox(
                    width: 74,
                    child: Column(
                      children: List.generate(
                        product.images.length,
                        (index) => _Thumbnail(
                          image: product.images[index],
                          selected: selectedImage == index,
                          onTap: () {
                            setState(() {
                              selectedImage = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),
                ],

                Expanded(
                  child: Container(
                    height: 520,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: border),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductImageViewer(
                              images: product.images,
                              initialIndex: selectedImage,
                            ),
                          ),
                        );
                      },

                      borderRadius: BorderRadius.circular(18),

                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),

                            child: Image.asset(
                              product.images[selectedImage],
                              fit: BoxFit.contain,
                            ),
                          ),

                          /// ZOOM ICON
                          Positioned(
                            right: 14,
                            bottom: 14,

                            child: Container(
                              width: 42,
                              height: 42,

                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.92),
                                shape: BoxShape.circle,
                                border: Border.all(color: border),
                              ),

                              child: const Icon(
                                Icons.zoom_in_rounded,
                                size: 21,
                                color: accentPink,
                              ),
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

          const SizedBox(width: 52),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 38,
                      height: 1.15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    product.tagline,
                    style: AppTextStyles.subtitle.copyWith(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 26),

                  Text(
                    "₹${product.price}",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 30,
                      color: accentPink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 9,
                    runSpacing: 9,
                    children: [
                      const _ProductChip(text: "Printable PDF"),
                      _ProductChip(text: product.pageSize),
                      _ProductChip(text: "${product.pageCount} Pages"),
                      const _ProductChip(text: "Instant Download"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Divider(color: border),

                  const SizedBox(height: 22),

                  Text(
                    product.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14,
                      height: 1.75,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: widget.onPurchase,
                      style: FilledButton.styleFrom(
                        backgroundColor: primaryPink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        "Purchase Now  •  ₹${product.price}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: Text(
                      "♡  Instant digital download",
                      style: AppTextStyles.subtitle.copyWith(
                        fontSize: 12,
                        color: accentPink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final String image;
  final bool selected;
  final VoidCallback onTap;

  const _Thumbnail({
    required this.image,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 74,
          height: 82,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? accentPink : border,
              width: selected ? 2 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class _ProductChip extends StatelessWidget {
  final String text;

  const _ProductChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: blush,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "♡  $text",
        style: AppTextStyles.subtitle.copyWith(
          fontSize: 12,
          color: accentPink,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeading({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("♡", style: TextStyle(fontSize: 22, color: accentPink)),

        const SizedBox(height: 7),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.title.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _DetailSection({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.title.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 6),

        Text(subtitle, style: AppTextStyles.subtitle.copyWith(fontSize: 13)),

        const SizedBox(height: 20),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: border),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ],
    );
  }
}

class _IncludedItem extends StatelessWidget {
  final String text;

  const _IncludedItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("♡", style: TextStyle(fontSize: 16, color: accentPink)),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  final String title;
  final String value;

  const _SpecRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(value, style: AppTextStyles.body.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}
