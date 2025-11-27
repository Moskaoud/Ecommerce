import 'package:flutter/material.dart';

/// A customizable text widget for the application.
///
/// This widget wraps the standard [Text] widget and provides
/// convenient access to common styling properties.
class DefaultText extends StatelessWidget {
  /// The text to display.
  final String data;

  /// The style to use for the text.
  /// If null, the default [TextTheme.bodyMedium] from the current [Theme] is used.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  final int? maxLines;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.text.DefaultTextStyle.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro flutter.widgets.text.DefaultTextStyle.locale}
  final Locale? locale;

  /// An alternative semantics label for this text.
  final String? semanticsLabel;

  /// The color to use when painting the selection.
  final Color? selectionColor;

  const DefaultText(
      this.data, {
        super.key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
        this.softWrap,
        this.strutStyle,
        this.textWidthBasis,
        this.locale,
        this.semanticsLabel,
        this.selectionColor,
      });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyMedium;
    // Merge the provided style with the default theme style
    // This allows overriding specific properties while inheriting others
    final effectiveTextStyle = defaultTextStyle?.merge(style) ?? style;

    return Text(
      data,
      style: effectiveTextStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      locale: locale,
      semanticsLabel: semanticsLabel,
      selectionColor: selectionColor,
    );
  }
}
