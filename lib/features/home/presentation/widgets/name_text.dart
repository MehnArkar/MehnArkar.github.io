import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/gradient_text.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Hi, I'm ",style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700)),
        GradientText("Arkar Min",style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700))
      ],
    );
  }
}
