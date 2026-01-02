import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/address_model.dart';
import '../providers/address_controller.dart';

/// Addresses list screen
class AddressesListScreen extends ConsumerWidget {
  const AddressesListScreen({super.key});

  String _getTypeLabel(AddressType type) {
    switch (type) {
      case AddressType.home:
        return 'address.home'.tr();
      case AddressType.work:
        return 'address.work'.tr();
      case AddressType.other:
        return 'address.other'.tr();
    }
  }

  Color _getTypeColor(AddressType type) {
    switch (type) {
      case AddressType.home:
        return AppColors.primaryBlue;
      case AddressType.work:
        return AppColors.success;
      case AddressType.other:
        return AppColors.warning;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressesState = ref.watch(addressesControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('address.title'.tr()),
      ),
      body: addressesState.when(
        data: (addresses) {
          if (addresses.isEmpty) {
            return AppEmptyState(
              title: 'No addresses saved',
              message: 'Add your first address to get started',
              icon: Icons.location_off,
              actionLabel: 'address.add_address'.tr(),
              onAction: () => context.push('/addresses/add'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(addressesControllerProvider.notifier).refresh();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: addresses.length + 1,
              itemBuilder: (context, index) {
                if (index == addresses.length) {
                  return Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: AppPrimaryButton(
                      label: 'address.add_address'.tr(),
                      onPressed: () => context.push('/addresses/add'),
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  );
                }

                final address = addresses[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: _getTypeColor(address.type).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        address.type == AddressType.home
                            ? Icons.home
                            : address.type == AddressType.work
                                ? Icons.work
                                : Icons.location_on,
                        color: _getTypeColor(address.type),
                      ),
                    ),
                    title: Text(
                      '${address.houseNumber}, ${address.street}',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${address.city}, ${address.state} ${address.zipCode}',
                        ),
                        if (address.isDefault)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Default',
                                style: TextStyle(
                                  color: AppColors.success,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            context.push('/addresses/edit/${address.id}');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: AppColors.error,
                          onPressed: () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Delete Address'),
                                content: Text(
                                  'Are you sure you want to delete this address?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    style: TextButton.styleFrom(
                                      foregroundColor: AppColors.error,
                                    ),
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              await ref
                                  .read(addressesControllerProvider.notifier)
                                  .deleteAddress(address.id);
                            }
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      if (!address.isDefault) {
                        ref
                            .read(addressesControllerProvider.notifier)
                            .setDefaultAddress(address.id);
                      }
                    },
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => AppErrorState(
          message: error.toString(),
          onRetry: () {
            ref.read(addressesControllerProvider.notifier).refresh();
          },
        ),
      ),
    );
  }
}


