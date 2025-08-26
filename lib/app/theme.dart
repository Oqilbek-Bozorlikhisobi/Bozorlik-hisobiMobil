import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryColor = Color(0xFF47c77d);
  static const primaryColorOpacity = Color(0xFFedf9f2);
  static const grayNormal = Color(0xFF8491A5);
  static const textPrimary = Color(0xFF191919);
  static const red600 = Color(0xFFDC2626);
}

final lightTheme = ThemeData(
  iconTheme: IconThemeData(color: AppColors.primaryColor),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: AppColors.primaryColor),
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,

    error: AppColors.red600,
  ),
  textTheme: TextTheme(
    bodySmall: const TextStyle(
      fontSize: 12,
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
    ),
    bodyMedium: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
    ),
    bodyLarge: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontSize: 16,
    ),
    titleSmall: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontSize: 18,
    ),
    titleMedium: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    titleLarge: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headlineMedium: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headlineLarge: const TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: false,

    surfaceTintColor: Colors.white,

    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: Colors.white,
);
