import 'package:flutter/material.dart';
import 'package:ecommerce/utils/theme/typography.dart';

/// Text theme configuration for the application.
/// 
/// This class provides methods to create consistent text styles
/// based on Material Design 3 typography guidelines.
class AppTextTheme {
  AppTextTheme._(); // Private constructor to prevent instantiation

  /// Default font family for the app
  // static const String defaultFontFamily = 'CircularStd';
  // static const String gabaritoFontFamily = 'Gabarito';
  // static const String almaraiFontFamily = 'Almarai';
  // static const String interFontFamily = 'Inter';
  // To use one of the other font families, you can change defaultFontFamily or pass it to createTextTheme

  /// Creates a complete text theme for the application
  static TextTheme createTextTheme({
    required ColorScheme colorScheme,
    String? fontFamily,
  }) {
    final String effectiveFontFamily = fontFamily ?? AppFontFamilies.defaultFontFamily;
    
    return TextTheme(
      // Display styles - for large, prominent text
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.12,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.16,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.22,
      ),

      // Headline styles - for section headers
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.25,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.29,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.33,
      ),

      // Title styles - for card headers, list items
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
        // color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.50,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.43,
      ),

      // Label styles - for buttons, chips, tabs
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.43,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.50,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.33,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.50,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.45,
      ),

      // Body styles - for paragraphs, descriptions
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.50,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colorScheme.onSurface,
        fontFamily: effectiveFontFamily,
        height: 1.43,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.40,
        color: colorScheme.onSurfaceVariant,
        fontFamily: effectiveFontFamily,
        height: 1.33,
      ),
    );
  }
}