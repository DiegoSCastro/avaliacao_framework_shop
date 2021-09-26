import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final Function() onTap;
  final double width;
  final Color? color;
  final bool disabled;
  final bool loading;
  const CustomButton({
    Key? key,
    required this.labelText,
    required this.onTap,
    this.width = 120,
    this.color = AppColors.green,
    this.disabled = false,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      onPressed: disabled || loading ? null : onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: loading
          ? const SpinKitCircle(
              color: AppColors.white,
              size: 30,
            )
          : Text(
              labelText,
              style: AppTextStyles.textButtonWhite,
            ),
      color: disabled ? AppColors.grey : color,
    );
  }
}
