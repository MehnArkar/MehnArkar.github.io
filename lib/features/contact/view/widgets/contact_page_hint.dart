import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class ContactPageHint extends StatelessWidget {
  const ContactPageHint({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
        animationType: VisibilityAnimationType.slideUp,
        child: Text("Let’s Build Something Amazing Together ✌️",style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.onSurfaceVariant,fontWeight: FontWeight.w600)));
  }
}
