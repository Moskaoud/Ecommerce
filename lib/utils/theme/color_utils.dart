import 'package:flutter/material.dart';

/// Color utilities for manipulating colors
class ColorUtils {
  /// Lightens a color by the given amount (0.0 to 1.0)
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darkens a color by the given amount (0.0 to 1.0)
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Adjusts the saturation of a color
  static Color saturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final saturation = (hsl.saturation + amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Desaturates a color
  static Color desaturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final saturation = (hsl.saturation - amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Adds opacity to a color
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity.clamp(0.0, 1.0));
  }

  /// Creates a color with alpha channel
  static Color withAlpha(Color color, int alpha) {
    return color.withAlpha(alpha.clamp(0, 255));
  }

  /// Blends two colors together
  static Color blend(Color color1, Color color2, double ratio) {
    return Color.lerp(color1, color2, ratio.clamp(0.0, 1.0)) ?? color1;
  }

  /// Gets the contrast ratio between two colors
  static double contrastRatio(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();
    final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final darker = luminance1 > luminance2 ? luminance2 : luminance1;
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Determines if a color is light or dark
  static bool isLight(Color color) {
    return color.computeLuminance() > 0.5;
  }

  /// Gets a contrasting color (black or white) for text on the given background
  static Color getContrastingColor(Color backgroundColor) {
    return isLight(backgroundColor) ? Colors.black : Colors.white;
  }
}
