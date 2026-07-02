import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/products.dart';
import '../../widgets/featured_product_card.dart';
import '../../widgets/section_title.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = products.where((e) => e.featured).take(4).toList();

    return Column(
      children: [
        const SectionTitle(
          title: "Featured Collection",
          subtitle: "Handpicked favourites you'll love.",
        ),

        SizedBox(height: 32.h),

        SizedBox(
          height: 420.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollDirection: Axis.horizontal,

            itemCount: featured.length,

            separatorBuilder: (_, __) => SizedBox(width: 18.w),

            itemBuilder: (_, index) {
              return FeaturedProductCard(product: featured[index]);
            },
          ),
        ),
      ],
    );
  }
}
