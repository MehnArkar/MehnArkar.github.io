import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  const GradientText(
      this.text, {super.key,
         this.gradient,
        this.style,
      });



  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => (gradient ?? AppColors.primaryGradient).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}