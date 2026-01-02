import 'address_api.dart';
import 'models/address_model.dart';

/// Address repository
class AddressRepository {
  AddressRepository(this._api);

  final AddressApi _api;

  Future<List<AddressModel>> getAddresses() => _api.getAddresses();

  Future<AddressModel> addAddress(AddressModel address) =>
      _api.addAddress(address);

  Future<AddressModel> updateAddress(AddressModel address) =>
      _api.updateAddress(address);

  Future<void> deleteAddress(String addressId) =>
      _api.deleteAddress(addressId);

  Future<void> setDefaultAddress(String addressId) =>
      _api.setDefaultAddress(addressId);
}


