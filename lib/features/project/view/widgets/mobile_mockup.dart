import 'package:flutter/material.dart';
import 'package:portfolio/app/core/presentation/widgets/visibility_animation_widget.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/features/project/view/widgets/animated_mockup.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MobileMockup extends StatefulWidget {
  final double height;
  final VisibilityAnimationType? animationType;
  final List<String> images;
  const MobileMockup({super.key, required this.height, this.animationType,required this.images});

  @override
  State<MobileMockup> createState() => _MobileMockupState();
}

class _MobileMockupState extends State<MobileMockup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: AppConstants.animationDuration);
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
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction >= 1.0) {
          _animationController.forward();
        }
      },
      child: VisibilityAnimationWidget(
        animationType: widget.animationType,
        child: AnimatedMockup(
            height: widget.height,
            animationController: _animationController,
            images: widget.images),
      ),
    );
  }
}
