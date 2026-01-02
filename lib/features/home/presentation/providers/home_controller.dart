import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/home_api.dart';
import '../../data/home_repository.dart';
import '../../data/models/banner_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/service_model.dart';
import '../../../../core/services/dio_client.dart';

/// Home API provider
final homeApiProvider = Provider<HomeApi>((ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return HomeApi(dio);
});

/// Home repository provider
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final api = ref.watch(homeApiProvider);
  return HomeRepository(api);
});

/// Home controller
class HomeController extends StateNotifier<AsyncValue<HomeState>> {
  HomeController(this._repository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  final HomeRepository _repository;

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    try {
      final banners = await _repository.getBanners();
      final categories = await _repository.getCategories();
      final services = await _repository.getRecommendedServices();
      state = AsyncValue.data(
        HomeState(
          banners: banners,
          categories: categories,
          services: services,
        ),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() => loadData();
}

/// Home state
class HomeState {
  const HomeState({
    required this.banners,
    required this.categories,
    required this.services,
  });

  final List<BannerModel> banners;
  final List<CategoryModel> categories;
  final List<ServiceModel> services;
}

/// Home controller provider
final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<HomeState>>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return HomeController(repository);
});


