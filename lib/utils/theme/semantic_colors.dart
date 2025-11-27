import 'dart:ui';

/// Semantic colors for specific UI states
class SemanticColors {
  // Success colors
  static const Color successLight = Color(0xFF4CAF50);
  static const Color successDark = Color(0xFF81C784);

  // Warning colors
  static const Color warningLight = Color(0xFFFF9800);
  static const Color warningDark = Color(0xFFFFB74D);

  // Info colors
  static const Color infoLight = Color(0xFF2196F3);
  static const Color infoDark = Color(0xFF64B5F6);

  // Neutral colors
  static const Color neutralLight = Color(0xFF757575);
  static const Color neutralDark = Color(0xFFBDBDBD);

  /// Gets success color based on brightness
  static Color success(Brightness brightness) {
    return brightness == Brightness.light ? successLight : successDark;
  }

  /// Gets warning color based on brightness
  static Color warning(Brightness brightness) {
    return brightness == Brightness.light ? warningLight : warningDark;
  }

  /// Gets info color based on brightness
  static Color info(Brightness brightness) {
    return brightness == Brightness.light ? infoLight : infoDark;
  }

  /// Gets neutral color based on brightness
  static Color neutral(Brightness brightness) {
    return brightness == Brightness.light ? neutralLight : neutralDark;
  }
}
