import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';
import '../../../providers/product_provider.dart';

import '../../widgets/desktop/desktop_hero.dart';
import '../../widgets/desktop/desktop_featured_section.dart';
import '../../widgets/desktop/desktop_category_bar.dart';
import '../../widgets/desktop/desktop_product_grid.dart';
import '../../widgets/desktop/desktop_footer.dart';
import '../../widgets/desktop/desktop_navbar.dart';
import '../../widgets/shared/section_title.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _shopKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;

    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0,
    );
  }

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
                DesktopNavbar(
                  onHomeTap: () => _scrollTo(_homeKey),
                  onShopTap: () => _scrollTo(_shopKey),
                ),

                const SizedBox(height: 10),

                Container(key: _homeKey, child: const DesktopHero()),

                const SizedBox(height: 70),

                const DesktopFeaturedSection(),

                const SizedBox(height: 80),

                Container(
                  key: _shopKey,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48),
                    child: SectionTitle(
                      title: "Browse Collection",
                      subtitle:
                          "Discover planners, journals, templates and more.",
                    ),
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
