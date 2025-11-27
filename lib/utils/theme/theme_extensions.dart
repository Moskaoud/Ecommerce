import 'package:flutter/material.dart';
import 'app_gradients.dart';
import 'app_shadows.dart';
import 'color_utils.dart';
import 'custom_text_style.dart';
import 'semantic_colors.dart';

/// Extension methods on BuildContext for easy access to theme properties.
///
/// These extensions provide convenient getters for commonly used theme
/// properties, making code more readable and maintainable.
extension ThemeExtensions on BuildContext {
  // =============================================================================
  // THEME GETTERS
  // =============================================================================

  /// Gets the current [ThemeData] from the context
  ThemeData get theme => Theme.of(this);

  /// Gets the current [ColorScheme] from the context
  ColorScheme get colorScheme => theme.colorScheme;

  /// Gets the current [TextTheme] from the context
  TextTheme get textTheme => theme.textTheme;

  /// Gets the current brightness (light/dark mode)
  Brightness get brightness => theme.brightness;

  /// Checks if the current theme is dark mode
  bool get isDarkMode => brightness == Brightness.dark;

  /// Checks if the current theme is light mode
  bool get isLightMode => brightness == Brightness.light;

  // =============================================================================
  // COLOR SCHEME SHORTCUTS
  // =============================================================================

  // Primary colors
  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  // Secondary colors
  Color get secondary => colorScheme.secondary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get secondaryContainer => colorScheme.secondaryContainer;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  // Tertiary colors
  Color get tertiary => colorScheme.tertiary;
  Color get onTertiary => colorScheme.onTertiary;
  Color get tertiaryContainer => colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;

  // Error colors
  Color get error => colorScheme.error;
  Color get onError => colorScheme.onError;
  Color get errorContainer => colorScheme.errorContainer;
  Color get onErrorContainer => colorScheme.onErrorContainer;

  // Surface colors
  Color get surface => colorScheme.surface;
  Color get onSurface => colorScheme.onSurface;
  Color get surfaceVariant => colorScheme.surfaceVariant;
  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;
  Color get surfaceTint => colorScheme.surfaceTint;

  // Background colors (deprecated in Material 3 but kept for compatibility)
  Color get background => colorScheme.background;
  Color get onBackground => colorScheme.onBackground;

  // Outline colors
  Color get outline => colorScheme.outline;
  Color get outlineVariant => colorScheme.outlineVariant;

  // Other colors
  Color get shadow => colorScheme.shadow;
  Color get scrim => colorScheme.scrim;
  Color get inverseSurface => colorScheme.inverseSurface;
  Color get onInverseSurface => colorScheme.onInverseSurface;
  Color get inversePrimary => colorScheme.inversePrimary;

  // =============================================================================
  // TEXT STYLE SHORTCUTS
  // =============================================================================

  // Display styles
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;

  // Headline styles
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  // Title styles
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;

  // Body styles
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  // Label styles
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;

  // =============================================================================
  // CONVENIENT TEXT STYLE ALIASES
  // =============================================================================

  /// Main heading style (maps to headlineLarge)
  TextStyle? get heading => headlineLarge;

  /// Subheading style (maps to headlineMedium)
  TextStyle? get subheading => headlineMedium;

  /// Title style for cards, lists, etc.
  TextStyle? get title => titleLarge;

  /// Subtitle style
  TextStyle? get subtitle => titleMedium;

  /// Default body text style
  TextStyle? get body => bodyMedium;

  /// Caption style for small text
  TextStyle? get caption => bodySmall;

  /// Button text style
  TextStyle? get button => labelLarge;

  /// Overline style for small labels
  TextStyle? get overline => labelSmall;

  // =============================================================================
  // SEMANTIC COLOR SHORTCUTS
  // =============================================================================

  /// Success color based on current theme brightness
  Color get successColor => SemanticColors.success(brightness);

  /// Warning color based on current theme brightness
  Color get warningColor => SemanticColors.warning(brightness);

