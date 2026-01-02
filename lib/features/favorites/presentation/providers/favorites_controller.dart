import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/data/models/service_model.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/constants/app_config.dart';

/// Favorites controller
class FavoritesController extends StateNotifier<AsyncValue<List<ServiceModel>>> {
  FavoritesController(this._storageService)
      : super(const AsyncValue.loading()) {
    loadFavorites();
  }

  final StorageService _storageService;

  Future<void> loadFavorites() async {
    state = const AsyncValue.loading();
    try {
      final favoritesJson = await _storageService.getString('favorites');
      // In real app, fetch from API
      state = const AsyncValue.data([]);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> toggleFavorite(String serviceId) async {
    try {
      final current = state.value ?? [];
      final isFavorite = current.any((s) => s.id == serviceId);
      
      if (isFavorite) {
        // Remove from favorites
        final updated = current.where((s) => s.id != serviceId).toList();
        state = AsyncValue.data(updated);
      } else {
        // Add to favorites (in real app, fetch service and add)
        // For now, just refresh
        await loadFavorites();
      }
    } catch (e) {
      // Handle error
    }
  }

  bool isFavorite(String serviceId) {
    final favorites = state.value ?? [];
    return favorites.any((s) => s.id == serviceId);
  }
}

/// Favorites controller provider
final favoritesControllerProvider =
    StateNotifierProvider<FavoritesController, AsyncValue<List<ServiceModel>>>(
  (ref) {
    final storage = ref.watch(storageServiceProvider);
    return FavoritesController(storage);
  },
);


