import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

enum BookingStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('canceled')
  canceled,
}

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String serviceId,
    required String serviceTitle,
    required String serviceImageUrl,
    required String workerId,
    required String workerName,
    String? workerImageUrl,
    required String location,
    required DateTime date,
    required BookingStatus status,
    required String packageType,
    required double price,
    double? fee,
    double? total,
    String? rating,
    String? review,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}


