import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/theme/app_colors.dart';

abstract class AppTheme {
  static const _fontFamily = 'Inter';
  static const _fontSizeTitle = 16.0;
  static const _fontSizeLarge = 24.0;
  static const _fontSizeMedium = 16.0;
  static const _fontSizeNormal = 14.0;
  static const _fontSizeSmall = 12.0;

  // Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: _fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      titleTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeTitle,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
      // Text Theme
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeMedium,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeMedium,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeNormal,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeSmall,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeNormal,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeSmall,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    ),
  );

  // Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: _fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blueDark,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blueDark,
      titleTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeTitle,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.black,
    // Text Theme
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeMedium,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeMedium,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeNormal,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeSmall,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeNormal,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSizeSmall,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    ),
  );
}
