import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/app_colors.dart';

class AnimatedRing extends CustomPainter{
  final double? strokeWidth;
  AnimatedRing({this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = strokeWidth ?? 35
      ..strokeCap = StrokeCap.round
      ..style=PaintingStyle.stroke;
    Rect rect = Rect.fromCenter(center: Offset(size.width/2, size.height/2), width: size.width, height: size.height);

    paint.color = AppColors.gradientEndColor;
    canvas.drawArc(rect, degreeToRadian(180), degreeToRadian(45), false, paint);
    canvas.drawArc(rect, degreeToRadian(0), degreeToRadian(45), false, paint);

    paint.color = AppColors.gradientStartColor;
    canvas.drawArc(rect, degreeToRadian(245), degreeToRadian(95), false, paint);
    canvas.drawArc(rect, degreeToRadian(65), degreeToRadian(95), false, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  degreeToRadian(double degree){
    return degree * pi / 180;
  }

}