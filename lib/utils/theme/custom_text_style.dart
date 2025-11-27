import 'package:flutter/material.dart';
import 'package:ecommerce/utils/theme/text_theme.dart';
import 'package:ecommerce/utils/theme/typography.dart';

/// Creates custom text styles for specific use cases
class CustomTextStyles {
  CustomTextStyles._();
  static const String defaultFontFamily = AppFontFamilies.defaultFontFamily;

  /// Style for error messages
  static TextStyle error(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.error,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.43,
    );
  }

  /// Style for success messages
  static TextStyle success(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.43,
    );
  }

  /// Style for warning messages
  static TextStyle warning(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.tertiary,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.43,
    );
  }

  /// Style for disabled text
  static TextStyle disabled(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurface.withOpacity(0.38),
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.43,
    );
  }

  /// Style for links
  static TextStyle link(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
      fontFamily: fontFamily ?? defaultFontFamily,
      decoration: TextDecoration.underline,
      decorationColor: colorScheme.primary,
      height: 1.43,
    );
  }

  /// Style for overline text (small caps style)
  static TextStyle overline(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      color: colorScheme.onSurfaceVariant,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.6,
    );
  }

  /// Style for captions with emphasis
  static TextStyle captionEmphasis(
    ColorScheme colorScheme, {
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.40,
      color: colorScheme.onSurface,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.33,
    );
  }

  /// Style for code/monospace text
  static TextStyle code(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurface,
      fontFamily: 'Courier New', // Monospace font
      backgroundColor: colorScheme.surfaceVariant,
      height: 1.43,
    );
  }

  /// Style for price/currency display
  static TextStyle price(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: colorScheme.primary,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.22,
    );
  }

  /// Style for badges/chips text
  static TextStyle badge(ColorScheme colorScheme, {String? fontFamily}) {
    return TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.50,
      color: colorScheme.onPrimaryContainer,
      fontFamily: fontFamily ?? defaultFontFamily,
      height: 1.45,
    );
  }
}
