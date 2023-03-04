import 'package:arfilming/src/domain/entities/custom_theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _prefix = 'Arfilming';

class LocalStorage {
  LocalStorage();

  final _storage = const FlutterSecureStorage();

  FlutterSecureStorage get storage => _storage;

  static const String _localKey = '${_prefix}LocalKey';
  static const String _themeKey = '${_prefix}ThemeKey';
  static const String _onboardingKey = '${_prefix}OnboardingKey';
  static const String _sessionKey = '${_prefix}SessionKey';

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      return _storage.write(key: _localKey, value: null);
    }
    return _storage.write(
      key: _localKey,
      value: '${locale.languageCode}_${locale.countryCode}',
    );
  }

  Future<Locale?> getLocale() async {
    final String? value = await _storage.read(key: _localKey);
    if (value == null || value.isEmpty) {
      return null;
    }

    String languageCode = value.split('_').first;
    String countryCode = value.split('_').last;
    return Locale(languageCode, countryCode);
  }

  Future<void> setTheme(CustomTheme? theme) async {
    if (theme == null) {
      return _storage.write(key: _themeKey, value: null);
    }
    return _storage.write(key: _themeKey, value: theme.toJson());
  }

  Future<CustomTheme?> getTheme() async {
    final json = await _storage.read(key: _themeKey);
    if (json == null || json.isEmpty) {
      return null;
    }

    return CustomTheme.fromJson(json);
  }

  Future<void> setOnboardingShowed(bool value) async {
    if (value) {
      return _storage.write(key: _onboardingKey, value: 'true');
    } else {
      return _storage.write(key: _onboardingKey, value: null);
    }
  }

  Future<bool> getOnboardingShowed() async {
    return (await _storage.read(key: _onboardingKey)) != null;
  }

  Future<String?> getSession() async {
    return _storage.read(key: _sessionKey);
  }

  Future<void> setSession(String? value) async {
    if (value?.isEmpty ?? true) {
      return _storage.delete(key: _sessionKey);
    } else {
      return _storage.write(key: _sessionKey, value: value);
    }
  }
}
