import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData _getTheme({required ColorScheme colorScheme}) {
    return ThemeData(
      colorScheme: colorScheme,
      splashColor: Colors.transparent,


      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorScheme.secondary,
        ),
        bodyMedium:TextStyle(
          fontSize: 16,
          color: colorScheme.onPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colorScheme.secondary,
        ),

        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.onPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.primary,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: colorScheme.primary,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.secondary,
        ),
        titleLarge: TextStyle(
          fontSize: 18,

          color: colorScheme.onPrimary,
        )
      ),



      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.primary.withValues(alpha: .5),
        selectionHandleColor: colorScheme.primary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        focusColor: colorScheme.primary,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.darkBlue.withValues(alpha: .6),
        ),
        prefixIconColor: colorScheme.primary,
        suffixIconColor: colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
          foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),
        ),
      ),
    );
  }

  static ThemeData getLightThemeData() {
    return _getTheme(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.blue,
        onPrimary: AppColors.white,
        secondary: AppColors.darkBlue,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        surface: AppColors.white,
        onSurface: AppColors.blue,
      ),

    );
  }
}
