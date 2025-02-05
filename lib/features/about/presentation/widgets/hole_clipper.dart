import 'package:flutter/cupertino.dart';

class HoleClipper extends CustomClipper<Path>{
  final double holeSize;
  const HoleClipper({required this.holeSize});
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path()
      ..fillType=PathFillType.evenOdd
      ..addRect(Rect.fromLTWH(0, 0, width, height))
      ..addOval(Rect.fromCenter(center: Offset(width/2, height/2), width: holeSize, height: holeSize));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) =>true;

}