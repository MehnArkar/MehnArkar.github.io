import 'package:flutter/material.dart';
import 'package:portfolio/app/config/theme/dimension/app_dimension.dart';
import 'package:portfolio/app/config/theme/dimension/desktop_dimension.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import '../../../utils/responsive/device_screen_type.dart';
import '../../../utils/responsive/responsive.dart';
import '../app_colors.dart';

class AppTheme {

  static  ThemeData createLightTheme(BuildContext context){
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary
      ).copyWith(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          onSurfaceVariant: AppColors.onSrufaceVarient
      ),
      textTheme: responsiveTextTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  static ThemeData createDarkTheme(BuildContext context){
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.surfaceDark,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary
      ).copyWith(
          brightness: Brightness.dark,
          primary: AppColors.primaryDark,
          onPrimary: AppColors.onPrimaryDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.onSurfaceDark,
          onSurfaceVariant: AppColors.onSrufaceVarientDark
      ),
      textTheme: responsiveTextTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }


  static  final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(AppDimension.buttonHeight),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: AppColors.onSurface.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        )
    ),
  );

  static TextTheme responsiveTextTheme(BuildContext context) {

    double scaleFactor = 1.0;

    switch(Responsive.getDeviceScreenType(context)){
      case DeviceScreenType.mobile:
        scaleFactor = 0.95;
        break;
      case DeviceScreenType.tablet:
        scaleFactor = 0.95;
        break;
      case DeviceScreenType.desktop:
        scaleFactor = 0.95;
        break;
    }


    return TextTheme(
      displayLarge: TextStyle(fontSize: 64 * scaleFactor),
      displayMedium: TextStyle(fontSize: 48 * scaleFactor),
      displaySmall: TextStyle(fontSize: 36 * scaleFactor),
      headlineLarge: TextStyle(fontSize: 32 * scaleFactor),
      headlineMedium: TextStyle(fontSize: 28 * scaleFactor),
      headlineSmall: TextStyle(fontSize: 24 * scaleFactor),
      titleLarge: TextStyle(fontSize: 22 * scaleFactor),
      titleMedium: TextStyle(fontSize: 18 * scaleFactor),
      titleSmall: TextStyle(fontSize: 16 * scaleFactor),
      bodyLarge: TextStyle(fontSize: 16 * scaleFactor),
      bodyMedium: TextStyle(fontSize: 14 * scaleFactor),
      bodySmall: TextStyle(fontSize: 12 * scaleFactor),
      labelLarge: TextStyle(fontSize: 14 * scaleFactor),
      labelMedium: TextStyle(fontSize: 12 * scaleFactor),
      labelSmall: TextStyle(fontSize: 10 * scaleFactor),
    );
  }

}
