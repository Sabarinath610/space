import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = HexColor('#F1B90C');

  /// Custom HexColor parser
  // ignore: non_constant_identifier_names
  static Color HexColor(String hexCode) {
    hexCode = hexCode.replaceAll('#', '');
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode'; // add alpha if not provided
    }
    return Color(int.parse(hexCode, radix: 16));
  }
}
