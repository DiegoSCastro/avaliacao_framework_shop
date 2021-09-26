import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color? color;
  final Color? iconColor;

  const QuantityButton.add(
      {Key? key,
      this.icon = Icons.add,
      required this.onTap,
      this.color,
      this.iconColor = AppColors.white})
      : super(key: key);

  const QuantityButton.remove(
      {Key? key,
      this.icon = Icons.remove,
      required this.onTap,
      this.color,
      this.iconColor = AppColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 30,
      minWidth: 30,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 30,
      ),
    );
  }
}
