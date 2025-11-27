import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils/theme/app_color_scheme.dart';
import '/utils/theme/brand_colors.dart';
import 'text_theme.dart';

/// Main theme configuration for the application.
///
/// This class provides static methods to create light and dark themes
/// with consistent styling across the entire app.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  /// Creates the light theme for the application
  static ThemeData get lightTheme {
    return _createTheme(
      colorScheme: AppColorScheme.lightColorScheme,
      brightness: Brightness.light,
    );
  }

  /// Creates the dark theme for the application
  static ThemeData get darkTheme {
    return _createTheme(
      colorScheme: AppColorScheme.darkColorScheme,
      brightness: Brightness.dark,
    );
  }

  /// Creates a custom theme with specified parameters
  static ThemeData createCustomTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
    String? fontFamily,
  }) {
    return _createTheme(
      colorScheme: colorScheme,
      brightness: brightness,
      fontFamily: fontFamily,
    );
  }

  /// Creates a ThemeData based on system brightness and custom colors.
  static ThemeData getAppTheme() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;

    return _createTheme(
      colorScheme: AppColorScheme.createColorScheme(
        brightness: brightness,
        seedColor: BrandColors.primary,
        secondary: BrandColors.secondary,
        tertiary: BrandColors.tertiary,
      ),
      brightness: brightness,
    );
  }

  /// Internal method to create a theme with the given parameters
  static ThemeData _createTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
    String? fontFamily,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,

      // Text theme
      textTheme: AppTextTheme.createTextTheme(
        colorScheme: colorScheme,
        fontFamily: fontFamily,
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        titleTextStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).titleLarge,
      ),

      // Card theme
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextTheme.createTextTheme(
            colorScheme: colorScheme,
            fontFamily: fontFamily,
          ).labelLarge,
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: colorScheme.outline),
          textStyle: AppTextTheme.createTextTheme(
            colorScheme: colorScheme,
            fontFamily: fontFamily,
          ).labelLarge,
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextTheme.createTextTheme(
            colorScheme: colorScheme,
            fontFamily: fontFamily,
          ).labelLarge,
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 6,
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        shape: const CircleBorder(),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).labelSmall,
        unselectedLabelStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).labelSmall,
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceVariant,
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        secondaryLabelStyle: TextStyle(color: colorScheme.onSecondaryContainer),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).headlineSmall,
        contentTextStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).bodyMedium,
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        titleTextStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).bodyLarge,
        subtitleTextStyle: AppTextTheme.createTextTheme(
          colorScheme: colorScheme,
          fontFamily: fontFamily,
        ).bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
      ),
    );
  }
}
