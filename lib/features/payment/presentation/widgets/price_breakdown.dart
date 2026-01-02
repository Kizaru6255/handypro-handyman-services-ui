import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Price breakdown widget
class PriceBreakdown extends StatelessWidget {
  const PriceBreakdown({
    super.key,
    required this.basePrice,
    required this.serviceFee,
    required this.taxes,
    this.discount = 0.0,
    this.couponCode,
  });

  final double basePrice;
  final double serviceFee;
  final double taxes;
  final double discount;
  final String? couponCode;

  double get total => basePrice + serviceFee + taxes - discount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        children: [
          _buildRow(context, 'receipt.price'.tr(), '\$${basePrice.toStringAsFixed(2)}'),
          const SizedBox(height: AppSpacing.sm),
          _buildRow(context, 'receipt.fee'.tr(), '\$${serviceFee.toStringAsFixed(2)}'),
          const SizedBox(height: AppSpacing.sm),
          _buildRow(context, 'Taxes', '\$${taxes.toStringAsFixed(2)}'),
          if (discount > 0) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildRow(
              context,
              'Discount${couponCode != null ? ' ($couponCode)' : ''}',
              '-\$${discount.toStringAsFixed(2)}',
              textColor: AppColors.success,
            ),
          ],
          const Divider(height: AppSpacing.xl),
          _buildRow(
            context,
            'receipt.total'.tr(),
            '\$${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value, {
    Color? textColor,
    bool isTotal = false,
  }) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: textColor,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? (isTotal ? AppColors.primaryBlue : null),
          ),
        ),
      ],
    );
  }
}


