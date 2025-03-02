import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/gradient_text.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class ContactPageTitle extends StatelessWidget {
  const ContactPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
        animationType: VisibilityAnimationType.slideUp,
        child: GradientText("Let’s connect",style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700)));
  }
}
