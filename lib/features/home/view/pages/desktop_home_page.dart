import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/gradient_button.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/animation_extension.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/animated_avatar.dart';
import '../widgets/animated_tech_stack.dart';
import '../widgets/bio_text.dart';
import '../widgets/name_text.dart';
import '../widgets/position_text.dart';
import 'package:lottie/lottie.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSizeContainer(
      child: Stack(
        children: [
          const Center(
            child: Row(
              children: [
                Expanded(child: BioPanel()),
                Expanded(child: AvatarPanel()),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: context.sh * 0.1,
            child: const TechStack(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: Lottie.asset(
                "assets/lottie/mouse_scroll.json",
                width: 50,
                fit: BoxFit.fitWidth
                        
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BioPanel extends StatelessWidget {
  const BioPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const NameText().slideUpAnimation(),
        const PositionText().slideUpAnimation(),
        SizedBox(height: context.sh * 0.05),
        const BioText().slideUpAnimation(),
        SizedBox(height: context.sh * 0.05),
        GradientButton(
          label: "Contact Me",
          onPressed: () => launchUrl(AppConstants.emailLaunchUri),
        ).slideUpAnimation(),
      ],
    );
  }
}

class AvatarPanel extends StatelessWidget {
  const AvatarPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: AnimatedAvatar(width: 300));
  }
}

class TechStack extends StatelessWidget {
  const TechStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Tech Stack",
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.sw * 0.03),
          height: 30,
          width: 2,
          color: context.colorScheme.onSurfaceVariant,
        ),
        const AnimatedTechStack(),
      ],
    );
  }
}
