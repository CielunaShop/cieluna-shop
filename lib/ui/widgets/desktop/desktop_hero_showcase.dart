import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class DesktopHeroShowcase extends StatelessWidget {
  const DesktopHeroShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 520,
      height: 620,

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 80,
            left: 30,
            child: _PlannerCard(
              rotation: -.18,
              image: "assets/planners/fantasy/cover.png",
            ),
          ),

          Positioned(
            top: 25,
            right: 15,
            child: _PlannerCard(
              rotation: .15,
              image: "assets/planners/celestial/cover.png",
            ),
          ),

          Positioned(
            bottom: 0,
            left: 95,
            child: _PlannerCard(
              rotation: 0,
              image: "assets/planners/notes/cover.png",
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
  final bool featured;

  const _PlannerCard({
    required this.image,
    required this.rotation,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        width: featured ? 270 : 235,
        height: featured ? 380 : 330,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 35,
              offset: const Offset(0, 20),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),

            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}