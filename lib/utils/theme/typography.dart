import 'package:flutter/material.dart';

/// Defines font families used throughout the application.
class AppFontFamilies {
  AppFontFamilies._(); // Private constructor to prevent instantiation

  /// Default font family for the app
  static const String defaultFontFamily = 'CircularStd';
  static const String gabaritoFontFamily = 'Gabarito';
  static const String almaraiFontFamily = 'Almarai';
  static const String interFontFamily = 'Inter';

// To use one of the other font families, you can change defaultFontFamily
// or pass it explicitly when creating text styles or themes.
}

// Define your TextTheme using Almarai with different weights
const TextTheme almaraiTextTheme = TextTheme(
  // Example for displayLarge using ExtraBold (weight 800)
  displayLarge: TextStyle(fontFamily: 'Almarai', fontSize: 96.0, fontWeight: FontWeight.w800),
  displayMedium: TextStyle(fontFamily: 'Almarai', fontSize: 60.0, fontWeight: FontWeight.bold), // bold is w700
  displaySmall: TextStyle(fontFamily: 'Almarai', fontSize: 48.0, fontWeight: FontWeight.bold),

  headlineMedium: TextStyle(fontFamily: 'Almarai', fontSize: 34.0, fontWeight: FontWeight.bold),
  headlineSmall: TextStyle(fontFamily: 'Almarai', fontSize: 24.0, fontWeight: FontWeight.bold), // Example: Bold for headlines

  titleLarge: TextStyle(fontFamily: 'Almarai', fontSize: 20.0, fontWeight: FontWeight.w700), // Explicitly w700 for Bold

  // Example for bodyLarge using Regular (weight 400)
  bodyLarge: TextStyle(fontFamily: 'Almarai', fontSize: 16.0, fontWeight: FontWeight.w400),

  // Example for bodyMedium using Light (weight 300)
  bodyMedium: TextStyle(fontFamily: 'Almarai', fontSize: 14.0, fontWeight: FontWeight.w300),

  // You can define other styles like subtitle1, subtitle2, button, caption, overline
  // and assign specific Almarai weights:
  // FontWeight.w300 for Light
  // FontWeight.w400 for Regular (or FontWeight.normal)
  // FontWeight.w700 for Bold (or FontWeight.bold)
  // FontWeight.w800 for ExtraBold

  labelLarge: TextStyle(fontFamily: 'Almarai', fontSize: 14.0, fontWeight: FontWeight.w700), // Button text, often bold
);

/// Typography scale ratios for responsive design
class TypographyScale {
  static const double minorSecond = 1.067;
  static const double majorSecond = 1.125;
  static const double minorThird = 1.200;
  static const double majorThird = 1.250;
  static const double perfectFourth = 1.333;
  static const double augmentedFourth = 1.414;
  static const double perfectFifth = 1.500;
  static const double goldenRatio = 1.618;
}
