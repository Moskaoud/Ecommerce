import 'package:flutter/material.dart';

/// Shadow definitions for elevation and depth
class AppShadows {
  // Light theme shadows
  static const List<BoxShadow> elevation1Light = [
    BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const List<BoxShadow> elevation2Light = [
    BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1), blurRadius: 2),
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 4),
  ];

  static const List<BoxShadow> elevation3Light = [
    BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1), blurRadius: 3),
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 4), blurRadius: 8),
  ];

  static const List<BoxShadow> elevation4Light = [
    BoxShadow(color: Color(0x1F000000), offset: Offset(0, 2), blurRadius: 4),
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 8), blurRadius: 12),
  ];

  // Dark theme shadows (more subtle)
  static const List<BoxShadow> elevation1Dark = [
    BoxShadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const List<BoxShadow> elevation2Dark = [
    BoxShadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2),
    BoxShadow(color: Color(0x2E000000), offset: Offset(0, 2), blurRadius: 4),
  ];

  static const List<BoxShadow> elevation3Dark = [
    BoxShadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 3),
    BoxShadow(color: Color(0x2E000000), offset: Offset(0, 4), blurRadius: 8),
  ];

  static const List<BoxShadow> elevation4Dark = [
    BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 4),
    BoxShadow(color: Color(0x2E000000), offset: Offset(0, 8), blurRadius: 12),
  ];

  /// Gets shadow for elevation level based on brightness
  static List<BoxShadow> elevation(int level, Brightness brightness) {
    final shadows = brightness == Brightness.light
        ? [elevation1Light, elevation2Light, elevation3Light, elevation4Light]
        : [elevation1Dark, elevation2Dark, elevation3Dark, elevation4Dark];

    return level > 0 && level <= 4 ? shadows[level - 1] : [];
  }
}
