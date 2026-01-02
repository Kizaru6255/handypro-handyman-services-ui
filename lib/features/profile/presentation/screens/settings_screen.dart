import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

/// Settings screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile.settings'.tr()),
      ),
      body: ListView(
        children: [
          _buildMenuItem(
            context,
            Icons.palette_outlined,
            'profile.theme'.tr(),
            () => context.push('/settings/theme'),
          ),
          _buildMenuItem(
            context,
            Icons.language_outlined,
            'profile.language'.tr(),
            () => context.push('/settings/language'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}


