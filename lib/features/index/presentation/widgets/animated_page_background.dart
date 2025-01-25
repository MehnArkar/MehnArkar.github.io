import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/index/presentation/widgets/animated_ring.dart';

class AnimatedPageBackground extends StatelessWidget {
  const AnimatedPageBackground({super.key});

  @override
  Widget build(BuildContext context) {
     return Stack(
       alignment: Alignment.center,
       children: [
         Positioned(
           top: 0,
           // bottom: 0,
           // left: 0,
           right: 0,
           // left: -context.sw*0.2/2,
           child: Animate(
             effects: [RotateEffect(duration: 10000.ms)],
              onPlay: (controller)=>controller.repeat(),
             child: CustomPaint(
               size: Size(context.sw*0.25,context.sw*0.25),
               painter: AnimatedRing(strokeWidth: 40),
             ),
           ),
         ),
         ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
                width: double.maxFinite,
                height:context.sh,
                decoration: BoxDecoration(color: context.colorScheme.surface.withOpacity(0.2)),
            ),
          ),
             ),
       ],
     );
  }
}
