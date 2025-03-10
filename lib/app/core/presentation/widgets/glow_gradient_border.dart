import 'package:flutter/material.dart';

class GlowGradientBorder extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final double blurRadius;
  final double spreadRadius;
  final List<Color> gradientColors;
  final BorderRadius borderRadius;

  const GlowGradientBorder({
    Key? key,
    required this.child,
    this.borderWidth = 2.0,
    this.blurRadius = 10.0,
    this.spreadRadius=0.0,
    this.gradientColors = const [Colors.blue, Colors.purple, Colors.pink],
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.6),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
          BoxShadow(
            color: gradientColors.last.withOpacity(0.6),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: borderRadius.subtract(BorderRadius.circular(borderWidth)),
          ),
          child: child,
        ),
      ),
    );
  }
}