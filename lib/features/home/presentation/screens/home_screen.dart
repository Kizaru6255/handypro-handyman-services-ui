import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../providers/home_controller.dart';
import '../providers/location_provider.dart';
import '../widgets/special_offer_banner.dart';
import '../widgets/service_category_list.dart';
import '../widgets/home_service_list.dart';

/// Home screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(homeControllerProvider.notifier).refresh();
        },
        child: homeState.when(
          data: (data) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'home.greeting_param'.tr(namedArgs: {'name': 'Aaron'}),
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                const SizedBox(height: 4),
                                ref.watch(locationProvider).when(
                                  data: (city) => Row(
                                    children: [
                                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 4),
                                      Text(
                                        city ?? 'Brooklyn, New York',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  loading: () => const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                  error: (_, __) => Row(
                                    children: [
                                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Brooklyn, New York',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined),
                            onPressed: () => context.push('/notifications'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        hint: 'home.how_can_help'.tr(),
                        prefixIcon: const Icon(Icons.search),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            context.push('/home/search');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (data.banners.isNotEmpty)
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'home.special_offers'.tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('common.see_all'.tr()),
                            ),
                          ],
                        ),
                      ),
                      SpecialOfferBanner(banner: data.banners.first),
                    ],
                  ),
                ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'home.service_category'.tr(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('common.see_all'.tr()),
                          ),
                        ],
                      ),
                    ),
                    ServiceCategoryList(categories: data.categories),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'home.home_service'.tr(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('common.see_all'.tr()),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: HomeServiceList(
                  services: data.services,
                  onServiceTap: (service) {
                    context.push('/service/${service.id}');
                  },
                ),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('common.error'.tr()),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(homeControllerProvider.notifier).refresh();
                  },
                  child: Text('common.retry'.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

