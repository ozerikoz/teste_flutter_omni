import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/views/theme/colors.dart';

/// Classe responsável por definir os temas do app
abstract class AppTheme {
  // Tema claro
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.lightColorScheme,
      primaryColor: AppColors.white1,
      primaryColorDark: AppColors.black1,
      scaffoldBackgroundColor: AppColors.blueGrey,
      iconTheme: const IconThemeData(
        color: AppColors.black2,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.grey3,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: AppColors.black2,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue1,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.white1,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.black12,
      ),
      cardColor: AppColors.white1,
      canvasColor: AppColors.grey4,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.grey),
        thickness: WidgetStateProperty.all(6),
        radius: const Radius.circular(8),
      ),
    );
  }

  // Tema escuro
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.darkColorScheme,
      primaryColor: AppColors.black1,
      primaryColorLight: AppColors.white1,
      scaffoldBackgroundColor: AppColors.blueGrey,
      iconTheme: const IconThemeData(
        color: AppColors.white2,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.grey3,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white2,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue1,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.white1,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.black12,
      ),
      cardColor: AppColors.grey5,
      canvasColor: AppColors.grey6,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.grey),
        thickness: WidgetStateProperty.all(6),
        radius: const Radius.circular(8),
      ),
    );
  }
}
