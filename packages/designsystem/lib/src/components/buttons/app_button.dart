import 'package:flutter/material.dart';

/// App button sizes
enum AppButtonSize {
  /// Small button
  small,

  /// Medium button
  medium,

  /// Large button
  large,
}

/// App button variants
enum AppButtonVariant {
  /// Primary button with filled background
  primary,

  /// Secondary button with outlined border
  secondary,

  /// Tertiary button with minimal styling
  tertiary,
}

/// App button state
enum AppButtonState {
  /// Normal enabled state
  enabled,

  /// Loading state
  loading,

  /// Disabled state
  disabled,
}

/// A customizable button component that follows the app's design system
class AppButton extends StatelessWidget {
  /// Creates an app button with customizable appearance and behavior
  const AppButton({
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.state = AppButtonState.enabled,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.fullWidth = false,
    this.borderRadius,
    super.key,
  });

  /// Primary variant button constructor
  factory AppButton.primary({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    AppButtonState state = AppButtonState.enabled,
    Widget? icon,
    IconPosition iconPosition = IconPosition.left,
    bool fullWidth = false,
    BorderRadius? borderRadius,
    Key? key,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    size: size,
    state: state,
    icon: icon,
    iconPosition: iconPosition,
    fullWidth: fullWidth,
    borderRadius: borderRadius,
    key: key,
  );

  /// Secondary variant button constructor
  factory AppButton.secondary({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    AppButtonState state = AppButtonState.enabled,
    Widget? icon,
    IconPosition iconPosition = IconPosition.left,
    bool fullWidth = false,
    BorderRadius? borderRadius,
    Key? key,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.secondary,
    size: size,
    state: state,
    icon: icon,
    iconPosition: iconPosition,
    fullWidth: fullWidth,
    borderRadius: borderRadius,
    key: key,
  );

  /// Tertiary variant button constructor
  factory AppButton.tertiary({
    required String label,
    VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    AppButtonState state = AppButtonState.enabled,
    Widget? icon,
    IconPosition iconPosition = IconPosition.left,
    bool fullWidth = false,
    BorderRadius? borderRadius,
    Key? key,
  }) => AppButton(
    label: label,
    onPressed: onPressed,
    variant: AppButtonVariant.tertiary,
    size: size,
    state: state,
    icon: icon,
    iconPosition: iconPosition,
    fullWidth: fullWidth,
    borderRadius: borderRadius,
    key: key,
  );

  /// Button text label
  final String label;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button visual variant
  final AppButtonVariant variant;

  /// Button size
  final AppButtonSize size;

  /// Button state (enabled, loading, disabled)
  final AppButtonState state;

  /// Optional icon to display alongside text
  final Widget? icon;

  /// Position of the icon relative to the text
  final IconPosition iconPosition;

  /// Whether the button should take up the full width of its container
  final bool fullWidth;

  /// Custom border radius (defaults to rounded corners based on size)
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Determine button properties based on variant, size, and state
    final style = _getButtonStyle(theme);
    final isDisabled = state == AppButtonState.disabled;
    final isLoading = state == AppButtonState.loading;

    // Determine padding based on size
    final padding = _getPadding();

    // Determine text style based on size
    final textStyle = _getTextStyle(theme);

    // Base button content (will be wrapped with conditional widgets)
    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildButtonContent(textStyle, isLoading),
    );

    // Apply full width if needed
    if (fullWidth) {
      buttonContent = SizedBox(width: double.infinity, child: buttonContent);
    }

    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ElevatedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: style,
          child: Padding(padding: padding, child: buttonContent),
        ),
      ),
    );
  }

  List<Widget> _buildButtonContent(TextStyle textStyle, bool isLoading) {
    final children = <Widget>[];

    // Add icon if it exists and is positioned to the left
    if (icon != null && iconPosition == IconPosition.left) {
      children
        ..add(icon!)
        ..add(const SizedBox(width: 8));
    }

    // Show loading indicator or text
    if (isLoading) {
      children.add(
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: _getTextColor(),
          ),
        ),
      );
    } else {
      children.add(Text(label, style: textStyle));
    }

    // Add icon if it exists and is positioned to the right
    if (icon != null && iconPosition == IconPosition.right) {
      children
        ..add(const SizedBox(width: 8))
        ..add(icon!);
    }

    return children;
  }

  ButtonStyle _getButtonStyle(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    // Default border radius based on size
    final defaultRadius = _getDefaultBorderRadius();
    final borderR = borderRadius ?? defaultRadius;

    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: borderR),
          elevation: 0,
        );

      case AppButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: borderR,
            side: BorderSide(color: colorScheme.primary),
          ),
          elevation: 0,
        );

      case AppButtonVariant.tertiary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: borderR),
          elevation: 0,
        );
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return Colors.white;
      case AppButtonVariant.secondary:
      case AppButtonVariant.tertiary:
        return Colors.blue; // Use theme color in actual implementation
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    }
  }

  TextStyle _getTextStyle(ThemeData theme) {
    final textTheme = theme.textTheme;

    switch (size) {
      case AppButtonSize.small:
        return textTheme.labelSmall!;
      case AppButtonSize.medium:
        return textTheme.labelMedium!;
      case AppButtonSize.large:
        return textTheme.labelLarge!;
    }
  }

  BorderRadius _getDefaultBorderRadius() {
    double radius;

    switch (size) {
      case AppButtonSize.small:
        radius = 6;
      case AppButtonSize.medium:
        radius = 8;
      case AppButtonSize.large:
        radius = 10;
    }

    return BorderRadius.circular(radius);
  }
}

/// Icon position enum for button
enum IconPosition {
  /// Icon appears before text
  left,

  /// Icon appears after text
  right,
}
