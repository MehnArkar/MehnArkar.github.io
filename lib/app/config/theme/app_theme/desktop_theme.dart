import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/config/theme/dimension/desktop_dimension.dart';
import '../app_colors.dart';

class DesktopTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    scaffoldBackgroundColor: AppColors.surface,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary
    ).copyWith(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface
    ),
    textTheme: _textTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    scaffoldBackgroundColor: AppColors.surfaceDark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary
    ).copyWith(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: AppColors.onPrimaryDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.onSurfaceDark
    ),
    textTheme: _textTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static  final TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 50.sp),
    titleMedium: TextStyle(fontSize: 30.sp),
    bodyMedium: TextStyle(fontSize: 20.sp),
    bodySmall: TextStyle(fontSize: 18.sp),
  );

  static  final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 50),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: AppColors.onSurface.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesktopDimension.borderRadius),
        )
    ),
  );

}
