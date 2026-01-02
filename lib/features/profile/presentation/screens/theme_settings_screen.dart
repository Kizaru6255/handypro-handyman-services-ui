import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/theme/theme_notifier.dart';

/// Theme settings screen
class ThemeSettingsScreen extends ConsumerWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('profile.theme'.tr()),
      ),
      body: ListView(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('profile.light'.tr()),
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeNotifierProvider.notifier).setTheme(value);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text('profile.dark'.tr()),
            value: ThemeMode.dark,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeNotifierProvider.notifier).setTheme(value);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text('profile.system'.tr()),
            value: ThemeMode.system,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeNotifierProvider.notifier).setTheme(value);
              }
            },
          ),
        ],
      ),
    );
  }
}


