import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode mode;
  const ThemeState(this.mode);
  @override bool operator ==(Object other) => other is ThemeState && other.mode == mode;
  @override int get hashCode => mode.hashCode;
}