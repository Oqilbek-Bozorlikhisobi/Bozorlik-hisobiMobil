// import 'package:flutter/material.dart';
//
// class AppColors {
//   AppColors._();
//
//   // static const primaryColor = Color(0xFF47c77d);
//   static const primaryColor = Color.fromRGBO(6, 178, 182, 1);
//   static const primaryColorOpacity = Color(0xFFedf9f2);
//   static const white =Color.fromRGBO(255,255,255,1);
//   static const backGround =Color.fromRGBO(249,249,249,1);
//   static const grayNormal = Color(0xFF8491A5);
//   static const grey =Color.fromRGBO(230,230,230,1);
//   static const greyText =Color.fromRGBO(190,190,190,1);
//   static const textPrimary = Color(0xFF191919);
//   static const red600 = Color(0xFFDC2626);
//   static const black = Colors.black;
// }
//
// final lightTheme = ThemeData(
//   iconTheme: IconThemeData(color: AppColors.primaryColor),
//   iconButtonTheme: IconButtonThemeData(
//     style: IconButton.styleFrom(foregroundColor: AppColors.primaryColor),
//   ),
//   colorScheme: ColorScheme.light(
//     primary: AppColors.primaryColor,
//     secondary: AppColors.primaryColor,
//
//     error: AppColors.red600,
//   ),
//   textTheme: TextTheme(
//     bodySmall: const TextStyle(
//       fontSize: 12,
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//     ),
//     bodyMedium: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//     ),
//     bodyLarge: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontSize: 16,
//     ),
//     titleSmall: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontSize: 18,
//     ),
//     titleMedium: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 20,
//     ),
//     titleLarge: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 24,
//     ),
//     headlineMedium: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 28,
//     ),
//     headlineLarge: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 32,
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     centerTitle: false,
//     surfaceTintColor: Colors.white,
//
//     titleTextStyle: TextStyle(
//       fontWeight: FontWeight.w600,
//       fontSize: 22,
//       color: Colors.black,
//     ),
//     backgroundColor: Colors.white,
//   ),
//   primaryColor: AppColors.primaryColor,
//   scaffoldBackgroundColor: Colors.white,
// );
// final darkTheme = ThemeData(
//   iconTheme: IconThemeData(color: AppColors.primaryColor),
//   iconButtonTheme: IconButtonThemeData(
//     style: IconButton.styleFrom(foregroundColor: AppColors.primaryColor),
//   ),
//   colorScheme: ColorScheme.light(
//     primary: AppColors.primaryColor,
//     secondary: AppColors.primaryColor,
//
//     error: AppColors.red600,
//   ),
//   textTheme: TextTheme(
//     bodySmall: const TextStyle(
//       fontSize: 12,
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//     ),
//     bodyMedium: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//     ),
//     bodyLarge: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontSize: 16,
//     ),
//     titleSmall: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontSize: 18,
//     ),
//     titleMedium: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 20,
//     ),
//     titleLarge: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 24,
//     ),
//     headlineMedium: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 28,
//     ),
//     headlineLarge: const TextStyle(
//       letterSpacing: 0.5,
//       color: AppColors.textPrimary,
//       fontWeight: FontWeight.w700,
//       fontSize: 32,
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     centerTitle: false,
//     surfaceTintColor: Colors.black,
//
//     titleTextStyle: TextStyle(
//       fontWeight: FontWeight.w600,
//       fontSize: 22,
//       color: Colors.black,
//     ),
//     backgroundColor: Colors.black,
//   ),
//   primaryColor: AppColors.primaryColor,
//   scaffoldBackgroundColor: Colors.black,
// );
import 'package:flutter/material.dart';
class AppColors {
  AppColors._();

