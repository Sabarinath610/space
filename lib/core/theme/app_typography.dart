import 'package:flutter/material.dart';

class TypoSize {
  static const double xs = 10;
  static const double sm = 12;
  static const double base = 14;
  static const double md = 16;
  static const double lg = 18;
  static const double xl = 20;
  static const double xxl = 24;
}

class AppTypography {
  static const String primaryFont = 'Inter';
  static const List<String> fallbackFont = ['RobotoFallback'];

  static TextStyle style(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontFamily: primaryFont,
      fontFamilyFallback: fallbackFont,
      fontSize: size,
      fontWeight: weight,
      height: 1.25,
      color: color,
    );
  }

  static TextTheme textTheme(ColorScheme scheme) {
    return TextTheme(
      displayLarge: style(TypoSize.xxl, FontWeight.w700, scheme.onSurface),
      headlineMedium: style(TypoSize.xl, FontWeight.w600, scheme.onSurface),
      titleLarge: style(TypoSize.lg, FontWeight.w600, scheme.onSurface),
      bodyLarge: style(TypoSize.md, FontWeight.w400, scheme.onSurface),
      bodyMedium: style(TypoSize.base, FontWeight.w400, scheme.onSurface),
      bodySmall: style(TypoSize.sm, FontWeight.w400, scheme.onSurface),
      labelLarge: style(TypoSize.base, FontWeight.w600, scheme.onPrimary),
      labelSmall: style(TypoSize.sm, FontWeight.w500, scheme.onPrimary),
    );
  }
}
