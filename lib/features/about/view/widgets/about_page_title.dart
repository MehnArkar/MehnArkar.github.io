import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/gradient_text.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class AboutPageTitle extends StatelessWidget {
  const AboutPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
        animationType: VisibilityAnimationType.slideIn,
        child: GradientText("Who Am I?",style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700)));
  }
}
