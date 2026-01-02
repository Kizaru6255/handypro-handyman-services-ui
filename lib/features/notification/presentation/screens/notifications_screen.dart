import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Notifications screen
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Mock notifications
    final notifications = <Map<String, dynamic>>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('notification.title'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              // Mark all as read
            },
            child: Text('notification.mark_all_read'.tr()),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? AppEmptyState(
              title: 'notification.no_notifications'.tr(),
              message: 'You have no notifications yet',
              icon: Icons.notifications_none,
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final isRead = notification['isRead'] ?? false;
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  color: isRead ? null : AppColors.primaryBlue.withOpacity(0.05),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getNotificationIcon(notification['type']),
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    title: Text(
                      notification['title'],
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification['message']),
                        const SizedBox(height: 4),
                        Text(
                          timeago.format(notification['timestamp']),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    trailing: !isRead
                        ? Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBlue,
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                    onTap: () {
                      // Handle notification tap
                    },
                  ),
                );
              },
            ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'booking':
        return Icons.event;
      case 'payment':
        return Icons.payment;
      case 'promotion':
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }
}
