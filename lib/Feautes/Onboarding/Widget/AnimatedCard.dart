import 'package:flutter/material.dart';

class AnimatedCard extends StatelessWidget {
  final bool showCard;
  final String imagePath;
  final double width;
  final double height;
  final Duration duration;
  final double initialScale;
  final Curve curve;

  const AnimatedCard({
    super.key,
    required this.showCard,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.duration,
    required this.initialScale,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showCard ? 1 : 0,
      duration: duration,
      child: AnimatedScale(
        scale: showCard ? 1 : initialScale,
        duration: duration,
        curve: curve,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
