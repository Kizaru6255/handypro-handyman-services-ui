import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Help center screen
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final faqs = [
      {
        'question': 'How do I book a service?',
        'answer': 'You can browse services on the home screen and select the one you need.',
      },
      {
        'question': 'How do I cancel a booking?',
        'answer': 'Go to your bookings, select the booking, and tap cancel.',
      },
      {
        'question': 'What payment methods are accepted?',
        'answer': 'We accept credit cards, debit cards, UPI, and cash on delivery.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('help.title'.tr()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.help_outline, color: AppColors.primaryBlue),
              title: Text('help.faq'.tr()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'help.faq'.tr(),
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        ...faqs.map((faq) => ExpansionTile(
                              title: Text(faq['question']!),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(AppSpacing.md),
                                  child: Text(faq['answer']!),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.support_agent, color: AppColors.primaryBlue),
              title: Text('help.contact_support'.tr()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to support chat
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.privacy_tip, color: AppColors.primaryBlue),
              title: Text('help.privacy_policy'.tr()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Open privacy policy
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.description, color: AppColors.primaryBlue),
              title: Text('help.terms_conditions'.tr()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Open terms
              },
            ),
          ),
        ],
      ),
    );
  }
}
