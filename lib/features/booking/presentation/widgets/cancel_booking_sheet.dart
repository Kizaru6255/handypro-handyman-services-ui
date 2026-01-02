import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_secondary_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Cancel booking bottom sheet
class CancelBookingSheet extends StatefulWidget {
  const CancelBookingSheet({
    super.key,
    required this.onCancel,
  });

  final ValueChanged<String> onCancel;

  @override
  State<CancelBookingSheet> createState() => _CancelBookingSheetState();
}

class _CancelBookingSheetState extends State<CancelBookingSheet> {
  String? _selectedReason;
  final List<String> _reasons = [
    'Service no longer needed',
    'Found another provider',
    'Scheduling conflict',
    'Price too high',
    'Other',
  ];

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
          Text(
            'booking.cancel_booking'.tr(),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Please select a reason for cancellation',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          ..._reasons.map((reason) {
            final isSelected = _selectedReason == reason;
            return RadioListTile<String>(
              title: Text(reason),
              value: reason,
              groupValue: _selectedReason,
              onChanged: (value) {
                setState(() {
                  _selectedReason = value;
                });
              },
            );
          }),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: AppSecondaryButton(
                  label: 'Back',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppPrimaryButton(
                  label: 'Cancel Booking',
                  onPressed: _selectedReason != null
                      ? () {
                          widget.onCancel(_selectedReason!);
                          Navigator.pop(context);
                        }
                      : null,
                  backgroundColor: AppColors.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


