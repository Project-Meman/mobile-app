import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meman/core/utils/res/app_colors.dart';

class AppTheme {
  static ThemeData get defaultTheme => darkTheme;

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColorDark: AppColors.primary,
        primaryColorLight: AppColors.primary,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.white,
          decorationColor: Colors.white,
          displayColor: Colors.grey,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary, //<-- SEE HERE
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          iconColor: AppColors.primary,
          fillColor: Colors.grey.withOpacity(.15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white24),
          ),
        ),
      );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.primary,
        splashColor: AppColors.primary,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: AppColors.primaryDark,
          backgroundColor: AppColors.primaryLight,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.secondary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.light,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      );
}
