import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/contact/view/widgets/animated_social_icon.dart';
import 'package:portfolio/features/contact/view/widgets/contact_box.dart';
import 'package:portfolio/features/contact/view/widgets/contact_page_desc.dart';
import 'package:portfolio/features/contact/view/widgets/contact_page_hint.dart';
import 'package:portfolio/features/contact/view/widgets/contact_page_title.dart';
import 'package:portfolio/features/contact/view/widgets/footer_text.dart';

class DesktopContactPage extends StatelessWidget {
  const DesktopContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenSizeContainer(
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ContactPageTitle(),
                const SizedBox(height:10),
                const ContactPageDesc(),
                const SizedBox(height:20),
                const ContactPageHint(),
                SizedBox(height: context.sh*0.1),
                const ContactBox()


              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: context.sh*0.05,
              child:   const VisibilityAnimationWidget(
                animationType:VisibilityAnimationType.slideUp,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSocialIcon(size: 30),
                    SizedBox(height: 15),
                    FooterText()
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
