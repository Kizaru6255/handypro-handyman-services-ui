import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    required String id,
    required String title,
    required String imageUrl,
    String? description,
    String? location,
    double? rating,
    int? reviewCount,
    double? priceMin,
    double? priceMax,
    String? categoryId,
    bool? isRecommended,
    bool? isTopRated,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}


