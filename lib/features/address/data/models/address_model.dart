import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

enum AddressType {
  @JsonValue('home')
  home,
  @JsonValue('work')
  work,
  @JsonValue('other')
  other,
}

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    required String name,
    required String phoneNumber,
    required String houseNumber,
    required String street,
    required String city,
    required String state,
    required String zipCode,
    required double latitude,
    required double longitude,
    required AddressType type,
    @Default(false) bool isDefault,
    String? landmark,
    String? instructions,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}


