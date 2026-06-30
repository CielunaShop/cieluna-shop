import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';
import '../../../constants/text_styles.dart';
import '../../../providers/product_provider.dart';
import '../../widgets/product_card.dart';
import '../../widgets/section_title.dart';
import '../product_detail_page.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    final featured = provider.productsFiltered
        .where((e) => e.featured)
        .toList();

    if (featured.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
        const SectionTitle(
  title: "Featured Collection",
  subtitle:
      "Handpicked planners loved by our community.",
),

SizedBox(height: 28),

          SizedBox(height: 22.h),

          SizedBox(
            height: 430.h,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              itemCount: featured.length,

              separatorBuilder: (_, __) => SizedBox(width: 20.w),

              itemBuilder: (_, index) {
                return SizedBox(
                  width: 310.w,

                  child: ProductCard(
                    product: featured[index],

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailPage(product: featured[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
