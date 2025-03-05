import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: ()=>launchUrl(AppConstants.githubLaunchUri),
                        child: SvgPicture.asset("${AppConstants.iconPath}/github.svg",width: widget.size,height: widget.size))),
                InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: ()=>launchUrl(AppConstants.linkedInLaunchUri),
                    child: SvgPicture.asset("${AppConstants.iconPath}/linkedIn.svg",width: widget.size,height: widget.size)),
                Padding(
                    padding: EdgeInsets.only(left: _animationController.value * 150),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: ()=>launchUrl(AppConstants.instagramLaunchUri),
                        child: SvgPicture.asset("${AppConstants.iconPath}/instagram.svg",width: widget.size,height: widget.size))),
              ]
            ),
          );
        }
      ),
    );
  }
}