  /// Info color based on current theme brightness
  Color get infoColor => SemanticColors.info(brightness);

  /// Neutral color based on current theme brightness
  Color get neutralColor => SemanticColors.neutral(brightness);

  // =============================================================================
  // CUSTOM TEXT STYLES
  // =============================================================================

  /// Error text style
  TextStyle get errorTextStyle =>
      CustomTextStyles.error(colorScheme);

  /// Success text style
  TextStyle get successTextStyle =>
      CustomTextStyles.success(colorScheme);

  /// Warning text style
  TextStyle get warningTextStyle =>
      CustomTextStyles.warning(colorScheme);

  /// Disabled text style
  TextStyle get disabledTextStyle =>
      CustomTextStyles.disabled(colorScheme);

  /// Link text style
  TextStyle get linkTextStyle =>
      CustomTextStyles.link(colorScheme);

  /// Code text style
  TextStyle get codeTextStyle =>
      CustomTextStyles.code(colorScheme);

  /// Price text style
  TextStyle get priceTextStyle =>
      CustomTextStyles.price(colorScheme);

  /// Badge text style
  TextStyle get badgeTextStyle =>
      CustomTextStyles.badge(colorScheme);

  // =============================================================================
  // GRADIENT SHORTCUTS
  // =============================================================================

  /// Primary gradient based on current theme brightness
  LinearGradient get primaryGradient =>
      AppGradients.primary(brightness);

  /// Secondary gradient based on current theme brightness
  LinearGradient get secondaryGradient =>
      AppGradients.secondary(brightness);

  /// Surface gradient based on current theme brightness
  LinearGradient get surfaceGradient => AppGradients.surface(brightness);

  /// Shimmer gradient for loading states
  LinearGradient get shimmerGradient => AppGradients.shimmer(brightness);

  // =============================================================================
  // SHADOW SHORTCUTS
  // =============================================================================
  /// Gets shadow for elevation level 1
  List<BoxShadow> get elevation1 => AppShadows.elevation(1, brightness);

  /// Gets shadow for elevation level 2
  List<BoxShadow> get elevation2 => AppShadows.elevation(2, brightness);

  /// Gets shadow for elevation level 3
  List<BoxShadow> get elevation3 => AppShadows.elevation(3, brightness);

  /// Gets shadow for elevation level 4
  List<BoxShadow> get elevation4 => AppShadows.elevation(4, brightness);

  // =============================================================================
  // RESPONSIVE DESIGN HELPERS
  // =============================================================================

  /// Gets the screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Gets the screen width
  double get screenWidth => screenSize.width;

  /// Gets the screen height
  double get screenHeight => screenSize.height;

  /// Checks if the screen is considered small (width < 600)
  bool get isSmallScreen => screenWidth < 600;

  /// Checks if the screen is considered medium (600 <= width < 1024)
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1024;

  /// Checks if the screen is considered large (width >= 1024)
  bool get isLargeScreen => screenWidth >= 1024;

  /// Gets the device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Gets the text scale factor
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// Gets the system padding (safe area)
  EdgeInsets get systemPadding => MediaQuery.of(this).padding;

  /// Gets the view insets (keyboard height, etc.)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  // =============================================================================
  // NAVIGATION HELPERS
  // =============================================================================

  /// Gets the Navigator from the context
  NavigatorState get navigator => Navigator.of(this);

  /// Pushes a new route
  Future<T?> push<T extends Object?>(Route<T> route) => navigator.push(route);

  /// Pushes a new named route
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) => navigator.pushNamed(routeName, arguments: arguments);

  /// Pops the current route
  void pop<T extends Object?>([T? result]) => navigator.pop(result);

  /// Checks if can pop
  bool get canPop => navigator.canPop();

  // =============================================================================
  // UTILITY METHODS
  // =============================================================================

  /// Shows a snackbar with the given message
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: bodyMedium?.copyWith(color: textColor)),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Shows an error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: errorContainer,
      textColor: onErrorContainer,
    );
  }

  /// Shows a success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: successColor,
      textColor: Colors.white,
    );
  }

  /// Shows a warning snackbar
  void showWarningSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: warningColor,
      textColor: Colors.white,
    );
  }

  /// Hides the keyboard
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  /// Gets the current focus node
  FocusNode? get currentFocus => FocusScope.of(this).focusedChild;

  /// Requests focus for a widget
  void requestFocus(FocusNode focusNode) {
    FocusScope.of(this).requestFocus(focusNode);
  }
}

