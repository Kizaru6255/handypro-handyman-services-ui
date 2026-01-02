// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      serviceId: json['serviceId'] as String,
      serviceTitle: json['serviceTitle'] as String,
      serviceImageUrl: json['serviceImageUrl'] as String,
      workerId: json['workerId'] as String,
      workerName: json['workerName'] as String,
      workerImageUrl: json['workerImageUrl'] as String?,
      location: json['location'] as String,
      date: DateTime.parse(json['date'] as String),
      status: $enumDecode(_$BookingStatusEnumMap, json['status']),
      packageType: json['packageType'] as String,
      price: (json['price'] as num).toDouble(),
      fee: (json['fee'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      rating: json['rating'] as String?,
      review: json['review'] as String?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceId': instance.serviceId,
      'serviceTitle': instance.serviceTitle,
      'serviceImageUrl': instance.serviceImageUrl,
      'workerId': instance.workerId,
      'workerName': instance.workerName,
      'workerImageUrl': instance.workerImageUrl,
      'location': instance.location,
      'date': instance.date.toIso8601String(),
      'status': _$BookingStatusEnumMap[instance.status]!,
      'packageType': instance.packageType,
      'price': instance.price,
      'fee': instance.fee,
      'total': instance.total,
      'rating': instance.rating,
      'review': instance.review,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.accepted: 'accepted',
  BookingStatus.inProgress: 'in_progress',
  BookingStatus.completed: 'completed',
  BookingStatus.canceled: 'canceled',
};
