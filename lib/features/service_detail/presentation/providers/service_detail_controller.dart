import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/service_detail_api.dart';
import '../../../home/data/models/service_model.dart';
import '../../../../core/services/dio_client.dart';

/// Service detail API provider
final serviceDetailApiProvider = Provider<ServiceDetailApi>((ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return ServiceDetailApi(dio);
});

/// Service detail controller
class ServiceDetailController extends StateNotifier<AsyncValue<ServiceModel?>> {
  ServiceDetailController(this._api, this.serviceId)
      : super(const AsyncValue.loading()) {
    loadService();
  }

  final ServiceDetailApi _api;
  final String serviceId;

  Future<void> loadService() async {
    state = const AsyncValue.loading();
    try {
      final service = await _api.getServiceDetail(serviceId);
      state = AsyncValue.data(service);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Map<String, String> getPackageDetails(String packageType) {
    return _api.getPackageDetails(packageType);
  }
}

/// Service detail controller provider
final serviceDetailControllerProvider =
    StateNotifierProvider.family<ServiceDetailController, AsyncValue<ServiceModel?>, String>(
  (ref, serviceId) {
    final api = ref.watch(serviceDetailApiProvider);
    return ServiceDetailController(api, serviceId);
  },
);

