// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return _ServiceModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  double? get priceMin => throw _privateConstructorUsedError;
  double? get priceMax => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  bool? get isRecommended => throw _privateConstructorUsedError;
  bool? get isTopRated => throw _privateConstructorUsedError;

  /// Serializes this ServiceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceModelCopyWith<ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
    ServiceModel value,
    $Res Function(ServiceModel) then,
  ) = _$ServiceModelCopyWithImpl<$Res, ServiceModel>;
  @useResult
  $Res call({
    String id,
    String title,
    String imageUrl,
    String? description,
    String? location,
    double? rating,
    int? reviewCount,
    double? priceMin,
    double? priceMax,
    String? categoryId,
    bool? isRecommended,
    bool? isTopRated,
  });
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res, $Val extends ServiceModel>
    implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? priceMin = freezed,
    Object? priceMax = freezed,
    Object? categoryId = freezed,
    Object? isRecommended = freezed,
    Object? isTopRated = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            reviewCount: freezed == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            priceMin: freezed == priceMin
                ? _value.priceMin
                : priceMin // ignore: cast_nullable_to_non_nullable
                      as double?,
            priceMax: freezed == priceMax
                ? _value.priceMax
                : priceMax // ignore: cast_nullable_to_non_nullable
                      as double?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRecommended: freezed == isRecommended
                ? _value.isRecommended
                : isRecommended // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isTopRated: freezed == isTopRated
                ? _value.isTopRated
                : isTopRated // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceModelImplCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$$ServiceModelImplCopyWith(
    _$ServiceModelImpl value,
    $Res Function(_$ServiceModelImpl) then,
  ) = __$$ServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String imageUrl,
    String? description,
    String? location,
    double? rating,
    int? reviewCount,
    double? priceMin,
    double? priceMax,
    String? categoryId,
    bool? isRecommended,
    bool? isTopRated,
  });
}

/// @nodoc
class __$$ServiceModelImplCopyWithImpl<$Res>
    extends _$ServiceModelCopyWithImpl<$Res, _$ServiceModelImpl>
    implements _$$ServiceModelImplCopyWith<$Res> {
  __$$ServiceModelImplCopyWithImpl(
    _$ServiceModelImpl _value,
    $Res Function(_$ServiceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? priceMin = freezed,
    Object? priceMax = freezed,
    Object? categoryId = freezed,
    Object? isRecommended = freezed,
    Object? isTopRated = freezed,
  }) {
    return _then(
      _$ServiceModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        reviewCount: freezed == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        priceMin: freezed == priceMin
            ? _value.priceMin
            : priceMin // ignore: cast_nullable_to_non_nullable
                  as double?,
        priceMax: freezed == priceMax
            ? _value.priceMax
            : priceMax // ignore: cast_nullable_to_non_nullable
                  as double?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRecommended: freezed == isRecommended
            ? _value.isRecommended
            : isRecommended // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isTopRated: freezed == isTopRated
            ? _value.isTopRated
            : isTopRated // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceModelImpl implements _ServiceModel {
  const _$ServiceModelImpl({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.location,
    this.rating,
    this.reviewCount,
    this.priceMin,
    this.priceMax,
    this.categoryId,
    this.isRecommended,
    this.isTopRated,
  });

  factory _$ServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String? description;
  @override
  final String? location;
  @override
  final double? rating;
  @override
  final int? reviewCount;
  @override
  final double? priceMin;
  @override
  final double? priceMax;
  @override
  final String? categoryId;
  @override
  final bool? isRecommended;
  @override
  final bool? isTopRated;

  @override
  String toString() {
    return 'ServiceModel(id: $id, title: $title, imageUrl: $imageUrl, description: $description, location: $location, rating: $rating, reviewCount: $reviewCount, priceMin: $priceMin, priceMax: $priceMax, categoryId: $categoryId, isRecommended: $isRecommended, isTopRated: $isTopRated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.priceMin, priceMin) ||
                other.priceMin == priceMin) &&
            (identical(other.priceMax, priceMax) ||
                other.priceMax == priceMax) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            (identical(other.isTopRated, isTopRated) ||
                other.isTopRated == isTopRated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    imageUrl,
    description,
    location,
    rating,
    reviewCount,
    priceMin,
    priceMax,
    categoryId,
    isRecommended,
    isTopRated,
  );

  /// Create a copy of ServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceModelImplCopyWith<_$ServiceModelImpl> get copyWith =>
      __$$ServiceModelImplCopyWithImpl<_$ServiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceModelImplToJson(this);
  }
}

abstract class _ServiceModel implements ServiceModel {
  const factory _ServiceModel({
    required final String id,
    required final String title,
    required final String imageUrl,
    final String? description,
    final String? location,
    final double? rating,
    final int? reviewCount,
    final double? priceMin,
    final double? priceMax,
    final String? categoryId,
    final bool? isRecommended,
    final bool? isTopRated,
  }) = _$ServiceModelImpl;

  factory _ServiceModel.fromJson(Map<String, dynamic> json) =
      _$ServiceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  String? get description;
  @override
  String? get location;
  @override
  double? get rating;
  @override
  int? get reviewCount;
  @override
  double? get priceMin;
  @override
  double? get priceMax;
  @override
  String? get categoryId;
  @override
  bool? get isRecommended;
  @override
  bool? get isTopRated;

  /// Create a copy of ServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceModelImplCopyWith<_$ServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
