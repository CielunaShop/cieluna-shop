import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/product.dart';
import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../widgets/buy_button.dart';
import '../widgets/footer.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/section_heading.dart';
import '../widgets/section_text_block.dart';
import '../widgets/section_list.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  Future<void> openLink(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          surfaceTintColor: Colors.transparent,
          foregroundColor: textDark,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(product.title, style: AppTextStyles.title),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageCarousel(images: product.images),

              SizedBox(height: 28),

              Text(product.title, style: AppTextStyles.heading),

              SizedBox(height: 10),

              Text(product.tagline, style: AppTextStyles.subtitle),

              SizedBox(height: 22),

              Text("₹${product.price}", style: AppTextStyles.price),

              SizedBox(height: 30),

              const SectionHeading("Highlights"),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: product.highlights.map((item) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: blush,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Text(item),
                  );
                }).toList(),
              ),

              SizedBox(height: 34),

              const SectionHeading("Description"),

              SectionTextBlock(product.description),

              const SectionHeading("What's Included"),

              SectionList(product.contents),

              const SectionHeading("Specifications"),

              SectionList([
                "Format • ${product.format}",
                "Page Size • ${product.pageSize}",
                "Pages • ${product.pageCount}",
              ]),

              SizedBox(height: 35),

              BuyButton(
                text: "Purchase Now • ₹${product.price}",
                onTap: () => openLink(product.purchaseUrl),
              ),

              SizedBox(height: 45),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
