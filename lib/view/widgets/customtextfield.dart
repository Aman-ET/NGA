import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  // Required
  final TextEditingController controller;
  final String hintText;

  // State
  final bool obscureText;
  final bool enabled;
  final bool readOnly;

  // Input Configuration
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;

  // Validation
  final String? Function(String?)? validator;

  // Icons
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? iconColor;

  // Styling
  final TextStyle? textStyle;

  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;

  final EdgeInsetsGeometry? contentPadding;

  // Events
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,

    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,

    this.keyboardType = TextInputType.text,
    this.textInputAction,

    this.maxLength,
    this.maxLines,

    this.validator,

    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,

    this.textStyle,

    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,

    this.contentPadding,

    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,

      keyboardType: keyboardType,
      textInputAction: textInputAction,

      maxLength: maxLength,
      maxLines: maxLines,

      validator: validator,

      onChanged: onChanged,
      onTap: onTap,

      style: textStyle,

      decoration: InputDecoration(
        hintText: hintText,

        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: iconColor,
        )
            : null,

        suffixIcon: suffixIcon != null
            ? Icon(
          suffixIcon,
          color: iconColor,
        )
            : null,

        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,

        contentPadding: contentPadding,
      ),
    );
  }
}