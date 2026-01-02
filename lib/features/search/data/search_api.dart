import 'package:dio/dio.dart';
import '../../home/data/models/service_model.dart';

/// Search API
class SearchApi {
  SearchApi(this._dio);

  final Dio _dio;

  Future<List<ServiceModel>> searchServices({
    required String query,
    String? category,
  }) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      ServiceModel(
        id: '1',
        title: 'House Cleaning Service',
        imageUrl: 'https://via.placeholder.com/400x300',
        description: 'Includes dusting, vacuuming, etc.',
        location: 'Brooklyn, NY',
        rating: 4.8,
        reviewCount: 432,
        priceMin: 100,
        priceMax: 200,
        isRecommended: true,
      ),
    ];
  }

  Future<List<String>> getRecentSearches() async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 300));
    return ['Vacuuming', 'Cleaning Bathrooms', 'Maintenance Service', 'Kitchens'];
  }
}

