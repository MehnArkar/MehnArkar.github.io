import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Live, Love & Learn",style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w600,letterSpacing: 2));
  }
}
