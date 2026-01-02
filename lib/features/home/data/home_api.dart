import 'package:dio/dio.dart';
import 'models/banner_model.dart';
import 'models/category_model.dart';
import 'models/service_model.dart';

/// Home API for home screen data
class HomeApi {
  HomeApi(this._dio);

  final Dio _dio;

  Future<List<BannerModel>> getBanners() async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      BannerModel(
        id: '1',
        title: '25% OFF',
        imageUrl: 'https://via.placeholder.com/400x200',
        description: 'Get discount for every order, only valid for today.',
        discountPercent: '25%',
      ),
    ];
  }

  Future<List<CategoryModel>> getCategories() async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      CategoryModel(id: '1', name: 'Cleaning', icon: 'cleaning'),
      CategoryModel(id: '2', name: 'Cooking', icon: 'cooking'),
      CategoryModel(id: '3', name: 'Shipping', icon: 'shipping'),
      CategoryModel(id: '4', name: 'Repairing', icon: 'repairing'),
    ];
  }

  Future<List<ServiceModel>> getRecommendedServices() async {
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
      ServiceModel(
        id: '2',
        title: 'HVAC Maintenance Service',
        imageUrl: 'https://via.placeholder.com/400x300',
        description: 'Includes inspection and cleaning of...',
        location: 'Brooklyn, NY',
        rating: 4.4,
        reviewCount: 343,
        priceMin: 75,
        priceMax: 200,
        isTopRated: true,
      ),
    ];
  }

  Future<List<ServiceModel>> getServices({
    String? categoryId,
  }) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return getRecommendedServices();
  }
}


