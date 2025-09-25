import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'brand_colors.dart';
import 'brand_typography.dart';

class AppTheme {
  static final lightColorScheme = ColorScheme.light(
    primary: AppColors.yellow,
    onPrimary: Colors.black,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightText,
  );

  static final darkColorScheme = ColorScheme.dark(
    primary: AppColors.yellow,
    onPrimary: Colors.black,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkText,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surface,
    textTheme: AppTypography.textTheme(lightColorScheme),
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.surface,
      foregroundColor: lightColorScheme.onSurface,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTypography.textTheme(lightColorScheme).titleLarge,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: lightColorScheme.surface,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        textStyle: AppTypography.textTheme(lightColorScheme).labelLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: CardThemeData(
      color: lightColorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
    ),
    extensions: [
      BrandTypography(
        otpDigit: AppTypography.style(
          TypoSize.xl,
          FontWeight.w600,
          lightColorScheme.onSurface,
        ).copyWith(letterSpacing: 8),
        placeOrderButton: AppTypography.style(
          TypoSize.md,
          FontWeight.w700,
          lightColorScheme.onPrimary,
        ),
        priceLabel: AppTypography.style(
          TypoSize.lg,
          FontWeight.w700,
          lightColorScheme.primary,
        ),
      ),
      BrandColors(
        success: Colors.green,
        warning: Colors.orange,
        danger: Colors.red,
      ),
    ],
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.surface,
    textTheme: AppTypography.textTheme(darkColorScheme),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.surface,
      foregroundColor: darkColorScheme.onSurface,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTypography.textTheme(darkColorScheme).titleLarge,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: darkColorScheme.surface,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primary,
        foregroundColor: darkColorScheme.onPrimary,
        textStyle: AppTypography.textTheme(darkColorScheme).labelLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: CardThemeData(
      color: darkColorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
    ),
    extensions: [
      BrandTypography(
        otpDigit: AppTypography.style(
          TypoSize.xl,
          FontWeight.w600,
          darkColorScheme.onSurface,
        ).copyWith(letterSpacing: 8),
        placeOrderButton: AppTypography.style(
          TypoSize.md,
          FontWeight.w700,
          darkColorScheme.onPrimary,
        ),
        priceLabel: AppTypography.style(
          TypoSize.lg,
          FontWeight.w700,
          darkColorScheme.primary,
        ),
      ),
      BrandColors(
        success: Colors.greenAccent,
        warning: Colors.deepOrange,
        danger: Colors.redAccent,
      ),
    ],
  );
}
