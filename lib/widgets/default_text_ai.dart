import 'package:flutter/material.dart';

/// A customizable text widget that provides common text variants
/// and consistent styling throughout the application.
class DefaultTextAi extends StatelessWidget {
  final String data;
  final DefaultTextVariant variant;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool? softWrap;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const DefaultTextAi(
      this.data, {
        super.key,
        this.variant = DefaultTextVariant.body,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
        this.softWrap,
        this.color,
        this.fontWeight,
        this.fontSize,
      });

  // Named constructors for common use cases
  const DefaultTextAi.title(
      this.data, {
        super.key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
        this.softWrap,
        this.color,
        this.fontWeight,
        this.fontSize,
      }) : variant = DefaultTextVariant.title;

  const DefaultTextAi.subtitle(
      this.data, {
        super.key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
        this.softWrap,
        this.color,
        this.fontWeight,
        this.fontSize,
      }) : variant = DefaultTextVariant.subtitle;

  const DefaultTextAi.caption(
      this.data, {
        super.key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
        this.softWrap,
        this.color,
        this.fontWeight,
        this.fontSize,
      }) : variant = DefaultTextVariant.caption;

  const DefaultTextAi.error(
      this.data, {
        super.key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
        this.softWrap,
        this.fontWeight,
        this.fontSize,
      }) : variant = DefaultTextVariant.error,
        color = null; // Error color is handled by variant

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // Get base style based on variant
    TextStyle? baseStyle = switch (variant) {
      DefaultTextVariant.title => textTheme.titleLarge,
      DefaultTextVariant.subtitle => textTheme.titleMedium,
      DefaultTextVariant.body => textTheme.bodyMedium,
      DefaultTextVariant.caption => textTheme.bodySmall,
      DefaultTextVariant.error => textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.error,
      ),
    };

    // Build the effective style by layering modifications
    TextStyle? effectiveStyle = baseStyle;

    // Apply individual property overrides
    if (color != null || fontWeight != null || fontSize != null) {
      effectiveStyle = effectiveStyle?.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
    }

    // Finally merge with custom style if provided
    if (style != null) {
      effectiveStyle = effectiveStyle?.merge(style) ?? style;
    }

    return Text(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      softWrap: softWrap,
    );
  }
}

enum DefaultTextVariant {
  title,
  subtitle,
  body,
  caption,
  error,
}

// Extension for even more convenience
extension DefaultTextExtensions on String {
  Widget get text => DefaultTextAi(this);
  Widget get title => DefaultTextAi.title(this);
  Widget get subtitle => DefaultTextAi.subtitle(this);
  Widget get caption => DefaultTextAi.caption(this);
  Widget get error => DefaultTextAi.error(this);
}