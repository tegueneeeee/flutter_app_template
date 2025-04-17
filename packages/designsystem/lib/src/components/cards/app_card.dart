import 'package:flutter/material.dart';

/// App card elevation levels
enum CardElevation {
  /// No elevation (flat)
  flat,

  /// Low elevation (subtle shadow)
  low,

  /// Medium elevation (noticeable shadow)
  medium,

  /// High elevation (prominent shadow)
  high,
}

/// A customizable card component that follows the app's design system
class AppCard extends StatelessWidget {
  /// Creates a card with customizable appearance
  const AppCard({
    required this.child,
    super.key,
    this.onTap,
    this.padding,
    this.margin,
    this.borderRadius,
    this.elevation = CardElevation.medium,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  });

  /// The card's content.
  final Widget child;

  /// Called when the user taps the card.
  final VoidCallback? onTap;

  /// The amount of space to inset the card's [child].
  final EdgeInsetsGeometry? padding;

  /// The amount of space to surround the card.
  final EdgeInsetsGeometry? margin;

  /// The border radius of the card.
  final BorderRadius? borderRadius;

  /// The elevation of the card, which determines the shadow appearance.
  final CardElevation elevation;

  /// The color of the card's background.
  final Color? backgroundColor;

  /// The color of the card's border.
  final Color? borderColor;

  /// The card's width.
  final double? width;

  /// The card's height.
  final double? height;

  /// How to clip the card's content.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultBorderRadius = BorderRadius.circular(12);
    final effectiveBorderRadius = borderRadius ?? defaultBorderRadius;

    const defaultPadding = EdgeInsets.all(16);
    final effectivePadding = padding ?? defaultPadding;

    const defaultMargin = EdgeInsets.zero;
    final effectiveMargin = margin ?? defaultMargin;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.surface;

    final shadowElevation = _getElevation();

    final borderSide =
        borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none;

    final cardChild = Container(
      width: width,
      height: height,
      padding: effectivePadding,
      child: child,
    );

    return Card(
      margin: effectiveMargin,
      elevation: shadowElevation,
      shape: RoundedRectangleBorder(
        borderRadius: effectiveBorderRadius,
        side: borderSide,
      ),
      clipBehavior: clipBehavior,
      color: effectiveBackgroundColor,
      child:
          onTap != null
              ? InkWell(
                onTap: onTap,
                borderRadius: effectiveBorderRadius,
                child: cardChild,
              )
              : cardChild,
    );
  }

  double _getElevation() {
    switch (elevation) {
      case CardElevation.flat:
        return 0;
      case CardElevation.low:
        return 1;
      case CardElevation.medium:
        return 2;
      case CardElevation.high:
        return 4;
    }
  }
}

/// A card with a header section
class AppHeaderCard extends StatelessWidget {
  /// Creates a card with a header and content section
  const AppHeaderCard({
    required this.title,
    required this.content,
    super.key,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.divider = true,
    this.padding,
    this.margin,
    this.borderRadius,
    this.elevation = CardElevation.medium,
    this.backgroundColor,
    this.borderColor,
    this.headerBackgroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  });

  /// The title text to display in the header.
  final String title;

  /// Optional subtitle text to display in the header.
  final String? subtitle;

  /// Widget to display before the title in the header.
  final Widget? leading;

  /// Widget to display after the title in the header.
  final Widget? trailing;

  /// The card's content.
  final Widget content;

  /// Called when the user taps the card.
  final VoidCallback? onTap;

  /// Whether to show a divider between header and content.
  final bool divider;

  /// The amount of space to inset the card's content.
  final EdgeInsetsGeometry? padding;

  /// The amount of space to surround the card.
  final EdgeInsetsGeometry? margin;

  /// The border radius of the card.
  final BorderRadius? borderRadius;

  /// The elevation of the card, which determines the shadow appearance.
  final CardElevation elevation;

  /// The color of the card's background.
  final Color? backgroundColor;

  /// The color of the card's border.
  final Color? borderColor;

  /// The color of the header section's background.
  final Color? headerBackgroundColor;

  /// The style to use for the title.
  final TextStyle? titleStyle;

  /// The style to use for the subtitle.
  final TextStyle? subtitleStyle;

  /// The card's width.
  final double? width;

  /// The card's height.
  final double? height;

  /// How to clip the card's content.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    const defaultPadding = EdgeInsets.all(16);
    final effectivePadding = padding ?? defaultPadding;

    final headerColor =
        headerBackgroundColor ?? colorScheme.surfaceContainerHighest;

    final effectiveTitleStyle = titleStyle ?? textTheme.titleMedium;
    final effectiveSubtitleStyle =
        subtitleStyle ??
        textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant.withAlpha(204),
        );

    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      margin: margin,
      borderRadius: borderRadius,
      elevation: elevation,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      width: width,
      height: height,
      clipBehavior: clipBehavior,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            color: headerColor,
            padding: effectivePadding,
            child: Row(
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 16)],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: effectiveTitleStyle),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(subtitle!, style: effectiveSubtitleStyle),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[const SizedBox(width: 16), trailing!],
              ],
            ),
          ),

          // Optional divider
          if (divider) const Divider(height: 1, thickness: 1),

          // Content section
          Padding(padding: effectivePadding, child: content),
        ],
      ),
    );
  }
}
