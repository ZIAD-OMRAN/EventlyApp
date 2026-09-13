import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    chipTheme: ChipThemeData(
      surfaceTintColor: Colors.transparent,
      pressElevation: 0,
    ),
    focusColor: AppColors.primaryColor,
    cardColor: AppColors.colorsecondry,
    splashFactory: NoSplash.splashFactory,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    hintColor: AppColors.grayColor,
    textTheme: _gettextThem(AppColors.textligthcolor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.colorsecondry,
      unselectedItemColor: AppColors.colorsecondry,
      unselectedLabelStyle: TextStyle(
        color: AppColors.colorsecondry,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: AppColors.colorsecondry,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.colorsecondry,
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    chipTheme: ChipThemeData(
      surfaceTintColor: Colors.transparent,
      pressElevation: 0,
    ),
    focusColor: AppColors.textdarkcolor,
    cardColor: AppColors.primaryColor,
    splashFactory: NoSplash.splashFactory,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkprimary,
    ),
    hintColor: AppColors.textdarkcolor,

    textTheme: _gettextThem(AppColors.textdarkcolor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,

      backgroundColor: AppColors.darkprimary,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.colorsecondry,
      unselectedItemColor: AppColors.colorsecondry,
      unselectedLabelStyle: TextStyle(
        color: AppColors.colorsecondry,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkprimary,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkprimary),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.darkprimary,
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );

  static TextTheme _gettextThem(Color textcolor) {
    return TextTheme(
      labelSmall: TextStyle(
        color: textcolor,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: textcolor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: textcolor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: textcolor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: textcolor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: textcolor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: textcolor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
