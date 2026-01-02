import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_config.dart';
import '../services/storage_service.dart';

/// Theme mode notifier for managing app theme
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._storageService) : super(ThemeMode.system) {
    _loadTheme();
  }

  final StorageService _storageService;

  Future<void> _loadTheme() async {
    final savedTheme = await _storageService.getString(AppConfig.keyThemeMode);
    if (savedTheme != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.name == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    await _storageService.setString(AppConfig.keyThemeMode, mode.name);
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setTheme(newMode);
  }
}

/// Provider for theme notifier
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) {
    final storageService = ref.watch(storageServiceProvider);
    return ThemeNotifier(storageService);
  },
);


