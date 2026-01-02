import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Payment methods screen
class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('payment.payment_methods'.tr()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _buildPaymentOption(
            context,
            'payment.card'.tr(),
            'Pay with credit/debit card',
            Icons.credit_card,
            'card',
          ),
          _buildPaymentOption(
            context,
            'payment.wallet'.tr(),
            'Pay from wallet balance',
            Icons.account_balance_wallet,
            'wallet',
          ),
          _buildPaymentOption(
            context,
            'UPI',
            'Pay with UPI',
            Icons.qr_code,
            'upi',
          ),
          _buildPaymentOption(
            context,
            'payment.cash'.tr(),
            'Pay cash on delivery',
            Icons.money,
            'cash',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ElevatedButton(
          onPressed: _selectedMethod != null
              ? () => context.pop(_selectedMethod)
              : null,
          child: Text('Select Payment Method'),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    String value,
  ) {
    final isSelected = _selectedMethod == value;
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryBlue.withOpacity(0.1)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Radio<String>(
          value: value,
          groupValue: _selectedMethod,
          onChanged: (val) {
            setState(() {
              _selectedMethod = val;
            });
          },
        ),
        onTap: () {
          setState(() {
            _selectedMethod = value;
          });
        },
      ),
    );
  }
}


