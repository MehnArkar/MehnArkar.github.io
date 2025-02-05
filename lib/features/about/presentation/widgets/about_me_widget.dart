import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
      animationType: VisibilityAnimationType.slideLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("About Me",style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary)),
          const SizedBox(height: 10),
          Text("I’m a mobile developer with over 3 years of experience in Flutter and a strong foundation in Kotlin and Swift. I have a deep understanding of the mobile development lifecycle and third-party libraries. Passionate about delivering user-friendly, scalable solutions, I continuously strive to improve my skills and contribute to team success.",
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
