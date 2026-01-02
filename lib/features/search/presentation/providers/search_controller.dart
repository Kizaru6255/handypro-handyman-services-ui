import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/search_api.dart';
import '../../../home/data/models/service_model.dart';
import '../../../../core/services/dio_client.dart';

/// Search API provider
final searchApiProvider = Provider<SearchApi>((ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return SearchApi(dio);
});

/// Search controller
class SearchController extends StateNotifier<AsyncValue<SearchState>> {
  SearchController(this._api) : super(const AsyncValue.data(SearchState()));

  final SearchApi _api;

  String _query = '';
  String? _selectedCategory;

  Future<void> search(String query, {String? category}) async {
    _query = query;
    _selectedCategory = category;
    state = const AsyncValue.loading();
    try {
      final results = await _api.searchServices(
        query: query,
        category: category,
      );
      state = AsyncValue.data(
        SearchState(
          query: query,
          selectedCategory: category,
          results: results,
        ),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> loadRecentSearches() async {
    try {
      final recent = await _api.getRecentSearches();
      final currentState = state.value ?? SearchState();
      state = AsyncValue.data(
        currentState.copyWith(recentSearches: recent),
      );
    } catch (e) {
      // Handle error
    }
  }

  void setCategory(String? category) {
    final currentState = state.value ?? SearchState();
    state = AsyncValue.data(
      currentState.copyWith(selectedCategory: category),
    );
  }
}

/// Search state
class SearchState {
  const SearchState({
    this.query = '',
    this.selectedCategory,
    this.results = const [],
    this.recentSearches = const [],
  });

  final String query;
  final String? selectedCategory;
  final List<ServiceModel> results;
  final List<String> recentSearches;

  SearchState copyWith({
    String? query,
    String? selectedCategory,
    List<ServiceModel>? results,
    List<String>? recentSearches,
  }) {
    return SearchState(
      query: query ?? this.query,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      results: results ?? this.results,
      recentSearches: recentSearches ?? this.recentSearches,
    );
  }
}

/// Search controller provider
final searchControllerProvider =
    StateNotifierProvider<SearchController, AsyncValue<SearchState>>((ref) {
  final api = ref.watch(searchApiProvider);
  return SearchController(api);
});

