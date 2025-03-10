import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/features/contact/view/widgets/social_icon_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSocialIcon extends StatefulWidget {
  final double size;
  const AnimatedSocialIcon({super.key,required this.size});

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: AppConstants.animationDuration);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        if(info.visibleFraction >= 0.5){
          _animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context,child) {
          return Opacity(
            opacity: _animationController.value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: _animationController.value * 150),
                    child: SocialIconWidget(
                        iconName: "github.svg",
                        iconSize: widget.size,
                        uri: AppConstants.githubLaunchUri)
                ),

                SocialIconWidget(
                    iconName: "linkedIn.svg",
                    uri: AppConstants.linkedInLaunchUri,
                    iconSize: widget.size,
                ),

                Padding(
                    padding: EdgeInsets.only(left: _animationController.value * 150),
                    child: SocialIconWidget(
                      iconName: "instagram.svg",
                      uri: AppConstants.instagramLaunchUri,
                      iconSize: widget.size,
                    )
                ),
              ]
            ),
          );
        }
      ),
    );
  }
}
