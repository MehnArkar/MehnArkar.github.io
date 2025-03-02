import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class AppStoreButton extends StatelessWidget {
  final String url;
  const AppStoreButton({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: ()async=> await launchUrl(Uri.parse(url)),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8)
        ),
        child: Row(
          children: [
            Image.asset("${AppConstants.imagePath}/apple.png",width: 18),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get it on",style: context.textTheme.labelSmall?.copyWith(height: 0.9)),
                Text("App Store",style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700,height: 0.9)),
              ],
            )

          ],
        )
    );
  }
}
