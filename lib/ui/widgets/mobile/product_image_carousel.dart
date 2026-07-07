import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/color.dart';
import '../shared/product_image_viewer.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;

  const ProductImageCarousel({super.key, required this.images});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int activeIndex = 0;

  final PageController _controller = PageController();

  void _openImageViewer(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ProductImageViewer(images: widget.images, initialIndex: index),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SQUARE IMAGE BOX
        AspectRatio(
          aspectRatio: 1,

          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,

            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
              });
            },

            itemBuilder: (_, index) {
              return Material(
                color: Colors.transparent,
              
                child: InkWell(
                  onTap: () => _openImageViewer(index),
                  borderRadius: BorderRadius.circular(16.r),
              
                  child: Stack(
                    fit: StackFit.expand,
              
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Container(
                          color: card,
                          child: Image.asset(
                            widget.images[index],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
              
                      Positioned(
                        right: 14.w,
                        bottom: 14.h,
              
                        child: Container(
                          width: 42.w,
                          height: 42.w,
              
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.92),
                            shape: BoxShape.circle,
                            border: Border.all(color: border),
              
                            boxShadow: [
                              BoxShadow(
                                color: shadow,
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
              
                          child: Icon(
                            Icons.zoom_in_rounded,
                            size: 21.sp,
                            color: accentPink,
                          ),
                        ),
                      ),
                    ],
                  ),
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
