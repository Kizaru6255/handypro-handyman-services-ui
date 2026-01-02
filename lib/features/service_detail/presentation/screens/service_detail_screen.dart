import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../../../core/widgets/app_badge.dart';
import '../../../../core/widgets/network_image_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/service_detail_controller.dart';

/// Service detail screen
class ServiceDetailScreen extends ConsumerStatefulWidget {
  const ServiceDetailScreen({
    super.key,
    required this.serviceId,
  });

  final String serviceId;

  @override
  ConsumerState<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends ConsumerState<ServiceDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPackage = 'Basic';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serviceState = ref.watch(
      serviceDetailControllerProvider(widget.serviceId),
    );

    return Scaffold(
      body: serviceState.when(
        data: (service) {
          if (service == null) {
            return const Center(child: Text('Service not found'));
          }

          final controller = ref.read(
            serviceDetailControllerProvider(widget.serviceId).notifier,
          );
          final packageDetails = controller.getPackageDetails(_selectedPackage);

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: NetworkImageWidget(
                    imageUrl: service.imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (service.isTopRated ?? false)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const AppBadge(
                            label: 'Top Rated',
                            color: AppColors.success,
                          ),
                        ),
                      Text(
                        service.title,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            service.location ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (service.rating != null)
                        RatingStars(
                          rating: service.rating!,
                          showRating: true,
                          showReviews: true,
                          reviewCount: service.reviewCount,
                        ),
                      const SizedBox(height: 24),
                      Text(
                        'service.description'.tr(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        service.description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      TabBar(
                        controller: _tabController,
                        onTap: (index) {
                          setState(() {
                            _selectedPackage = ['Basic', 'Standard', 'Premium'][index];
                          });
                        },
                        tabs: const [
                          Tab(text: 'Basic'),
                          Tab(text: 'Standard'),
                          Tab(text: 'Premium'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          packageDetails[_selectedPackage] ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('common.error'.tr()),
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
        child: serviceState.when(
          data: (service) {
            if (service == null) return const SizedBox.shrink();
            final packagePrice = _selectedPackage == 'Basic'
                ? service.priceMin
                : _selectedPackage == 'Standard'
                    ? (service.priceMin! + service.priceMax!) / 2
                    : service.priceMax;
            return AppButton(
              label: 'service.select_package'.tr(
                namedArgs: {
                  'package': _selectedPackage,
                  'price': '\$${packagePrice?.toStringAsFixed(0) ?? '0'}',
                },
              ),
              onPressed: () {
                context.push('/select-worker/${widget.serviceId}');
              },
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