  // Singleton pattern
  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;

  }

  static bool get _isDarkMode =>
      _context != null && Theme.of(_context!).brightness == Brightness.dark;

  // Dynamic colors based on theme
  static Color get primaryColor => const Color.fromRGBO(6, 178, 182, 1);
  static Color get primaryColorOpacity => const Color(0xFFedf9f2);
  static Color get white =>_isDarkMode? const Color(0xFF121212):const Color.fromRGBO(255, 255, 255, 1);

  static Color get backGround => _isDarkMode
      ? const Color(0xFF121212)
      : const Color.fromRGBO(249, 249, 249, 1);

  static Color get grayNormal => const Color(0xFF8491A5);

  static Color get grey => _isDarkMode
      ? const Color(0xFF2C2C2C)
      : const Color.fromRGBO(230, 230, 230, 1);

  static Color get greyText => _isDarkMode
      ? const Color(0xFF808080)
      : const Color.fromRGBO(190, 190, 190, 1);

  static Color get textPrimary => _isDarkMode
      ? const Color(0xFFE0E0E0)
      : const Color(0xFF191919);

  static Color get red600 => const Color(0xFFDC2626);
  static Color get red => const Color.fromRGBO(211, 47, 47, 1);
  static Color get black => Colors.black;

  // Dark Theme specific (agar kerak bo'lsa)
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkTextPrimary = Color(0xFFE0E0E0);
  static const darkTextSecondary = Color(0xFFB0B0B0);
  static const darkGrey = Color(0xFF2C2C2C);
  static const darkGreyText = Color(0xFF808080);
}
// class AppColors {
//   AppColors._();
//
//   // Light Theme Colors
//   static const primaryColor = Color.fromRGBO(6, 178, 182, 1);
//   static const primaryColorOpacity = Color(0xFFedf9f2);
//   static const white = Color.fromRGBO(255, 255, 255, 1);
//   static const backGround = Color.fromRGBO(249, 249, 249, 1);
//   static const grayNormal = Color(0xFF8491A5);
//   static const grey = Color.fromRGBO(230, 230, 230, 1);
//   static const greyText = Color.fromRGBO(190, 190, 190, 1);
//   static const textPrimary = Color(0xFF191919);
//   static const red600 = Color(0xFFDC2626);
//   static const red = Color.fromRGBO(211, 47, 47, 1);
//   static const black = Colors.black;
//
//   // Dark Theme Colors
//   static const darkBackground = Color(0xFF121212);
//   static const darkSurface = Color(0xFF1E1E1E);
//   static const darkTextPrimary = Color(0xFFE0E0E0);
//   static const darkTextSecondary = Color(0xFFB0B0B0);
//   static const darkGrey = Color(0xFF2C2C2C);
//   static const darkGreyText = Color(0xFF808080);
// }

final lightTheme = ThemeData(
  brightness: Brightness.light,
  iconTheme:  IconThemeData(color: AppColors.primaryColor),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: AppColors.primaryColor),
  ),
  colorScheme:  ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: AppColors.white,
    error: AppColors.red600,
    onPrimary: AppColors.white,
    onSurface: AppColors.textPrimary,
    onError: AppColors.white,
  ),
  textTheme:  TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontSize: 18,
    ),
    titleMedium: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headlineMedium: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headlineLarge: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
  ),
  appBarTheme:  AppBarTheme(
    centerTitle: false,
    surfaceTintColor: AppColors.white,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: AppColors.textPrimary,
    ),
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.textPrimary,
    iconTheme: IconThemeData(color: AppColors.textPrimary),
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.white,
  cardColor: AppColors.white,
  dividerColor: AppColors.grey,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: AppColors.primaryColor),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: AppColors.primaryColor),
  ),
  colorScheme:  ColorScheme.dark(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: AppColors.darkSurface,
    error: AppColors.red600,
    onPrimary: AppColors.white,
    onSurface: AppColors.darkTextPrimary,
    onError: AppColors.white,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
    ),
    bodyMedium: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
    ),
    bodyLarge: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
      fontSize: 18,
    ),
    titleMedium: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headlineMedium: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headlineLarge: TextStyle(
      letterSpacing: 0.5,
      color: AppColors.darkTextPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    surfaceTintColor: AppColors.darkSurface,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: AppColors.darkTextPrimary,
    ),
    backgroundColor: AppColors.darkSurface,
    foregroundColor: AppColors.darkTextPrimary,
    iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.darkBackground,
  cardColor: AppColors.darkSurface,
  dividerColor: AppColors.darkGrey,
);

// extension ThemeExtension on BuildContext {
//   bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
//
//   Color get backgroundColor => isDarkMode
//       ? AppColors.darkBackground
//       : AppColors.backGround;
//
//   Color get textColor => isDarkMode
//       ? AppColors.darkTextPrimary
//       : AppColors.textPrimary;
//
//   Color get cardColor => isDarkMode
//       ? AppColors.darkSurface
//       : AppColors.white;
//
//   Color get greyColor => isDarkMode
//       ? AppColors.darkGrey
//       : AppColors.grey;
// }