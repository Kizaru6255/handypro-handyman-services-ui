// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      location: json['location'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      priceMin: (json['priceMin'] as num?)?.toDouble(),
      priceMax: (json['priceMax'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String?,
      isRecommended: json['isRecommended'] as bool?,
      isTopRated: json['isTopRated'] as bool?,
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'location': instance.location,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'priceMin': instance.priceMin,
      'priceMax': instance.priceMax,
      'categoryId': instance.categoryId,
      'isRecommended': instance.isRecommended,
      'isTopRated': instance.isTopRated,
    };
