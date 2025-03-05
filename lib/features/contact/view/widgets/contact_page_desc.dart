import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class ContactPageDesc extends StatelessWidget {
  const ContactPageDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
        animationType: VisibilityAnimationType.slideUp,
        child: FittedBox(
          fit: BoxFit.fitWidth,
            child:AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                    "Bring Your Dream Into Reality",
                    textStyle: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w700),
                    speed: const Duration(milliseconds: 150)
                )
              ],
              isRepeatingAnimation: true,
              pause: const Duration(seconds: 3),
            )

            // Text("Bring Your Dream Into Reality",style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w700))
        ));
  }
}
