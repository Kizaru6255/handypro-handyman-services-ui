import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Live tracking screen
class TrackingScreen extends StatelessWidget {
  const TrackingScreen({
    super.key,
    required this.bookingId,
  });

  final String bookingId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('tracking.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'tracking.order_status'.tr(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildTimelineItem(
              context,
              'Order Placed',
              'Your order has been confirmed',
              true,
              true,
            ),
            _buildTimelineItem(
              context,
              'Worker Assigned',
              'John Doe has been assigned',
              true,
              true,
            ),
            _buildTimelineItem(
              context,
              'Worker On The Way',
              'Worker is heading to your location',
              true,
              false,
            ),
            _buildTimelineItem(
              context,
              'Service Started',
              'Worker has started the service',
              false,
              false,
            ),
            _buildTimelineItem(
              context,
              'Service Completed',
              'Service has been completed',
              false,
              false,
            ),
            const SizedBox(height: AppSpacing.xl),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text('Worker Details'),
                      subtitle: Text('John Doe'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text('Phone'),
                      subtitle: Text('+1 (409) 487-1935'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text('Location'),
                      subtitle: Text('123 Main St, Brooklyn, NY'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String title,
    String subtitle,
    bool isCompleted,
    bool isActive,
  ) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.success
                    : isActive
                        ? AppColors.primaryBlue
                        : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: isCompleted
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : isActive
                      ? const Icon(
                          Icons.radio_button_checked,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
            ),
            if (!isCompleted && isActive)
              Container(
                width: 2,
                height: 60,
                color: AppColors.primaryBlue,
              )
            else if (!isCompleted)
              Container(
                width: 2,
                height: 60,
                color: Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive ? AppColors.primaryBlue : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
