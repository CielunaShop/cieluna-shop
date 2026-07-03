import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class DesktopHeroShowcase extends StatelessWidget {
  const DesktopHeroShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430,
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          /// LEFT BACK CARD
          Positioned(
            top: 54,
            left: 8,
            child: _PlannerCard(
              rotation: -0.11,
              image: "assets/planners/fantasy/cover.png",
              width: 180,
              height: 260,
            ),
          ),

          /// RIGHT BACK CARD
          Positioned(
            top: 32,
            right: 4,
            child: _PlannerCard(
              rotation: 0.10,
              image: "assets/todos/cover.png",
              width: 180,
              height: 260,
            ),
          ),

          /// MAIN FRONT CARD
          Positioned(
            bottom: 0,
            left: 112,
            child: _PlannerCard(
              rotation: 0,
              image: "assets/notes/cover.png",
              width: 205,
              height: 290,
              featured: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlannerCard extends StatelessWidget {
  final String image;
  final double rotation;
  final double width;
  final double height;
  final bool featured;

  const _PlannerCard({
    required this.image,
    required this.rotation,
    required this.width,
    required this.height,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(featured ? 10 : 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: featured ? 26 : 18,
              offset: Offset(0, featured ? 14 : 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
