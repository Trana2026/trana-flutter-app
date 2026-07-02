// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_revision_reason_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractRevisionReasonDto {

 int get requesterUserId; String? get deliveryTypeReason; String? get tradingPlatformReason; String? get titleReason; String? get priceReason; String? get conditionSummaryReason; String? get conditionDetailsReason; DateTime get requestedAt;
/// Create a copy of ContractRevisionReasonDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractRevisionReasonDtoCopyWith<ContractRevisionReasonDto> get copyWith => _$ContractRevisionReasonDtoCopyWithImpl<ContractRevisionReasonDto>(this as ContractRevisionReasonDto, _$identity);

  /// Serializes this ContractRevisionReasonDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractRevisionReasonDto&&(identical(other.requesterUserId, requesterUserId) || other.requesterUserId == requesterUserId)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.tradingPlatformReason, tradingPlatformReason) || other.tradingPlatformReason == tradingPlatformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requesterUserId,deliveryTypeReason,tradingPlatformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,requestedAt);

@override
String toString() {
  return 'ContractRevisionReasonDto(requesterUserId: $requesterUserId, deliveryTypeReason: $deliveryTypeReason, tradingPlatformReason: $tradingPlatformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $ContractRevisionReasonDtoCopyWith<$Res>  {
  factory $ContractRevisionReasonDtoCopyWith(ContractRevisionReasonDto value, $Res Function(ContractRevisionReasonDto) _then) = _$ContractRevisionReasonDtoCopyWithImpl;
@useResult
$Res call({
 int requesterUserId, String? deliveryTypeReason, String? tradingPlatformReason, String? titleReason, String? priceReason, String? conditionSummaryReason, String? conditionDetailsReason, DateTime requestedAt
});




}
/// @nodoc
class _$ContractRevisionReasonDtoCopyWithImpl<$Res>
    implements $ContractRevisionReasonDtoCopyWith<$Res> {
  _$ContractRevisionReasonDtoCopyWithImpl(this._self, this._then);

  final ContractRevisionReasonDto _self;
  final $Res Function(ContractRevisionReasonDto) _then;

/// Create a copy of ContractRevisionReasonDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requesterUserId = null,Object? deliveryTypeReason = freezed,Object? tradingPlatformReason = freezed,Object? titleReason = freezed,Object? priceReason = freezed,Object? conditionSummaryReason = freezed,Object? conditionDetailsReason = freezed,Object? requestedAt = null,}) {
  return _then(_self.copyWith(
requesterUserId: null == requesterUserId ? _self.requesterUserId : requesterUserId // ignore: cast_nullable_to_non_nullable
as int,deliveryTypeReason: freezed == deliveryTypeReason ? _self.deliveryTypeReason : deliveryTypeReason // ignore: cast_nullable_to_non_nullable
as String?,tradingPlatformReason: freezed == tradingPlatformReason ? _self.tradingPlatformReason : tradingPlatformReason // ignore: cast_nullable_to_non_nullable
as String?,titleReason: freezed == titleReason ? _self.titleReason : titleReason // ignore: cast_nullable_to_non_nullable
as String?,priceReason: freezed == priceReason ? _self.priceReason : priceReason // ignore: cast_nullable_to_non_nullable
as String?,conditionSummaryReason: freezed == conditionSummaryReason ? _self.conditionSummaryReason : conditionSummaryReason // ignore: cast_nullable_to_non_nullable
as String?,conditionDetailsReason: freezed == conditionDetailsReason ? _self.conditionDetailsReason : conditionDetailsReason // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractRevisionReasonDto].
extension ContractRevisionReasonDtoPatterns on ContractRevisionReasonDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractRevisionReasonDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractRevisionReasonDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractRevisionReasonDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractRevisionReasonDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractRevisionReasonDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractRevisionReasonDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int requesterUserId,  String? deliveryTypeReason,  String? tradingPlatformReason,  String? titleReason,  String? priceReason,  String? conditionSummaryReason,  String? conditionDetailsReason,  DateTime requestedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractRevisionReasonDto() when $default != null:
return $default(_that.requesterUserId,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.requestedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int requesterUserId,  String? deliveryTypeReason,  String? tradingPlatformReason,  String? titleReason,  String? priceReason,  String? conditionSummaryReason,  String? conditionDetailsReason,  DateTime requestedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractRevisionReasonDto():
return $default(_that.requesterUserId,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.requestedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int requesterUserId,  String? deliveryTypeReason,  String? tradingPlatformReason,  String? titleReason,  String? priceReason,  String? conditionSummaryReason,  String? conditionDetailsReason,  DateTime requestedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractRevisionReasonDto() when $default != null:
return $default(_that.requesterUserId,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractRevisionReasonDto implements ContractRevisionReasonDto {
  const _ContractRevisionReasonDto({required this.requesterUserId, this.deliveryTypeReason, this.tradingPlatformReason, this.titleReason, this.priceReason, this.conditionSummaryReason, this.conditionDetailsReason, required this.requestedAt});
  factory _ContractRevisionReasonDto.fromJson(Map<String, dynamic> json) => _$ContractRevisionReasonDtoFromJson(json);

@override final  int requesterUserId;
@override final  String? deliveryTypeReason;
@override final  String? tradingPlatformReason;
@override final  String? titleReason;
@override final  String? priceReason;
@override final  String? conditionSummaryReason;
@override final  String? conditionDetailsReason;
@override final  DateTime requestedAt;

/// Create a copy of ContractRevisionReasonDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractRevisionReasonDtoCopyWith<_ContractRevisionReasonDto> get copyWith => __$ContractRevisionReasonDtoCopyWithImpl<_ContractRevisionReasonDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractRevisionReasonDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractRevisionReasonDto&&(identical(other.requesterUserId, requesterUserId) || other.requesterUserId == requesterUserId)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.tradingPlatformReason, tradingPlatformReason) || other.tradingPlatformReason == tradingPlatformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requesterUserId,deliveryTypeReason,tradingPlatformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,requestedAt);

@override
String toString() {
  return 'ContractRevisionReasonDto(requesterUserId: $requesterUserId, deliveryTypeReason: $deliveryTypeReason, tradingPlatformReason: $tradingPlatformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractRevisionReasonDtoCopyWith<$Res> implements $ContractRevisionReasonDtoCopyWith<$Res> {
  factory _$ContractRevisionReasonDtoCopyWith(_ContractRevisionReasonDto value, $Res Function(_ContractRevisionReasonDto) _then) = __$ContractRevisionReasonDtoCopyWithImpl;
@override @useResult
$Res call({
 int requesterUserId, String? deliveryTypeReason, String? tradingPlatformReason, String? titleReason, String? priceReason, String? conditionSummaryReason, String? conditionDetailsReason, DateTime requestedAt
});




}
/// @nodoc
class __$ContractRevisionReasonDtoCopyWithImpl<$Res>
    implements _$ContractRevisionReasonDtoCopyWith<$Res> {
  __$ContractRevisionReasonDtoCopyWithImpl(this._self, this._then);

  final _ContractRevisionReasonDto _self;
  final $Res Function(_ContractRevisionReasonDto) _then;

/// Create a copy of ContractRevisionReasonDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requesterUserId = null,Object? deliveryTypeReason = freezed,Object? tradingPlatformReason = freezed,Object? titleReason = freezed,Object? priceReason = freezed,Object? conditionSummaryReason = freezed,Object? conditionDetailsReason = freezed,Object? requestedAt = null,}) {
  return _then(_ContractRevisionReasonDto(
requesterUserId: null == requesterUserId ? _self.requesterUserId : requesterUserId // ignore: cast_nullable_to_non_nullable
as int,deliveryTypeReason: freezed == deliveryTypeReason ? _self.deliveryTypeReason : deliveryTypeReason // ignore: cast_nullable_to_non_nullable
as String?,tradingPlatformReason: freezed == tradingPlatformReason ? _self.tradingPlatformReason : tradingPlatformReason // ignore: cast_nullable_to_non_nullable
as String?,titleReason: freezed == titleReason ? _self.titleReason : titleReason // ignore: cast_nullable_to_non_nullable
as String?,priceReason: freezed == priceReason ? _self.priceReason : priceReason // ignore: cast_nullable_to_non_nullable
as String?,conditionSummaryReason: freezed == conditionSummaryReason ? _self.conditionSummaryReason : conditionSummaryReason // ignore: cast_nullable_to_non_nullable
as String?,conditionDetailsReason: freezed == conditionDetailsReason ? _self.conditionDetailsReason : conditionDetailsReason // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
