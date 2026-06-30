import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/color.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  const ProductImageCarousel({super.key, required this.images});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int activeIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => activeIndex = i),
            itemBuilder: (_, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  widget.images[i],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),

        SizedBox(height: 12.h),

        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: accentPink,
            dotColor: blush,
            dotHeight: 7.h,
            dotWidth: 7.w,
            expansionFactor: 3,
          ),
        ),
      ],
    );
  }
}
