import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';
import '../../providers/product_provider.dart';
import '../pages/product_detail_page.dart';
import '../pages/sections/featured_section.dart';
import '../widgets/category_selector.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final products = provider.productsFiltered;

    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
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

              SizedBox(height: 26.h),

              CategorySelector(
                selected: provider.selected,
                onSelect: provider.selectCategory,
              ),

              SizedBox(height: 32.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    final width = constraints.maxWidth;

                    int columns;

                    if (width >= 1200) {
                      columns = 4;
                    } else if (width >= 900) {
                      columns = 3;
                    } else {
                      columns = 2;
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      itemCount: products.length,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,

                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,

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
                                builder: (_) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 70.h),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
