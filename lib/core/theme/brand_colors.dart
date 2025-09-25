import 'package:flutter/material.dart';

class BrandColors extends ThemeExtension<BrandColors> {
  final Color success;
  final Color warning;
  final Color danger;

  const BrandColors({
    required this.success,
    required this.warning,
    required this.danger,
  });

  @override
  BrandColors copyWith({Color? success, Color? warning, Color? danger}) {
    return BrandColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
    );
  }

  @override
  BrandColors lerp(ThemeExtension<BrandColors>? other, double t) {
    if (other is! BrandColors) return this;
    return BrandColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}
