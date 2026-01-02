import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_secondary_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import 'add_money_screen.dart';
import 'transaction_history_screen.dart';

/// Wallet screen
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final balance = 450.0; // Mock balance

    return Scaffold(
      appBar: AppBar(
        title: Text('wallet.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.push('/wallet/transactions'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue,
                    AppColors.primaryBlueDark,
                  ],
                ),
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              ),
              child: Column(
                children: [
                  Text(
                    'wallet.balance'.tr(),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    '\$${balance.toStringAsFixed(2)}',
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: AppPrimaryButton(
                    label: 'wallet.add_money'.tr(),
                    onPressed: () => context.push('/wallet/add-money'),
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppSecondaryButton(
                    label: 'wallet.withdraw'.tr(),
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'wallet.transaction_history'.tr(),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: Text('wallet.transaction_history'.tr()),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/wallet/transactions'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

