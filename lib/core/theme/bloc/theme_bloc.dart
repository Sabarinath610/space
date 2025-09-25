import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const _kKey = 'app_theme_mode';
  final SharedPreferences prefs;
  ThemeBloc({required this.prefs}) : super(const ThemeState(ThemeMode.system)) {
    on<LoadTheme>(_onLoad);
    on<ChangeTheme>(_onChange);
    on<ToggleTheme>(_onToggle);
    add(LoadTheme());
  }

  Future<void> _onLoad(LoadTheme _, Emitter<ThemeState> emit) async {
    final stored = prefs.getString(_kKey);
    final mode = _fromString(stored);
    emit(ThemeState(mode));
  }

  Future<void> _onChange(ChangeTheme event, Emitter<ThemeState> emit) async {
    emit(ThemeState(event.mode));
    await prefs.setString(_kKey, _toString(event.mode));
  }

  Future<void> _onToggle(ToggleTheme _, Emitter<ThemeState> emit) async {
    final next = state.mode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(ThemeState(next));
    await prefs.setString(_kKey, _toString(next));
  }

  ThemeMode _fromString(String? s) {
    switch (s) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _toString(ThemeMode m) => m == ThemeMode.light
      ? 'light'
      : (m == ThemeMode.dark ? 'dark' : 'system');
}
