import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle textButtonWhite = GoogleFonts.rubik(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle textTitle1 = GoogleFonts.rubik(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.purple,
  );
  static TextStyle textTitle2 = GoogleFonts.rubik(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.purple,
  );
  static const textTitle3 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.green,
  );
  static const bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.blueDark,
  );
  static TextStyle bodyTextBold = GoogleFonts.rubik(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle shoppingCart = GoogleFonts.rubik(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle textFieldGreen = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.green,
  );
}
