import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../utils/constant/app_constants.dart';

enum VisibilityAnimationType{
  slideUp,
  slideLeft
}

class VisibilityAnimationWidget extends StatefulWidget {
  final Widget child;
  final VisibilityAnimationType animationType;
  const VisibilityAnimationWidget({super.key,required this.child,required this.animationType});

  @override
  State<VisibilityAnimationWidget> createState() => _VisibilityAnimationWidgetState();
}

class _VisibilityAnimationWidgetState extends State<VisibilityAnimationWidget> with SingleTickerProviderStateMixin{
  late final  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: UniqueKey(),
        onVisibilityChanged: (visibilityInfo){
          var visiblePercentage = visibilityInfo.visibleFraction;
          if(visiblePercentage>=1){
            _animationController.forward();
          }
        },
        child: Animate(
            controller: _animationController,
            autoPlay: false,
            effects:  [
               animations[widget.animationType]!,
               const FadeEffect(
                  duration: AppConstants.animationDuration,
                  begin: 0,
                  end: 1
              )
            ],
            child: widget.child)
    );
  }

  final Map<VisibilityAnimationType,Effect<dynamic>> animations = {
    VisibilityAnimationType.slideLeft:const SlideEffect(
        duration: AppConstants.animationDuration,
        begin: Offset(0.3, 0.0),
        end: Offset(0.0, 0.0)
    ),
    VisibilityAnimationType.slideUp:const SlideEffect(
        duration: AppConstants.animationDuration,
        begin: Offset(0, 3.0),
        end: Offset(0.0, 0.0)
    ),
  };

}
