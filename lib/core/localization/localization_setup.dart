import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_config.dart';
import '../services/storage_service.dart';

/// Localization setup and management
class LocalizationSetup {
  static Future<void> initialize() async {
    await EasyLocalization.ensureInitialized();
  }

  static List<Locale> get supportedLocales => const [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
      ];

  static String get translationsPath => 'assets/translations';
}

/// Locale notifier for managing app language
class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier(this._storageService) : super(null) {
    _loadLocale();
  }

  final StorageService _storageService;

  Future<void> _loadLocale() async {
    final savedLocale = await _storageService.getString(AppConfig.keyLocale);
    if (savedLocale != null) {
      final parts = savedLocale.split('_');
      if (parts.length == 2) {
        state = Locale(parts[0], parts[1]);
      }
    }
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await _storageService.setString(
      AppConfig.keyLocale,
      '${locale.languageCode}_${locale.countryCode}',
    );
  }
}

/// Provider for locale notifier
final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
  (ref) {
    final storageService = ref.watch(storageServiceProvider);
    return LocaleNotifier(storageService);
  },
);


