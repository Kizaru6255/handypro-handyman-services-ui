import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

/// Profile screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile.title'.tr()),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 16),
                Text(
                  'Aaron Ramsdale',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'aaronramsdale@gmail.com',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildMenuItem(
            context,
            Icons.person_outline,
            'profile.edit_profile'.tr(),
            () => context.push('/settings'),
          ),
          _buildMenuItem(
            context,
            Icons.location_on_outlined,
            'profile.my_addresses'.tr(),
            () => context.push('/addresses'),
          ),
          _buildMenuItem(
            context,
            Icons.payment_outlined,
            'profile.payment_methods'.tr(),
            () => context.push('/payment-methods'),
          ),
          _buildMenuItem(
            context,
            Icons.account_balance_wallet_outlined,
            'profile.wallet'.tr(),
            () => context.push('/wallet'),
          ),
          _buildMenuItem(
            context,
            Icons.favorite_outline,
            'profile.favorites'.tr(),
            () => context.push('/favorites'),
          ),
          _buildMenuItem(
            context,
            Icons.notifications_outlined,
            'profile.notifications'.tr(),
            () => context.push('/notifications'),
          ),
          _buildMenuItem(
            context,
            Icons.help_outline,
            'profile.help_support'.tr(),
            () => context.push('/help'),
          ),
          _buildMenuItem(
            context,
            Icons.settings_outlined,
            'profile.settings'.tr(),
            () => context.push('/settings'),
          ),
          const SizedBox(height: 24),
          _buildMenuItem(
            context,
            Icons.logout,
            'profile.logout'.tr(),
            () {},
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

