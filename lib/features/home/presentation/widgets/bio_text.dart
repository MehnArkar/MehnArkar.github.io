import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class BioText extends StatelessWidget {
  const BioText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        "Highly motivated mobile application developer with extensive experience in native and cross-platform mobile development. Passionate about creating innovative mobile apps and continually exploring the art of coding.",
      style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,height: 1.75),

    );

  }
}
