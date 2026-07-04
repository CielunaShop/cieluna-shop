import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class ProductImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ProductImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<ProductImageViewer> createState() => _ProductImageViewerState();
}

class _ProductImageViewerState extends State<ProductImageViewer> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initialIndex;

    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void _previousImage() {
    if (_currentIndex == 0) return;

    _pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _nextImage() {
    if (_currentIndex == widget.images.length - 1) return;

    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F4F6),

      body: SafeArea(
        child: Stack(
          children: [
            /// IMAGES
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,

              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 100 : 18,
                    vertical: isDesktop ? 55 : 70,
                  ),

                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 5,
                    panEnabled: true,

                    child: Center(
                      child: Image.asset(
                        widget.images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),

            /// CLOSE BUTTON
            Positioned(
              top: 18,
              right: 22,

              child: _CircleButton(
                icon: Icons.close_rounded,
                onTap: () => Navigator.pop(context),
              ),
            ),

            /// IMAGE COUNTER
            Positioned(
              top: 22,
              left: 0,
              right: 0,

              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: border),
                  ),

                  child: Text(
                    "${_currentIndex + 1} / ${widget.images.length}",
                    style: const TextStyle(
                      color: textDark,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            /// DESKTOP PREVIOUS ARROW
            if (isDesktop && _currentIndex > 0)
              Positioned(
                left: 28,
                top: 0,
                bottom: 0,

                child: Center(
                  child: _CircleButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: _previousImage,
                  ),
                ),
              ),

            /// DESKTOP NEXT ARROW
            if (isDesktop && _currentIndex < widget.images.length - 1)
              Positioned(
                right: 28,
                top: 0,
                bottom: 0,

                child: Center(
                  child: _CircleButton(
                    icon: Icons.arrow_forward_ios_rounded,
                    onTap: _nextImage,
                  ),
                ),
              ),

            /// ZOOM HINT
            Positioned(
              bottom: 22,
              left: 0,
              right: 0,

              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: border),
                  ),

                  child: Text(
                    isDesktop
                        ? "Scroll or pinch to zoom • Drag to move"
                        : "Pinch to zoom • Drag to move",

                    style: const TextStyle(color: subtitleColor, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),

      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),

        child: Container(
          width: 46,
          height: 46,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: border),
          ),

          child: Icon(icon, size: 19, color: textDark),
        ),
      ),
    );
  }
}
