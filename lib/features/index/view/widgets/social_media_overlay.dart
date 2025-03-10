import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import '../../../../app/utils/constant/app_constants.dart';
import '../../../contact/view/widgets/social_icon_widget.dart';

class SocialMediaOverlay extends StatefulWidget {
  final ScrollController scrollController;

  const SocialMediaOverlay({super.key, required this.scrollController});

  @override
  SocialMediaOverlayState createState() => SocialMediaOverlayState();
}

class SocialMediaOverlayState extends State<SocialMediaOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  double iconSize = 28;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(_animationController);

    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double currentScrollOffset = widget.scrollController.offset;
    double maxScrollOffset = widget.scrollController.position.maxScrollExtent;
    if (currentScrollOffset >= maxScrollOffset - (context.sh * 0.5)) {
      if (_animationController.status != AnimationStatus.forward && _animationController.status != AnimationStatus.completed) {
        _animationController.forward();
      }
    } else {
      if (_animationController.status != AnimationStatus.reverse && _animationController.status != AnimationStatus.dismissed) {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityAnimationWidget(
      animationType: VisibilityAnimationType.fromRight,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SizedBox(
          width: context.sw * 0.1,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                SocialIconWidget(
                  iconName: "github.svg",
                  iconSize: iconSize,
                  uri: AppConstants.githubLaunchUri,
                ),
                SocialIconWidget(
                  iconName: "linkedIn.svg",
                  uri: AppConstants.linkedInLaunchUri,
                  iconSize: iconSize,
                ),
                SocialIconWidget(
                  iconName: "instagram.svg",
                  uri: AppConstants.instagramLaunchUri,
                  iconSize: iconSize,
                ),
                Container(
                  height: context.sh * 0.15,
                  width: 2.5,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
