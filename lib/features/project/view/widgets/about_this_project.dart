import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class AboutThisProject extends StatelessWidget {
  final double width;
  final double height;
  const AboutThisProject({super.key,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width:width,height: height,color: context.colorScheme.primary),
        const SizedBox(width: 20),
        Text("About this project",style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700))
      ],
    );
  }
}
