import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable text field component that follows the app's design system
class AppTextField extends StatelessWidget {
  /// Creates a text field with customizable appearance and behavior
  const AppTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.borderRadius,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.style,
  }) : assert(
         initialValue == null || controller == null,
         'Cannot provide both an initialValue and a controller',
       );

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The initial value of the text field.
  final String? initialValue;

  /// Text that describes the input field.
  final String? labelText;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that provides guidance to the user.
  final String? helperText;

  /// Text that appears when validation fails.
  final String? errorText;

  /// An icon that appears before the input field.
  final Widget? prefixIcon;

  /// An icon that appears after the input field.
  final Widget? suffixIcon;

  /// Whether to hide the text being edited.
  final bool obscureText;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// Whether the text field is enabled.
  final bool enabled;

  /// The maximum number of lines for the text to span.
  final int maxLines;

  /// The minimum number of lines for the text to span.
  final int? minLines;

  /// The maximum number of characters to allow in the text field.
  final int? maxLength;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The action to take when the user submits the text field.
  final TextInputAction? textInputAction;

  /// Optional input validation and formatting.
  final List<TextInputFormatter>? inputFormatters;

  /// Called when the user changes the text in the field.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the text field.
  final ValueChanged<String>? onSubmitted;

  /// Called when the user taps on the text field.
  final VoidCallback? onTap;

  /// Called to validate the text during form submission.
  final FormFieldValidator<String>? validator;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Whether this text field should focus itself if nothing else is focused.
  final bool autofocus;

  /// Whether to enable autocorrection.
  final bool autocorrect;

  /// Whether to show input suggestions as the user types.
  final bool enableSuggestions;

  /// The border radius of the text field.
  final BorderRadius? borderRadius;

  /// The padding inside the text field.
  final EdgeInsetsGeometry? contentPadding;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  final TextCapitalization textCapitalization;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// How the text should be aligned vertically.
  final TextAlignVertical? textAlignVertical;

  /// The style to use for the text being edited.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultBorderRadius = BorderRadius.circular(8);
    final effectiveBorderRadius = borderRadius ?? defaultBorderRadius;

    const defaultContentPadding = EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    );
    final effectiveContentPadding = contentPadding ?? defaultContentPadding;

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: effectiveContentPadding,
        border: OutlineInputBorder(borderRadius: effectiveBorderRadius),
        enabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        filled: true,
        fillColor:
            enabled
                ? (readOnly
                    ? colorScheme.surfaceContainerHighest
                    : colorScheme.surface)
                : colorScheme.surfaceContainerHighest.withAlpha(128),
      ),
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      validator: validator,
      focusNode: focusNode,
      autofocus: autofocus,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      style: style,
    );
  }
}
