import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/products.dart';
import '../../widgets/featured_product_card.dart';
import '../../widgets/shared/section_title.dart';

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
          height: 290.h,

          child: ListView.separated(
            padding: EdgeInsets.only(left: 20.w, right: 8.w),

            scrollDirection: Axis.horizontal,

            physics: const BouncingScrollPhysics(),

            itemCount: featured.length,

            separatorBuilder: (_, __) => SizedBox(width: 12.w),

            itemBuilder: (_, index) {
              return FeaturedProductCard(product: featured[index]);
            },
          ),
        ),
      ],
    );
  }
}
