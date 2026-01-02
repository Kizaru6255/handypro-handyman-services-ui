import 'package:dio/dio.dart';
import '../../home/data/models/service_model.dart';

/// Service detail API
class ServiceDetailApi {
  ServiceDetailApi(this._dio);

  final Dio _dio;

  Future<ServiceModel> getServiceDetail(String serviceId) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return ServiceModel(
      id: serviceId,
      title: 'HVAC Maintenance Service',
      imageUrl: 'https://via.placeholder.com/800x400',
      description:
          'Includes inspection and cleaning of the HVAC system, checking for proper operation, and minor repairs if needed.',
      location: 'Brooklyn, New York',
      rating: 4.4,
      reviewCount: 343,
      priceMin: 100,
      priceMax: 200,
      isTopRated: true,
    );
  }

  Map<String, String> getPackageDetails(String packageType) {
    // Mock implementation
    return {
      'Basic':
          'This package covers essential maintenance tasks to ensure your HVAC system runs efficiently.',
      'Standard':
          'This package includes all basic tasks plus additional checks and cleaning.',
      'Premium':
          'This premium package includes comprehensive maintenance with priority support.',
    };
  }
}

