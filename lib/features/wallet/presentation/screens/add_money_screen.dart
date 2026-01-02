import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Add money to wallet screen
class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final _amountController = TextEditingController();
  String? _selectedPaymentMethod;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quickAmounts = [50, 100, 200, 500, 1000];

    return Scaffold(
      appBar: AppBar(
        title: Text('wallet.add_money'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Amount',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppInputField(
              label: 'Amount',
              controller: _amountController,
              keyboardType: TextInputType.number,
              prefixIcon: const Text('\$'),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Quick Amounts',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: quickAmounts.map((amount) {
                return ChoiceChip(
                  label: Text('\$$amount'),
                  selected: _amountController.text == amount.toString(),
                  onSelected: (selected) {
                    setState(() {
                      _amountController.text = amount.toString();
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Payment Method',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            RadioListTile<String>(
              title: Text('Card'),
              value: 'card',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('UPI'),
              value: 'upi',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            AppPrimaryButton(
              label: 'Add Money',
              onPressed: _amountController.text.isNotEmpty &&
                      _selectedPaymentMethod != null
                  ? () {
                      // Process payment
                      Navigator.pop(context);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}


