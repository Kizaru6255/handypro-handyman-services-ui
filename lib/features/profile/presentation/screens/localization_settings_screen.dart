import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Localization settings screen
class LocalizationSettingsScreen extends StatelessWidget {
  const LocalizationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text('profile.language'.tr()),
      ),
      body: ListView(
        children: [
          RadioListTile<Locale>(
            title: const Text('English'),
            value: const Locale('en', 'US'),
            groupValue: currentLocale,
            onChanged: (value) {
              if (value != null) {
                context.setLocale(value);
              }
            },
          ),
          RadioListTile<Locale>(
            title: const Text('हिंदी'),
            value: const Locale('hi', 'IN'),
            groupValue: currentLocale,
            onChanged: (value) {
              if (value != null) {
                context.setLocale(value);
              }
            },
          ),
        ],
      ),
    );
  }
}


