import 'home_api.dart';
import 'models/banner_model.dart';
import 'models/category_model.dart';
import 'models/service_model.dart';

/// Home repository
class HomeRepository {
  HomeRepository(this._api);

  final HomeApi _api;

  Future<List<BannerModel>> getBanners() => _api.getBanners();

  Future<List<CategoryModel>> getCategories() => _api.getCategories();

  Future<List<ServiceModel>> getRecommendedServices() =>
      _api.getRecommendedServices();

  Future<List<ServiceModel>> getServices({String? categoryId}) =>
      _api.getServices(categoryId: categoryId);
}


