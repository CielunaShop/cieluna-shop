import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';
import '../../../providers/product_provider.dart';

import '../../widgets/desktop/desktop_hero.dart';
import '../../widgets/desktop/desktop_featured_section.dart';
import '../../widgets/desktop/desktop_category_bar.dart';
import '../../widgets/desktop/desktop_product_grid.dart';
import '../../widgets/desktop/desktop_footer.dart';
import '../../widgets/shared/section_title.dart';

import '../../widgets/desktop/desktop_navbar.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      backgroundColor: background,

      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DesktopNavbar(),

                const SizedBox(height: 10),
                const DesktopHero(),

                const SizedBox(height: 70),

                const DesktopFeaturedSection(),

                const SizedBox(height: 80),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48),
                  child: SectionTitle(
                    title: "Browse Collection",
                    subtitle:
                        "Discover planners, journals, templates and more.",
                  ),
                ),

                const SizedBox(height: 28),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: DesktopCategoryBar(
                    selected: provider.selected,
                    onSelect: provider.selectCategory,
                  ),
                ),

                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: DesktopProductGrid(
                    products: provider.productsFiltered,
                  ),
                ),

                const SizedBox(height: 60),

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
