import 'package:dio/dio.dart';
import 'models/address_model.dart';

/// Address API
class AddressApi {
  AddressApi(this._dio);

  final Dio _dio;

  Future<List<AddressModel>> getAddresses() async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      AddressModel(
        id: '1',
        name: 'Aaron Ramsdale',
        phoneNumber: '+1 (409) 487-1935',
        houseNumber: '123',
        street: 'Main Street',
        city: 'Brooklyn',
        state: 'New York',
        zipCode: '11201',
        latitude: 40.6782,
        longitude: -73.9442,
        type: AddressType.home,
        isDefault: true,
      ),
    ];
  }

  Future<AddressModel> addAddress(AddressModel address) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return address.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString());
  }

  Future<AddressModel> updateAddress(AddressModel address) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return address;
  }

  Future<void> deleteAddress(String addressId) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> setDefaultAddress(String addressId) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 300));
  }
}


