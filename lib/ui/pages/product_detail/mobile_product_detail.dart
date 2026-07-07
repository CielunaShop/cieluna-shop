import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../models/product.dart';

import '../../widgets/mobile/buy_button.dart';
import '../../widgets/mobile/footer.dart';
import '../../widgets/mobile/product_image_carousel.dart';
import '../../widgets/shared/section_title.dart';

import '../../widgets/product_detail/product_highlights.dart';
import '../../widgets/product_detail/product_included_list.dart';
import '../../widgets/product_detail/product_specifications.dart';

class MobileProductDetail extends StatelessWidget {
  final Product product;

  const MobileProductDetail({super.key, required this.product});

  Future<void> _openLink(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(40.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: accentPink,
                        size: 20.sp,
                      ),

                      SizedBox(width: 6.w),

                      Text(
                        "Back to Collection",
                        style: AppTextStyles.subtitle.copyWith(
                          color: accentPink,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                product.title,
                style: AppTextStyles.heading.copyWith(
                  fontSize: 30.sp,
                  height: 1.2,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                product.tagline,
                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 15.sp,
                  height: 1.6,
                ),
              ),

              SizedBox(height: 22.h),

              Text(
                "₹${product.price}",
                style: AppTextStyles.price.copyWith(
                  color: accentPink,
                  fontSize: 30.sp,
                ),
              ),

              SizedBox(height: 24.h),

              ProductHighlights(highlights: product.highlights),

              SizedBox(height: 30.h),

              BuyButton(
                text: "Purchase Now • ₹${product.price}",
                onTap: () => _openLink(product.purchaseUrl),
              ),

              SizedBox(height: 42.h),

              ProductImageCarousel(images: product.images),

              SizedBox(height: 50.h),

              SectionTitle(
                title: "About ${product.title}",
                subtitle: "Everything you need to know.",
              ),

              SizedBox(height: 20.h),

              Text(
                product.description,
                style: AppTextStyles.body.copyWith(
                  fontSize: 15.sp,
                  height: 1.8,
                ),
              ),

              SizedBox(height: 50.h),

              const SectionTitle(
                title: "What's Included",
                subtitle: "Everything included in your purchase.",
              ),

              SizedBox(height: 20.h),

              ProductIncludedList(contents: product.contents),

              SizedBox(height: 50.h),

              const SectionTitle(
                title: "Product Details",
                subtitle: "File and product specifications.",
              ),

              SizedBox(height: 20.h),

              ProductSpecifications(product: product),

              SizedBox(height: 55.h),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
