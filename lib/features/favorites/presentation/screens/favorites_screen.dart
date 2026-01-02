import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_service_card.dart';
import '../providers/favorites_controller.dart';

/// Favorites screen
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('favorites.title'.tr()),
      ),
      body: favoritesState.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return AppEmptyState(
              title: 'favorites.no_favorites'.tr(),
              message: 'Start adding services to your favorites',
              icon: Icons.favorite_border,
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(favoritesControllerProvider.notifier).loadFavorites();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final service = favorites[index];
                return AppServiceCard(
                  title: service.title,
                  imageUrl: service.imageUrl,
                  location: service.location,
                  description: service.description,
                  rating: service.rating,
                  reviewCount: service.reviewCount,
                  priceMin: service.priceMin,
                  priceMax: service.priceMax,
                  isRecommended: service.isRecommended ?? false,
                  isFavorite: true,
                  onTap: () => context.push('/service/${service.id}'),
                  onFavoriteTap: () {
                    ref
                        .read(favoritesControllerProvider.notifier)
                        .toggleFavorite(service.id);
                  },
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => AppErrorState(
          message: error.toString(),
          onRetry: () {
            ref.read(favoritesControllerProvider.notifier).loadFavorites();
          },
        ),
      ),
    );
  }
}
