import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  /// Light Theme
  static Color primary = const Color(0xFF7B61FF);
  static Color onPrimary = const Color(0xFFFFFFFF);
  static Color surface = const Color(0xFFFFFFFF);
  static Color onSurface = const Color(0xFF333333);
  static Color onSrufaceVarient = const Color(0xFFB0B0B0);

  /// Dark Theme
  static Color primaryDark = const Color(0xFFBCA7FF);
  static Color onPrimaryDark = const Color(0xFFFFFFFF);
  static Color surfaceDark = const Color(0xFF1F1B2E);
  static Color onSurfaceDark = const Color(0xFFE3DCFF);
  static Color onSrufaceVarientDark = const Color(0xFFB0B0B0);


  static Color gradientStartColor = const Color(0xFF5A3FFF);
  static Color gradientEndColor = const Color(0xFFD16EFF);


  static Gradient primaryGradient = LinearGradient(
    colors: [gradientStartColor, gradientEndColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight
  );


  



}