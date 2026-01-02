import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Transaction history screen
class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Mock transactions
    final transactions = <Map<String, dynamic>>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('wallet.transaction_history'.tr()),
      ),
      body: transactions.isEmpty
          ? AppEmptyState(
              title: 'No transactions yet',
              message: 'Your transaction history will appear here',
              icon: Icons.history,
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final isCredit = transaction['type'] == 'credit';
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isCredit
                            ? AppColors.success.withOpacity(0.1)
                            : AppColors.error.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isCredit ? Icons.add : Icons.remove,
                        color: isCredit ? AppColors.success : AppColors.error,
                      ),
                    ),
                    title: Text(transaction['description']),
                    subtitle: Text(transaction['date']),
                    trailing: Text(
                      '${isCredit ? '+' : '-'}\$${transaction['amount']}',
                      style: TextStyle(
                        color: isCredit ? AppColors.success : AppColors.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}


