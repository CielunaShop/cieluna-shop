import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ui/pages/product_detail_page.dart';
import '../../providers/product_provider.dart';
import '../widgets/category_selector.dart';
import '../widgets/product_card.dart';
import '../widgets/footer.dart';
import '../../../constants/color.dart';
import '../../models/product_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final list = provider.productsFiltered;

    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
           CategorySelector(
  selected: provider.selected,
  onSelect: provider.selectCategory,
),

            SizedBox(height: 20.h),

            Expanded(
              child: LayoutBuilder(
                builder: (_, c) {
                  int cols = c.maxWidth < 600 ? 1 : 2;
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      crossAxisSpacing: 14.w,
                      mainAxisSpacing: 14.h,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (_, i) {
                      return ProductCard(
                        product: list[i],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailPage(product: list[i]),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
