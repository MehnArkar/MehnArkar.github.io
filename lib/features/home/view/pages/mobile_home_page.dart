import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/utils/extensions/animation_extension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/core/presentation/widgets/gradient_button.dart';
import '../../../../app/utils/constant/app_constants.dart';
import '../widgets/animated_avatar.dart';
import '../widgets/animated_tech_stack.dart';
import '../widgets/bio_text.dart';
import '../widgets/name_text.dart';
import '../widgets/position_text.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: AppDimension.mobilePagePadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: kToolbarHeight),
          AnimatedAvatar(width: context.sh*0.25),
          const NameText().slideUpAnimation(),
          const SizedBox(height: AppDimension.mobilePaddingSmallS),
          const PositionText().slideUpAnimation(),
          SizedBox(height: context.sh*0.0),
          const BioText().slideUpAnimation(),
          SizedBox(height: context.sh*0.1),
          GradientButton(
            label: "Contact Me",
            onPressed: ()=>launchUrl(AppConstants.emailLaunchUri),
          ).slideUpAnimation(),
          SizedBox(height: context.sh*0.05),
          Align(
              alignment: Alignment.centerLeft,
              child: _techStack(context))
        ],
      ),
    );
  }

  Widget _techStack(BuildContext context){
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Tech Stack",style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
        Container(margin: EdgeInsets.symmetric(horizontal: context.sw*0.03),height: 30,width: 2,color: context.colorScheme.onSurfaceVariant),
        const AnimatedTechStack(iconSize:30)
      ],
    );
  }
}
