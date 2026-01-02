import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/network_image_widget.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../data/models/booking_model.dart';

/// Booking detail screen
class BookingDetailScreen extends ConsumerWidget {
  const BookingDetailScreen({
    super.key,
    required this.bookingId,
  });

  final String bookingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock booking data for now
    final booking = BookingModel(
      id: bookingId,
      serviceId: '1',
      serviceTitle: 'House Cleaning Service',
      serviceImageUrl: 'https://via.placeholder.com/800x400',
      workerId: '1',
      workerName: 'Atnan Walker',
      workerImageUrl: 'https://via.placeholder.com/100',
      location: 'New York, California',
      date: DateTime(2024, 12, 22),
      status: BookingStatus.completed,
      packageType: 'Basic Package',
      price: 450,
      fee: 1.55,
      total: 45.55,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('booking.booking_detail'.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageWidget(
              imageUrl: booking.serviceImageUrl,
              height: 250,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.serviceTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        booking.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  RatingStars(
                    rating: 4.4,
                    showRating: true,
                    showReviews: true,
                    reviewCount: 343,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'booking.order_progress'.tr(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  _buildProgressStep(
                    context,
                    'booking.service_ordered'.tr(),
                    'Standard House Cleaning',
                    '08.30 AM',
                    isCompleted: true,
                  ),
                  _buildProgressStep(
                    context,
                    'booking.work_started'.tr(),
                    'Clean countertops, sink, appliance...',
                    '09.00 AM',
                    isCompleted: true,
                  ),
                  _buildProgressStep(
                    context,
                    'booking.work_completed'.tr(),
                    'An invoice is sent to the client, detaili.',
                    '11.00 AM',
                    isCompleted: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: AppButton(
          label: 'booking.e_receipt'.tr(),
          onPressed: () {
            context.push('/receipt/${booking.id}');
          },
        ),
      ),
    );
  }

  Widget _buildProgressStep(
    BuildContext context,
    String title,
    String description,
    String time,
    {required bool isCompleted}
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300],
                ),
                child: isCompleted
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
              if (isCompleted)
                Container(
                  width: 2,
                  height: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

