import 'package:flutter/material.dart';

class BrandTypography extends ThemeExtension<BrandTypography> {
  final TextStyle? otpDigit;
  final TextStyle? placeOrderButton;
  final TextStyle? priceLabel;

  const BrandTypography({
    this.otpDigit,
    this.placeOrderButton,
    this.priceLabel,
  });

  @override
  BrandTypography copyWith({
    TextStyle? otpDigit,
    TextStyle? placeOrderButton,
    TextStyle? priceLabel,
  }) {
    return BrandTypography(
      otpDigit: otpDigit ?? this.otpDigit,
      placeOrderButton: placeOrderButton ?? this.placeOrderButton,
      priceLabel: priceLabel ?? this.priceLabel,
    );
  }

  @override
  BrandTypography lerp(ThemeExtension<BrandTypography>? other, double t) {
    if (other is! BrandTypography) return this;
    return BrandTypography(
      otpDigit: TextStyle.lerp(otpDigit, other.otpDigit, t),
      placeOrderButton: TextStyle.lerp(
        placeOrderButton,
        other.placeOrderButton,
        t,
      ),
      priceLabel: TextStyle.lerp(priceLabel, other.priceLabel, t),
    );
  }
}
