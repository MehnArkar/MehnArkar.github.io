import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';


class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
      animationType: VisibilityAnimationType.slideLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Education",style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary)),
          const SizedBox(height: 10),
          Text("Bachelor of Computer Science ( Undergraduate )",style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          Text("University of Computer studies,  Hpa-An",style: context.textTheme.bodyMedium)
        ],
      ),
    );
  }
}