/// Extension methods on TextStyle for easy customization
extension TextStyleExtensions on TextStyle? {
  /// Creates a copy with bold weight
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.bold);

  /// Creates a copy with semi-bold weight
  TextStyle? get semiBold => this?.copyWith(fontWeight: FontWeight.w600);

  /// Creates a copy with medium weight
  TextStyle? get medium => this?.copyWith(fontWeight: FontWeight.w500);

  /// Creates a copy with light weight
  TextStyle? get light => this?.copyWith(fontWeight: FontWeight.w300);

  /// Creates a copy with italic style
  TextStyle? get italic => this?.copyWith(fontStyle: FontStyle.italic);

  /// Creates a copy with underline decoration
  TextStyle? get underline =>
      this?.copyWith(decoration: TextDecoration.underline);

  /// Creates a copy with line-through decoration
  TextStyle? get lineThrough =>
      this?.copyWith(decoration: TextDecoration.lineThrough);

  /// Creates a copy with the specified color
  TextStyle? withColor(Color color) => this?.copyWith(color: color);

  /// Creates a copy with the specified opacity
  TextStyle? withOpacity(double opacity) =>
      this?.copyWith(color: this?.color?.withOpacity(opacity));

  /// Creates a copy with the specified font size
  TextStyle? withSize(double fontSize) => this?.copyWith(fontSize: fontSize);

  /// Creates a copy with the specified letter spacing
  TextStyle? withLetterSpacing(double letterSpacing) =>
      this?.copyWith(letterSpacing: letterSpacing);

  /// Creates a copy with the specified line height
  TextStyle? withHeight(double height) => this?.copyWith(height: height);
}

/// Extension methods on Color for easy manipulation
extension ColorExtensions on Color {
  /// Lightens the color by the given amount
  Color lighten([double amount = 0.1]) => ColorUtils.lighten(this, amount);

  /// Darkens the color by the given amount
  Color darken([double amount = 0.1]) => ColorUtils.darken(this, amount);

  /// Increases saturation of the color
  Color saturate([double amount = 0.1]) => ColorUtils.saturate(this, amount);

  /// Decreases saturation of the color
  Color desaturate([double amount = 0.1]) =>
      ColorUtils.desaturate(this, amount);

  /// Blends this color with another color
  Color blendWith(Color other, [double ratio = 0.5]) =>
      ColorUtils.blend(this, other, ratio);

  /// Gets the contrast ratio with another color
  double contrastWith(Color other) => ColorUtils.contrastRatio(this, other);

  /// Checks if this color is light
  bool get isLight => ColorUtils.isLight(this);

  /// Checks if this color is dark
  bool get isDark => !isLight;
  /// Gets a contrasting color (black or white) for text
  Color get contrastingColor => ColorUtils.getContrastingColor(this);
}

/// Extension methods on Widget for easy styling
extension WidgetExtensions on Widget {
  /// Wraps the widget in a Container with padding
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  /// Wraps the widget in a Container with symmetric padding
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Wraps the widget in a Container with specific padding
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  /// Wraps the widget in a Center
  Widget get center => Center(child: this);

  /// Wraps the widget in an Expanded
  Widget get expanded => Expanded(child: this);

  /// Wraps the widget in a Flexible
  Widget get flexible => Flexible(child: this);

  /// Wraps the widget in a Card
  Widget get card => Card(child: this);

  /// Wraps the widget in a Material with InkWell for tap effects
  Widget onTap(VoidCallback onTap) => Material(
    color: Colors.transparent,
    child: InkWell(onTap: onTap, child: this),
  );
}
