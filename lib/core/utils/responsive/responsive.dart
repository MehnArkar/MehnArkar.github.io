import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_dimension.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  /// mobile < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppDimention.MOBILE_WIDTH;

  /// tablet >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimention.MOBILE_WIDTH;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimention.DESKTOP_WIDTH;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= AppDimention.DESKTOP_WIDTH) {
        return desktop;
      } else if (constraints.maxWidth >= AppDimention.MOBILE_WIDTH) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}