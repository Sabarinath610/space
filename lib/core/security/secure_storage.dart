import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SecureStorage {
  final SharedPreferences? _prefs;


  SecureStorage({SharedPreferences? prefs}) : _prefs = prefs;

  SecureStorage.webFallback(SharedPreferences prefs) : _prefs = prefs;

  /// Factory to automatically select implementation based on platform
  factory SecureStorage.auto(SharedPreferences prefs) {
    if (kIsWeb) {
      return SecureStorage.webFallback(prefs);
    } else {
      return SecureStorage();
    }
  }

  Future<void> write(String key, String value) async {
    if (_prefs != null) {
      await _prefs.setString(key, value);
      return;
    }

  }

  Future<String?> read(String key) async {
    if (_prefs != null) {
      return _prefs.getString(key);
    }
    return null;
  }

  Future<void> delete(String key) async {
    if (_prefs != null) {
      await _prefs.remove(key);
      return;
    }
  }

  Future<void> clearAll() async {
    if (_prefs != null) {
      await _prefs.clear();
      return;
    }
    // TODO: implement mobile secure storage clear
  }
}
