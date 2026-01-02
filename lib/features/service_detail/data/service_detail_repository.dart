import 'service_detail_api.dart';
import '../../home/data/models/service_model.dart';

/// Service detail repository
class ServiceDetailRepository {
  ServiceDetailRepository(this._api);

  final ServiceDetailApi _api;

  Future<ServiceModel> getServiceDetail(String serviceId) =>
      _api.getServiceDetail(serviceId);

  Map<String, String> getPackageDetails(String packageType) =>
      _api.getPackageDetails(packageType);
}

