import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  // Updated Colors from the Palette
  static const Color primaryColor = Color(0xFF1FCC79); // Primary green
  static const Color secondaryColor = Color(0xFFFF6B6B); // Secondary red
  static const Color mainTextColor = Color(0xFF2E3E5C); // Main text (dark blue)
  static const Color secondaryTextColor = Color(0xFF9FA5C0); // Secondary text
  static const Color outlineColor = Color(0xFFD0DBEA); // Outline color
  static const Color formBackgroundColor = Color(0xFFF4F5F7); // Form background

  static const Color errorColor = Colors.red; // Keeping defaults for alerts
  static const Color successColor = primaryColor; // Same as primary color

  // Font Sizes

  static double headlineLargeSize = 32.0.sp;
  static double headlineMediumSize = 27.0.sp;
  static double headlineSmallSize = 15.0.sp;

  static double bodyLargeSize = 20.0.sp;
  static double bodyMediumSize = 15.0.sp;
  static double bodySmallSize = 12.0.sp;

  // Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: errorColor,
      surface: Colors.white,
      onSurface: mainTextColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: headlineLargeSize,
          color: mainTextColor,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontSize: headlineMediumSize,
          color: mainTextColor,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: headlineSmallSize,
          color: mainTextColor,
          fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(
          fontSize: bodyLargeSize,
          color: mainTextColor,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontSize: bodyMediumSize,
          color: secondaryTextColor,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontSize: bodySmallSize,
          color: secondaryTextColor,
          fontWeight: FontWeight.w500),
    ),
  );

  // Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: Colors.white70),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: Colors.black,
      secondary: secondaryColor,
      onSecondary: Colors.black,
      error: errorColor,
      surface: Colors.black,
      onSurface: formBackgroundColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: headlineLargeSize,
          color: Colors.white,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontSize: headlineMediumSize,
          color: Colors.white,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: headlineSmallSize,
          color: Colors.white,
          fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(
          fontSize: bodyLargeSize,
          color: Colors.white,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontSize: bodyMediumSize,
          color: Colors.white70,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontSize: bodySmallSize,
          color: Colors.white60,
          fontWeight: FontWeight.w700),
    ),
  );
}
