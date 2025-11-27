import 'package:flutter/material.dart';

/// Gradient definitions for backgrounds and decorations
class AppGradients {
  // Primary gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1976D2), Color(0xFF1565C0)],
  );

  static const LinearGradient primaryGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFA6C8FF), Color(0xFF64B5F6)],
  );

  // Secondary gradients
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00695C), Color(0xFF004D40)],
  );

  static const LinearGradient secondaryGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4DB6AC), Color(0xFF26A69A)],
  );

  // Surface gradients
  static const LinearGradient surfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFBFF), Color(0xFFF5F5F5)],
  );

  static const LinearGradient surfaceGradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF141218), Color(0xFF1C1B1F)],
  );

  // Accent gradients
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE65100), Color(0xFFFF6B35)],
  );

  // Shimmer gradient for loading states
  static const LinearGradient shimmerGradient = LinearGradient(
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient shimmerGradientDark = LinearGradient(
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    colors: [Color(0xFF2C2C2C), Color(0xFF3A3A3A), Color(0xFF2C2C2C)],
    stops: [0.0, 0.5, 1.0],
  );

  /// Gets primary gradient based on brightness
  static LinearGradient primary(Brightness brightness) {
    return brightness == Brightness.light
        ? primaryGradient
        : primaryGradientDark;
  }

  /// Gets secondary gradient based on brightness
  static LinearGradient secondary(Brightness brightness) {
    return brightness == Brightness.light
        ? secondaryGradient
        : secondaryGradientDark;
  }

  /// Gets surface gradient based on brightness
  static LinearGradient surface(Brightness brightness) {
    return brightness == Brightness.light
        ? surfaceGradient
        : surfaceGradientDark;
  }

  /// Gets shimmer gradient based on brightness
  static LinearGradient shimmer(Brightness brightness) {
    return brightness == Brightness.light
        ? shimmerGradient
        : shimmerGradientDark;
  }
}
