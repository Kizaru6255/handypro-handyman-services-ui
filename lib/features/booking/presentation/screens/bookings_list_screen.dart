import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/network_image_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/bookings_controller.dart';
import '../../data/models/booking_model.dart';

/// Bookings list screen
class BookingsListScreen extends ConsumerStatefulWidget {
  const BookingsListScreen({super.key});

  @override
  ConsumerState<BookingsListScreen> createState() => _BookingsListScreenState();
}

class _BookingsListScreenState extends ConsumerState<BookingsListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        final statuses = [null, 'pending', 'completed', 'canceled'];
        _selectedStatus = statuses[_tabController.index];
      });
      ref.read(bookingsControllerProvider.notifier).loadBookings(
            status: _selectedStatus,
          );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getStatusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
      case BookingStatus.accepted:
        return AppColors.primaryBlue;
      case BookingStatus.completed:
        return AppColors.success;
      case BookingStatus.canceled:
        return AppColors.error;
      case BookingStatus.inProgress:
        return AppColors.warning;
    }
  }

  String _getStatusLabel(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
      case BookingStatus.accepted:
        return 'booking.upcoming'.tr();
      case BookingStatus.inProgress:
        return 'booking.work_started'.tr();
      case BookingStatus.completed:
        return 'booking.completed'.tr();
      case BookingStatus.canceled:
        return 'booking.canceled'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingsState = ref.watch(bookingsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('booking.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'booking.all_service'.tr()),
              Tab(text: 'booking.upcoming'.tr()),
              Tab(text: 'booking.completed'.tr()),
              Tab(text: 'booking.canceled'.tr()),
            ],
          ),
          Expanded(
            child: bookingsState.when(
              data: (bookings) {
                if (bookings.isEmpty) {
                  return Center(
                    child: Text('empty_states.no_bookings'.tr()),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.read(bookingsControllerProvider.notifier).refresh();
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {
                      final booking = bookings[index];
                      return _buildBookingCard(context, booking);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('common.error'.tr()),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(bookingsControllerProvider.notifier).refresh();
                      },
                      child: Text('common.retry'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, BookingModel booking) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => context.push('/booking/${booking.id}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: NetworkImageWidget(
                  imageUrl: booking.serviceImageUrl,
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(booking.status).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _getStatusLabel(booking.status),
                            style: TextStyle(
                              color: _getStatusColor(booking.status),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${booking.total?.toStringAsFixed(2) ?? '0.00'}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      booking.serviceTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          booking.location,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${'booking.service'.tr()}: ${booking.packageType} (1 person)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${'booking.date'.tr()}: ${booking.date.toString().split(' ')[0]}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

