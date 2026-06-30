import 'package:cielunashop/ui/pages/sections/featured_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/text_styles.dart';
import '../../ui/pages/product_detail_page.dart';
import '../../providers/product_provider.dart';
import '../widgets/category_selector.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';
import '../widgets/footer.dart';
import '../../../constants/color.dart';
import '../widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final list = provider.productsFiltered;

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),

            SizedBox(height: 50.h),

            const FeaturedSection(),

            SizedBox(height: 60.h),

            CategorySelector(
              selected: provider.selected,
              onSelect: provider.selectCategory,
            ),

            SizedBox(height: 40.h),

           const SectionTitle(
  title: "Browse Collection",
  subtitle:
      "Explore beautifully crafted digital stationery.",
),

SizedBox(height: 30),

            SizedBox(height: 22.h),

            LayoutBuilder(
              builder: (_, c) {
                int cols = c.maxWidth > 900
                    ? 3
                    : c.maxWidth > 600
                    ? 2
                    : 1;

                return GridView.builder(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),

                  padding: EdgeInsets.symmetric(horizontal: 22.w),

                  itemCount: list.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cols,

                    crossAxisSpacing: 22,

                    mainAxisSpacing: 22,
                    childAspectRatio: .68,
                  ),

                  itemBuilder: (_, i) {
                    return ProductCard(
                      product: list[i],

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(product: list[i]),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),

            SizedBox(height: 70.h),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
