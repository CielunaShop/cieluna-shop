import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';

import '../widgets/buy_button.dart';
import '../widgets/footer.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/section_title.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  Future<void> openLink(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
            vertical: 22.h,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Back Button

              InkWell(
                borderRadius: BorderRadius.circular(40.r),
                onTap: () => Navigator.pop(context),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Icon(
                        Icons.arrow_back_rounded,
                        color: accentPink,
                      ),

                      SizedBox(width: 6.w),

                      Text(
                        "Back to Collection",
                        style: AppTextStyles.subtitle.copyWith(
                          color: accentPink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 26.h),

              /// Title

              Text(
                product.title,
                style: AppTextStyles.heading.copyWith(
                  fontSize: 34.sp,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                product.tagline,
                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                "₹${product.price}",
                style: AppTextStyles.price.copyWith(
                  color: accentPink,
                  fontSize: 34.sp,
                ),
              ),

              SizedBox(height: 28.h),

              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  _chip("Printable PDF"),
                  _chip(product.pageSize),
                  _chip("${product.pageCount} Pages"),
                  _chip("Instant Download"),
                ],
              ),

              SizedBox(height: 34.h),

              BuyButton(
                text: "Purchase Now • ₹${product.price}",
                onTap: () => openLink(product.purchaseUrl),
              ),

              SizedBox(height: 50.h),

              ProductImageCarousel(
                images: product.images,
              ),

              SizedBox(height: 55.h),

              const SectionTitle(
                title: "About this Planner",
                subtitle: "Designed to make planning beautiful.",
              ),

              SizedBox(height: 22.h),

              Text(
                product.description,
                style: AppTextStyles.body.copyWith(
                  height: 1.8,
                ),
              ),

              SizedBox(height: 55.h),

              const SectionTitle(
                title: "What's Included",
                subtitle: "Everything included in your purchase.",
              ),

              SizedBox(height: 22.h),

              _InfoCard(
                child: Column(
                  children: product.contents
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [

                              Text(
                                "♡",
                                style: TextStyle(
                                  color: accentPink,
                                  fontSize: 17.sp,
                                ),
                              ),

                              SizedBox(width: 12.w),

                              Expanded(
                                child: Text(
                                  e,
                                  style: AppTextStyles.body,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              SizedBox(height: 55.h),

              const SectionTitle(
                title: "Product Details",
                subtitle: "Quick specifications.",
              ),

              SizedBox(height: 22.h),

              _InfoCard(
                child: Column(
                  children: [

                    _specRow("Format", product.format),

                    Divider(color: border),

                    _specRow("Page Size", product.pageSize),

                    Divider(color: border),

                    _specRow("Pages", "${product.pageCount}"),

                  ],
                ),
              ),

              SizedBox(height: 60.h),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      color: blush,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Text(
      "♡  $text",
      style: AppTextStyles.subtitle.copyWith(
        color: accentPink,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _specRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 12,
    ),
    child: Row(
      children: [

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Text(
          value,
          style: AppTextStyles.body,
        ),

      ],
    ),
  );
}

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: border,
        ),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: child,
    );
  }
}