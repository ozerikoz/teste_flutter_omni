import 'package:flutter/material.dart';

/// Classe que contém as cores utilizadas no app
abstract final class AppColors {
  // Cores principais
  static const grey4 = Color(0xFFf1f2f4);
  static const grey5 = Color(0xFF22272B);
  static const grey6 = Color(0xFF101204);
  static const white1 = Color(0xFFFFFFFF);
  static const white2 = Color(0xFFb5c2cf);
  static const black1 = Color(0xFF101010);
  static const black2 = Color(0xFF182a4d);
  static const grey1 = Color(0xFFF2F2F2);
  static const grey2 = Color(0xFF4D4D4D);
  static const grey3 = Color(0xFF616f86);
  static const blueGrey = Color(0xFF253046);
  static const whiteTransparent = Color(0x4DFFFFFF);
  static const blackTransparent = Color(0x4D000000);
  static const red1 = Color(0xFFE74C3C);
  static const blue1 = Color(0xFF0079BF);
  static const blue2 = Color(0xFF005A8D);
  static const green1 = Color(0xFF61BD4F);
  static const yellow1 = Color(0xFFF2D600);
  static const orange1 = Color(0xFFFFAB4A);
  static const red2 = Color(0xFFEB5A46);

  // Esquema de cores no tema claro
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.blue1,
    onPrimary: AppColors.white1,
    secondary: AppColors.green1,
    onSecondary: AppColors.white1,
    surface: AppColors.grey4,
    onSurface: AppColors.grey6,
    error: AppColors.red2,
    errorContainer: AppColors.red1,
    onError: AppColors.white1,
  );

  // Esquema de cores no tema escuro
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.blue2,
    onPrimary: AppColors.white1,
    secondary: AppColors.green1,
    onSecondary: AppColors.black1,
    surface: AppColors.grey2,
    onSurface: AppColors.white1,
    error: AppColors.red2,
    errorContainer: AppColors.red1,
    onError: AppColors.black1,
  );
}
