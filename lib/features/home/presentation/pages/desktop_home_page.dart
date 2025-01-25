import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/gradient_button.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/animation_extension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/home/presentation/widgets/animated_avatar.dart';
import 'package:portfolio/features/home/presentation/widgets/animated_tech_stack.dart';
import 'package:portfolio/features/home/presentation/widgets/bio_text.dart';
import 'package:portfolio/features/home/presentation/widgets/name_text.dart';
import 'package:portfolio/features/home/presentation/widgets/position_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSizeContainer(
      child: Stack(
        children: [
          Center(
            child: Row(
              children: [
                Expanded(child: _bioPanel(context)),
                Expanded(child: _avatarPanel(context)),
              ],
            ),
          ),
          Positioned(
              left: 0,
              bottom: context.sh*0.1,
              child:_techStack(context)
          )
        ],
      ),
    );
  }

  Widget _bioPanel(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const NameText().slideUpAnimation(),
        const PositionText().slideUpAnimation(),
        SizedBox(height: context.sh*0.05),
        const BioText().slideUpAnimation(),
        SizedBox(height: context.sh*0.05),
        GradientButton(
            label: "Contact Me",
            onPressed: ()=>launchUrl(AppConstants.emailLaunchUri),
        ).slideUpAnimation()
      ],
    );
  }

  Widget _avatarPanel(BuildContext context){
    return const Center(child: AnimatedAvatar(width: 300));
  }

  Widget _techStack(BuildContext context){
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Tech Stack",style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
        Container(margin: EdgeInsets.symmetric(horizontal: context.sw*0.03),height: 30,width: 2,color: context.colorScheme.onSurfaceVariant),
        const AnimatedTechStack()
      ],
    );
  }

}
