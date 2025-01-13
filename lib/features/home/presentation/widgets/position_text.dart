import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class PositionText extends StatelessWidget {
  const PositionText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text("a ",style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
        AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                  "Mobile Devleoper",
                  textStyle: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary),
                  speed: const Duration(milliseconds: 150)
              )
            ],
          isRepeatingAnimation: true,
          pause: const Duration(seconds: 3),

        )
      ],
    );
  }
}
