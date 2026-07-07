import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';
import '../../../providers/product_provider.dart';

import '../../widgets/mobile/footer.dart';
import '../product_detail/product_detail_page.dart';

import '../../widgets/mobile/hero_section.dart';
import '../../widgets/mobile/category_selector.dart';
import '../../widgets/mobile/product_card.dart';
import '../../widgets/shared/section_title.dart';

import '../sections/featured_section.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final products = provider.productsFiltered;

    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // padding: const EdgeInsets.all(20),
            // padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: Column(
              children: [
                const HeroSection(),

                SizedBox(height: 50.h),

                const FeaturedSection(),

                SizedBox(height: 60.h),

                const SectionTitle(
                  title: "Browse Collection",
                  subtitle: "Explore beautifully crafted digital stationery.",
                ),

                SizedBox(height: 24.h),

                CategorySelector(
                  selected: provider.selected,
                  onSelect: provider.selectCategory,
                ),

                SizedBox(height: 30.h),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: products.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    crossAxisSpacing: 14.w,

                    mainAxisSpacing: 16.h,

                    childAspectRatio: .60,
                  ),

                  itemBuilder: (_, index) {
                    final product = products[index];

                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 50.h),

                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
