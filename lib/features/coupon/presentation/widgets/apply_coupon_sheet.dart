import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Apply coupon bottom sheet
class ApplyCouponSheet extends StatefulWidget {
  const ApplyCouponSheet({
    super.key,
    this.onApply,
  });

  final ValueChanged<String>? onApply;

  @override
  State<ApplyCouponSheet> createState() => _ApplyCouponSheetState();
}

class _ApplyCouponSheetState extends State<ApplyCouponSheet> {
  final _couponController = TextEditingController();
  bool _isValidating = false;
  String? _couponCode;
  double? _discount;

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  Future<void> _validateCoupon() async {
    if (_couponController.text.isEmpty) return;

    setState(() {
      _isValidating = true;
    });

    // Mock validation
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _couponCode = _couponController.text;
      _discount = 10.0; // Mock discount
      _isValidating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'coupon.apply_coupon'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppInputField(
            label: 'coupon.enter_coupon_code'.tr(),
            controller: _couponController,
            hint: 'Enter coupon code',
          ),
          const SizedBox(height: AppSpacing.md),
          AppPrimaryButton(
            label: 'coupon.apply'.tr(),
            onPressed: _isValidating ? null : _validateCoupon,
            isLoading: _isValidating,
          ),
          if (_couponCode != null && _discount != null) ...[
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: AppColors.success),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coupon Applied!',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.success,
                          ),
                        ),
                        Text(
                          '${_discount}% discount applied',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppPrimaryButton(
              label: 'Use This Coupon',
              onPressed: () {
                widget.onApply?.call(_couponCode!);
                Navigator.pop(context);
              },
            ),
          ],
        ],
      ),
    );
  }
}


