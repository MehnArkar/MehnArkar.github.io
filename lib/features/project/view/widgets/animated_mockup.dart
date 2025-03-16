import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class AnimatedMockup extends StatelessWidget {
  final double height;
  final AnimationController animationController;
  final List<String> images;
  const AnimatedMockup({super.key, required this.height, required this.animationController,required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(0, height / 10),
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, _) => Container(
                    width: animationController.value * height,
                    height: animationController.value * height,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.gradientStartColor,
                        AppColors.gradientEndColor
                      ]),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: height,
                  height: height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(height),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                      child: Container(
                          width: height,
                          height: height,
                          color: context.colorScheme.surface
                              .withAlpha((0.1*255).toInt())),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Animate(
              controller: animationController,
              autoPlay: false,
              effects: [
                const MoveEffect(begin: Offset(0, 0), end: Offset(0, 0)),
                RotateEffect(
                    begin: d2r(0),
                    end: d2r(1.5),
                    duration: 800.ms,
                    alignment: Alignment.bottomRight)
              ],
              child: Image.asset(
                "${AppConstants.imagePath}/mockups/${images.last}",
                height: height,
                fit: BoxFit.cover,
              )),
          Animate(
              controller: animationController,
              autoPlay: false,
              effects: [
                const MoveEffect(begin: Offset(0, 0), end: Offset(0, 0)),
                RotateEffect(
                    begin: d2r(0),
                    end: d2r(-1.5),
                    duration: 800.ms,
                    alignment: Alignment.bottomLeft)
              ],
              child: Image.asset(
                "${AppConstants.imagePath}/mockups/${images!.first}",
                height: height,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }

  double d2r(double d) {
    double r = (d * pi) / 180;
    return r;
  }
}
