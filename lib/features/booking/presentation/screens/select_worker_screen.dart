import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_badge.dart';
import '../../../../core/constants/app_colors.dart';

/// Select worker screen
class SelectWorkerScreen extends StatefulWidget {
  const SelectWorkerScreen({
    super.key,
    required this.serviceId,
  });

  final String serviceId;

  @override
  State<SelectWorkerScreen> createState() => _SelectWorkerScreenState();
}

class _SelectWorkerScreenState extends State<SelectWorkerScreen> {
  String? _selectedWorkerId;

  @override
  Widget build(BuildContext context) {
    // Mock workers data
    final workers = [
      _Worker(
        id: '1',
        name: 'Ethan Walker',
        imageUrl: 'https://via.placeholder.com/100',
        isAvailable: true,
      ),
      _Worker(
        id: '2',
        name: 'Benjamin Cruz',
        imageUrl: 'https://via.placeholder.com/100',
        isAvailable: false,
      ),
      _Worker(
        id: '3',
        name: 'Alexander Nguyen',
        imageUrl: 'https://via.placeholder.com/100',
        isAvailable: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('booking.select_worker'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBadge(
                    label: 'Top Rated',
                    color: AppColors.success,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'HVAC Maintenance Service',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        'Brooklyn, New York',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '4.4 (343)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(Icons.language, 'Website'),
                      _buildActionButton(Icons.call, 'Call'),
                      _buildActionButton(Icons.location_on, 'Location'),
                      _buildActionButton(Icons.share, 'Share'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'worker.professional'.tr() + ' (7)',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ...workers.map((worker) => _buildWorkerCard(worker)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('booking.service'.tr() + ': Basic'),
                Text('booking.selected_worker'.tr() + ': 1 Person'),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'booking.checkout'.tr(),
              onPressed: _selectedWorkerId != null
                  ? () {
                      context.push('/checkout');
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildWorkerCard(_Worker worker) {
    final isSelected = _selectedWorkerId == worker.id;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(worker.imageUrl),
        ),
        title: Text(worker.name),
        subtitle: Text(
          worker.isAvailable
              ? 'worker.available'.tr()
              : 'worker.booked'.tr(),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedWorkerId = worker.id;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? AppColors.primaryBlue
                : Colors.grey[300],
            foregroundColor: isSelected ? Colors.white : Colors.black,
          ),
          child: Text(
            isSelected ? 'worker.selected'.tr() : 'worker.select'.tr(),
          ),
        ),
      ),
    );
  }
}

class _Worker {
  final String id;
  final String name;
  final String imageUrl;
  final bool isAvailable;

  _Worker({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isAvailable,
  });
}

