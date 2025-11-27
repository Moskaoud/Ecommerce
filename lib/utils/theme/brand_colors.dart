import 'package:flutter/material.dart';

/// Predefined brand color palettes
class BrandColors {
  // Define primary, secondary, and tertiary colors using the palettes
  static const MaterialColor primary = purple;
  // static const MaterialColor primary = blue;
  static const MaterialColor secondary = teal;
  static const MaterialColor tertiary = orange;

  // Blue palette
  static const MaterialColor blue = MaterialColor(0xFF1976D2, <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  });

  // Teal palette
  static const MaterialColor teal = MaterialColor(0xFF00695C, <int, Color>{
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00695C),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  });

  // Orange palette
  static const MaterialColor orange = MaterialColor(0xFFE65100, <int, Color>{
    50: Color(0xFFFFF3E0),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(0xFFFF9800),
    600: Color(0xFFFB8C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  });

  // Red palette for errors
  static const MaterialColor red = MaterialColor(0xFFD32F2F, <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFF44336),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });

  // Green palette for success
  static const MaterialColor green = MaterialColor(0xFF388E3C, <int, Color>{
    50: Color(0xFFE8F5E8),
    100: Color(0xFFC8E6C9),
    200: Color(0xFFA5D6A7),
    300: Color(0xFF81C784),
    400: Color(0xFF66BB6A),
    500: Color(0xFF4CAF50),
    600: Color(0xFF43A047),
    700: Color(0xFF388E3C),
    800: Color(0xFF2E7D32),
    900: Color(0xFF1B5E20),
  });

  // Yellow palette for warnings
  static const MaterialColor yellow = MaterialColor(0xFFFBC02D, <int, Color>{
    50: Color(0xFFFFFDE7),
    100: Color(0xFFFFF9C4),
    200: Color(0xFFFFF59D),
    300: Color(0xFFFFF176),
    400: Color(0xFFFFEE58),
    500: Color(0xFFFFEB3B),
    600: Color(0xFFFDD835),
    700: Color(0xFFFBC02D),
    800: Color(0xFFF9A825),
    900: Color(0xFFF57F17),
  });

  // Purple palette for primary color
  static const MaterialColor purple = MaterialColor(0xFF8E6CEF, <int, Color>{
    50: Color(0xFFF3EFFF),
    100: Color(0xFFE0D8FE),
    200: Color(0xFFCCBFFD),
    300: Color(0xFFB8A5FC),
    400: Color(0xFFA790FB),
    500: Color(0xFF967CFB),
    600: Color(0xFF8E6CEF), // Primary color
    700: Color(0xFF7D59E0),
    800: Color(0xFF6C46D1),
    900: Color(0xFF5330B8),
  });


}
