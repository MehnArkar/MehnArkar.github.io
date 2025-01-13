import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimationExtension on Widget{
  slideUpAnimation(){
    return animate(
      effects: const [
        SlideEffect(
          begin: Offset(0, 0.15),
          end: Offset(0, 0)
        ),
        FadeEffect(
          begin: 0,
          end: 1
        )
      ]
    );
  }
}