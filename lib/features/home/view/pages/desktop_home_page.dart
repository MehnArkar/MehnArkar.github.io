import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_cubit.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_state.dart';
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
                Expanded(child: _BioPanel()),
                Expanded(child: _AvatarPanel()),
              ],
            ),
          ),

          Positioned(
            left: 0,
            bottom: context.sh * 0.1,
            child: const _TechStack(),
          ),

          const Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child:_AnimatedMouseScroll(),
            ),
          )
        
        ],
      ),
    );
  }
}

class _BioPanel extends StatelessWidget {
  const _BioPanel();

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

class _AvatarPanel extends StatelessWidget {
  const _AvatarPanel();

  @override
  Widget build(BuildContext context) {
    return const Center(child: AnimatedAvatar(width: 300));
  }
}

class _TechStack extends StatelessWidget {
  const _TechStack();

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

class _AnimatedMouseScroll extends StatelessWidget {
  const _AnimatedMouseScroll();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ThemeCubit,ThemeState>(
      builder: (context,state) {
        return Lottie.asset(
            state is LightTheme ? "assets/lottie/mouse_scroll.json" :  "assets/lottie/mouse_scroll_dark.json",
            width: 50,
            fit: BoxFit.fitWidth

        );
      }
    );
  }
}

