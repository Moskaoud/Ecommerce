import 'package:flutter/material.dart';

import 'brand_colors.dart';

/// Color theme configuration for the application.
///
/// This class provides predefined color schemes and utilities
/// for creating consistent color palettes across the app.
class AppColorScheme {
  AppColorScheme._(); // Private constructor to prevent instantiation

  // Base brand colors
  static const Color _primaryColor = BrandColors.primary;
  static const Color _secondaryColor = BrandColors.secondary;
  static const Color _tertiaryColor = BrandColors.tertiary;

  /// Light color scheme for the application
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.light,
    secondary: _secondaryColor,
    tertiary: _tertiaryColor,
  );

  /// Dark color scheme for the application
  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.dark,
    secondary: _secondaryColor,
    tertiary: _tertiaryColor,
  );

  /// Custom light color scheme with manually defined colors
  static const ColorScheme customLightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary colors
    primary: Color(0xFF1976D2),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD4E7FF),
    onPrimaryContainer: Color(0xFF001C3B),

    // Secondary colors
    secondary: Color(0xFF00695C),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFB2DFDB),
    onSecondaryContainer: Color(0xFF002019),

    // Tertiary colors
    tertiary: Color(0xFFE65100),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFE0B2),
    onTertiaryContainer: Color(0xFF2E1500),

    // Error colors
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),

    // Surface colors
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE3E2E6),
    onSurfaceVariant: Color(0xFF46464F),
    surfaceTint: Color(0xFF1976D2),

    // Background colors (deprecated in Material 3 but kept for compatibility)
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1C1B1F),

    // Outline colors
    outline: Color(0xFF777680),
    outlineVariant: Color(0xFFC7C5D0),

    // Other colors
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFA6C8FF),
  );

  /// Custom dark color scheme with manually defined colors
  static const ColorScheme customDarkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary colors
    primary: Color(0xFFA6C8FF),
    onPrimary: Color(0xFF003062),
    primaryContainer: Color(0xFF004788),
    onPrimaryContainer: Color(0xFFD4E7FF),

    // Secondary colors
    secondary: Color(0xFF4DB6AC),
    onSecondary: Color(0xFF00332D),
    secondaryContainer: Color(0xFF004B43),
    onSecondaryContainer: Color(0xFFB2DFDB),

    // Tertiary colors
    tertiary: Color(0xFFFFB74D),
    onTertiary: Color(0xFF542100),
    tertiaryContainer: Color(0xFF7A3000),
    onTertiaryContainer: Color(0xFFFFE0B2),

    // Error colors
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    // Surface colors
    surface: Color(0xFF141218),
    onSurface: Color(0xFFE6E1E5),
    surfaceContainerHighest: Color(0xFF46464F),
    onSurfaceVariant: Color(0xFFC7C5D0),
    surfaceTint: Color(0xFFA6C8FF),

    // Outline colors
    outline: Color(0xFF91909A),
    outlineVariant: Color(0xFF46464F),

    // Other colors
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF1976D2),
  );

  /// Creates a color scheme from a seed color
  static ColorScheme createColorScheme({
    required Color seedColor,
    required Brightness brightness,
    Color? secondary,
    Color? tertiary,
  }) {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
      secondary: secondary,
      tertiary: tertiary,

    );
  }
}
