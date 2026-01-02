import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/address_api.dart';
import '../../data/address_repository.dart';
import '../../data/models/address_model.dart';
import '../../../../core/services/dio_client.dart';

/// Address API provider
final addressApiProvider = Provider<AddressApi>((ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return AddressApi(dio);
});

/// Address repository provider
final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final api = ref.watch(addressApiProvider);
  return AddressRepository(api);
});

/// Addresses controller
class AddressesController extends StateNotifier<AsyncValue<List<AddressModel>>> {
  AddressesController(this._repository)
      : super(const AsyncValue.loading()) {
    loadAddresses();
  }

  final AddressRepository _repository;

  Future<void> loadAddresses() async {
    state = const AsyncValue.loading();
    try {
      final addresses = await _repository.getAddresses();
      state = AsyncValue.data(addresses);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      await _repository.addAddress(address);
      await loadAddresses();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      await _repository.updateAddress(address);
      await loadAddresses();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      await _repository.deleteAddress(addressId);
      await loadAddresses();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setDefaultAddress(String addressId) async {
    try {
      await _repository.setDefaultAddress(addressId);
      await loadAddresses();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() => loadAddresses();
}

/// Addresses controller provider
final addressesControllerProvider =
    StateNotifierProvider<AddressesController, AsyncValue<List<AddressModel>>>(
  (ref) {
    final repository = ref.watch(addressRepositoryProvider);
    return AddressesController(repository);
  },
);


