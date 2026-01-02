// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  String get id => throw _privateConstructorUsedError;
  String get serviceId => throw _privateConstructorUsedError;
  String get serviceTitle => throw _privateConstructorUsedError;
  String get serviceImageUrl => throw _privateConstructorUsedError;
  String get workerId => throw _privateConstructorUsedError;
  String get workerName => throw _privateConstructorUsedError;
  String? get workerImageUrl => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  BookingStatus get status => throw _privateConstructorUsedError;
  String get packageType => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get fee => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
    BookingModel value,
    $Res Function(BookingModel) then,
  ) = _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call({
    String id,
    String serviceId,
    String serviceTitle,
    String serviceImageUrl,
    String workerId,
    String workerName,
    String? workerImageUrl,
    String location,
    DateTime date,
    BookingStatus status,
    String packageType,
    double price,
    double? fee,
    double? total,
    String? rating,
    String? review,
  });
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceId = null,
    Object? serviceTitle = null,
    Object? serviceImageUrl = null,
    Object? workerId = null,
    Object? workerName = null,
    Object? workerImageUrl = freezed,
    Object? location = null,
    Object? date = null,
    Object? status = null,
    Object? packageType = null,
    Object? price = null,
    Object? fee = freezed,
    Object? total = freezed,
    Object? rating = freezed,
    Object? review = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            serviceId: null == serviceId
                ? _value.serviceId
                : serviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            serviceTitle: null == serviceTitle
                ? _value.serviceTitle
                : serviceTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            serviceImageUrl: null == serviceImageUrl
                ? _value.serviceImageUrl
                : serviceImageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            workerId: null == workerId
                ? _value.workerId
                : workerId // ignore: cast_nullable_to_non_nullable
                      as String,
            workerName: null == workerName
                ? _value.workerName
                : workerName // ignore: cast_nullable_to_non_nullable
                      as String,
            workerImageUrl: freezed == workerImageUrl
                ? _value.workerImageUrl
                : workerImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BookingStatus,
            packageType: null == packageType
                ? _value.packageType
                : packageType // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            fee: freezed == fee
                ? _value.fee
                : fee // ignore: cast_nullable_to_non_nullable
                      as double?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String?,
            review: freezed == review
                ? _value.review
                : review // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
    _$BookingModelImpl value,
    $Res Function(_$BookingModelImpl) then,
  ) = __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String serviceId,
    String serviceTitle,
    String serviceImageUrl,
    String workerId,
    String workerName,
    String? workerImageUrl,
    String location,
    DateTime date,
    BookingStatus status,
    String packageType,
    double price,
    double? fee,
    double? total,
    String? rating,
    String? review,
  });
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
    _$BookingModelImpl _value,
    $Res Function(_$BookingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceId = null,
    Object? serviceTitle = null,
    Object? serviceImageUrl = null,
    Object? workerId = null,
    Object? workerName = null,
    Object? workerImageUrl = freezed,
    Object? location = null,
    Object? date = null,
    Object? status = null,
    Object? packageType = null,
    Object? price = null,
    Object? fee = freezed,
    Object? total = freezed,
    Object? rating = freezed,
    Object? review = freezed,
  }) {
    return _then(
      _$BookingModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceId: null == serviceId
            ? _value.serviceId
            : serviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceTitle: null == serviceTitle
            ? _value.serviceTitle
            : serviceTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceImageUrl: null == serviceImageUrl
            ? _value.serviceImageUrl
            : serviceImageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        workerId: null == workerId
            ? _value.workerId
            : workerId // ignore: cast_nullable_to_non_nullable
                  as String,
        workerName: null == workerName
            ? _value.workerName
            : workerName // ignore: cast_nullable_to_non_nullable
                  as String,
        workerImageUrl: freezed == workerImageUrl
            ? _value.workerImageUrl
            : workerImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BookingStatus,
        packageType: null == packageType
            ? _value.packageType
            : packageType // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        fee: freezed == fee
            ? _value.fee
            : fee // ignore: cast_nullable_to_non_nullable
                  as double?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String?,
        review: freezed == review
            ? _value.review
            : review // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl({
    required this.id,
    required this.serviceId,
    required this.serviceTitle,
    required this.serviceImageUrl,
    required this.workerId,
    required this.workerName,
    this.workerImageUrl,
    required this.location,
    required this.date,
    required this.status,
    required this.packageType,
    required this.price,
    this.fee,
    this.total,
    this.rating,
    this.review,
  });

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  final String id;
  @override
  final String serviceId;
  @override
  final String serviceTitle;
  @override
  final String serviceImageUrl;
  @override
  final String workerId;
  @override
  final String workerName;
  @override
  final String? workerImageUrl;
  @override
  final String location;
  @override
  final DateTime date;
  @override
  final BookingStatus status;
  @override
  final String packageType;
  @override
  final double price;
  @override
  final double? fee;
  @override
  final double? total;
  @override
  final String? rating;
  @override
  final String? review;

  @override
  String toString() {
    return 'BookingModel(id: $id, serviceId: $serviceId, serviceTitle: $serviceTitle, serviceImageUrl: $serviceImageUrl, workerId: $workerId, workerName: $workerName, workerImageUrl: $workerImageUrl, location: $location, date: $date, status: $status, packageType: $packageType, price: $price, fee: $fee, total: $total, rating: $rating, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.serviceTitle, serviceTitle) ||
                other.serviceTitle == serviceTitle) &&
            (identical(other.serviceImageUrl, serviceImageUrl) ||
                other.serviceImageUrl == serviceImageUrl) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.workerName, workerName) ||
                other.workerName == workerName) &&
            (identical(other.workerImageUrl, workerImageUrl) ||
                other.workerImageUrl == workerImageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    serviceId,
    serviceTitle,
    serviceImageUrl,
    workerId,
    workerName,
    workerImageUrl,
    location,
    date,
    status,
    packageType,
    price,
    fee,
    total,
    rating,
    review,
  );

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(this);
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel({
    required final String id,
    required final String serviceId,
    required final String serviceTitle,
    required final String serviceImageUrl,
    required final String workerId,
    required final String workerName,
    final String? workerImageUrl,
    required final String location,
    required final DateTime date,
    required final BookingStatus status,
    required final String packageType,
    required final double price,
    final double? fee,
    final double? total,
    final String? rating,
    final String? review,
  }) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  String get id;
  @override
  String get serviceId;
  @override
  String get serviceTitle;
  @override
  String get serviceImageUrl;
  @override
  String get workerId;
  @override
  String get workerName;
  @override
  String? get workerImageUrl;
  @override
  String get location;
  @override
  DateTime get date;
  @override
  BookingStatus get status;
  @override
  String get packageType;
  @override
  double get price;
  @override
  double? get fee;
  @override
  double? get total;
  @override
  String? get rating;
  @override
  String? get review;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
