import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/screen_size_container.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/contact/view/widgets/contact_page_desc.dart';
import 'package:portfolio/features/contact/view/widgets/contact_page_title.dart';

import '../../../../app/core/presentation/widgets/visibility_animation_widget.dart';
import '../widgets/animated_social_icon.dart';
import '../widgets/contact_box.dart';
import '../widgets/contact_page_hint.dart';
import '../widgets/footer_text.dart';

class MobileContactPage extends StatelessWidget {
  const MobileContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSizeContainer(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ContactPageTitle(),
            const SizedBox(height:8),
            const ContactPageDesc(),
            const SizedBox(height:15),
            const ContactPageHint(),
            SizedBox(height: context.sh*0.1),
            const ContactBox(),
            SizedBox(height: context.sh*0.1),
            const VisibilityAnimationWidget(
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
          ],
        ),
      ),
    );
  }
}
