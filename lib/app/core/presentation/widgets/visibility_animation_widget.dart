import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/constant/app_constants.dart';

enum VisibilityAnimationType { slideUp, fromRight, fromLeft }

class VisibilityAnimationWidget extends StatefulWidget {
  final Widget child;
  final VisibilityAnimationType? animationType;
  final List<Effect>? effects;
  const VisibilityAnimationWidget(
      {super.key, this.animationType, required this.child, this.effects});

  @override
  State<VisibilityAnimationWidget> createState() =>
      _VisibilityAnimationWidgetState();
}

class _VisibilityAnimationWidgetState extends State<VisibilityAnimationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
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
          var visiblePercentage = visibilityInfo.visibleFraction;
          if (visiblePercentage >= 0.5) {
            _animationController.forward();
          }
        },
        child: Animate(
            controller: _animationController,
            autoPlay: false,
            effects: widget.effects != null && widget.effects!.isNotEmpty
                ? widget.effects
                : widget.animationType != null
                    ? [
                        animations[widget.animationType]!,
                        const FadeEffect(
                            duration: AppConstants.animationDuration,
                            begin: 0,
                            end: 1)
                      ]
                    : [],
            child: widget.child));
  }

  final Map<VisibilityAnimationType, Effect<dynamic>> animations = {
    VisibilityAnimationType.fromRight: const SlideEffect(
        duration: AppConstants.animationDuration,
        begin: Offset(0.3, 0.0),
        end: Offset(0.0, 0.0)),
    VisibilityAnimationType.fromLeft: const SlideEffect(
        duration: AppConstants.animationDuration,
        begin: Offset(-0.3, 0.0),
        end: Offset(0.0, 0.0)),
    VisibilityAnimationType.slideUp: const SlideEffect(
        duration: AppConstants.animationDuration,
        begin: Offset(0, 3.0),
        end: Offset(0.0, 0.0)),
  };
}
