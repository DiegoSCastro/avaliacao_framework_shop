import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function onChanged;
  final bool obscure;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool autofocus;
  const CustomTextField({
    Key? key,
    required this.onChanged,
    this.label = '',
    this.obscure = false,
    this.errorText,
    this.keyboardType,
    this.initialValue,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      style: AppTextStyles.textFieldGreen,
      initialValue: initialValue,
      keyboardType: keyboardType,
      cursorColor: AppColors.green,
      obscureText: obscure,
      onChanged: onChanged as void Function(String),
      decoration: InputDecoration(
        errorText: errorText,
        labelText: label,
        enabledBorder: _enableBorder(context, 6),
        errorBorder: _buildErrorBorder(context, 6),
        focusedErrorBorder: _buildErrorBorder(context, 6),
        focusedBorder: _buildFocusedBorder(context, 6),
        hoverColor: AppColors.green,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.green,
        ),
      ),
    );
  }
}

OutlineInputBorder _buildErrorBorder(
    BuildContext context, double borderRadius) {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.redDark,
      width: 3,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius),
    ),
  );
}

OutlineInputBorder _buildFocusedBorder(
    BuildContext context, double borderRadius) {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.green,
      width: 3,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius),
    ),
  );
}

OutlineInputBorder _enableBorder(BuildContext context, double borderRadius) {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.grey,
      width: 3,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius),
    ),
  );
}
