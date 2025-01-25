import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';

extension AnimationExtension on Widget{
  slideUpAnimation(){
    return animate(
      effects:  [
        const SlideEffect(
          duration: AppConstants.animationDuration,
          begin:  Offset(0, 0.3),
          end:  Offset(0, 0)
        ),
        const FadeEffect(
            duration: AppConstants.animationDuration,
            begin: 0,
            end: 1
        )
      ]
    );
  }
}