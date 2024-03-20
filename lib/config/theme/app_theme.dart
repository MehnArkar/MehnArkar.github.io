import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/theme/app_color.dart';
import 'package:portfolio/config/theme/app_dimension.dart';

class AppTheme{

  static ThemeData light = ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: AppColor.secondaryColor,
            brightness: Brightness.light
          ),
          fontFamily: GoogleFonts.openSans().fontFamily,
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: AppDimention.font_body_small,color: Colors.black),
            bodyMedium: TextStyle(fontSize: AppDimention.font_body_medium,color: Colors.black),
            bodyLarge: TextStyle(fontSize: AppDimention.font_body_large,color: Colors.black),
            titleMedium: TextStyle(fontSize: AppDimention.font_title_medium,color: Colors.black),
            titleLarge: TextStyle(fontSize: AppDimention.font_title_large,color: Colors.black),
            displayMedium: TextStyle(fontSize: AppDimention.font_display_medium,color: Colors.black),
          )
      );

  static ThemeData dark = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: AppColor.secondaryColor,
        brightness: Brightness.dark
    ),
      fontFamily: GoogleFonts.openSans().fontFamily,
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: AppDimention.font_body_small,color: Colors.white),
        bodyMedium: TextStyle(fontSize: AppDimention.font_body_medium,color: Colors.white),
        bodyLarge: TextStyle(fontSize: AppDimention.font_body_large,color: Colors.white),
        titleMedium: TextStyle(fontSize: AppDimention.font_title_medium,color: Colors.white),
        titleLarge: TextStyle(fontSize: AppDimention.font_title_large,color: Colors.white),
        displayMedium: TextStyle(fontSize: AppDimention.font_display_medium,color: Colors.white),
      )

  );

}