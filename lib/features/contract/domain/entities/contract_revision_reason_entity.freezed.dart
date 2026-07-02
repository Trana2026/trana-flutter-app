// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_revision_reason_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractRevisionReasonEntity {

 int get requesterUserId; String? get deliveryTypeReason; String? get tradingPlatformReason; String? get titleReason; String? get priceReason; String? get conditionSummaryReason; String? get conditionDetailsReason; DateTime get requestedAt;
/// Create a copy of ContractRevisionReasonEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractRevisionReasonEntityCopyWith<ContractRevisionReasonEntity> get copyWith => _$ContractRevisionReasonEntityCopyWithImpl<ContractRevisionReasonEntity>(this as ContractRevisionReasonEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractRevisionReasonEntity&&(identical(other.requesterUserId, requesterUserId) || other.requesterUserId == requesterUserId)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.tradingPlatformReason, tradingPlatformReason) || other.tradingPlatformReason == tradingPlatformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}


@override
int get hashCode => Object.hash(runtimeType,requesterUserId,deliveryTypeReason,tradingPlatformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,requestedAt);

@override
String toString() {
  return 'ContractRevisionReasonEntity(requesterUserId: $requesterUserId, deliveryTypeReason: $deliveryTypeReason, tradingPlatformReason: $tradingPlatformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $ContractRevisionReasonEntityCopyWith<$Res>  {
  factory $ContractRevisionReasonEntityCopyWith(ContractRevisionReasonEntity value, $Res Function(ContractRevisionReasonEntity) _then) = _$ContractRevisionReasonEntityCopyWithImpl;
@useResult
$Res call({
 int requesterUserId, String? deliveryTypeReason, String? tradingPlatformReason, String? titleReason, String? priceReason, String? conditionSummaryReason, String? conditionDetailsReason, DateTime requestedAt
});




}
/// @nodoc
class _$ContractRevisionReasonEntityCopyWithImpl<$Res>
    implements $ContractRevisionReasonEntityCopyWith<$Res> {
  _$ContractRevisionReasonEntityCopyWithImpl(this._self, this._then);

  final ContractRevisionReasonEntity _self;
  final $Res Function(ContractRevisionReasonEntity) _then;

/// Create a copy of ContractRevisionReasonEntity
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


/// Adds pattern-matching-related methods to [ContractRevisionReasonEntity].
extension ContractRevisionReasonEntityPatterns on ContractRevisionReasonEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractRevisionReasonEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractRevisionReasonEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractRevisionReasonEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractRevisionReasonEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractRevisionReasonEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractRevisionReasonEntity() when $default != null:
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
case _ContractRevisionReasonEntity() when $default != null:
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
case _ContractRevisionReasonEntity():
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
case _ContractRevisionReasonEntity() when $default != null:
return $default(_that.requesterUserId,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractRevisionReasonEntity implements ContractRevisionReasonEntity {
  const _ContractRevisionReasonEntity({required this.requesterUserId, this.deliveryTypeReason, this.tradingPlatformReason, this.titleReason, this.priceReason, this.conditionSummaryReason, this.conditionDetailsReason, required this.requestedAt});
  

@override final  int requesterUserId;
@override final  String? deliveryTypeReason;
@override final  String? tradingPlatformReason;
@override final  String? titleReason;
@override final  String? priceReason;
@override final  String? conditionSummaryReason;
@override final  String? conditionDetailsReason;
@override final  DateTime requestedAt;

/// Create a copy of ContractRevisionReasonEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractRevisionReasonEntityCopyWith<_ContractRevisionReasonEntity> get copyWith => __$ContractRevisionReasonEntityCopyWithImpl<_ContractRevisionReasonEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractRevisionReasonEntity&&(identical(other.requesterUserId, requesterUserId) || other.requesterUserId == requesterUserId)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.tradingPlatformReason, tradingPlatformReason) || other.tradingPlatformReason == tradingPlatformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}


@override
int get hashCode => Object.hash(runtimeType,requesterUserId,deliveryTypeReason,tradingPlatformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,requestedAt);

@override
String toString() {
  return 'ContractRevisionReasonEntity(requesterUserId: $requesterUserId, deliveryTypeReason: $deliveryTypeReason, tradingPlatformReason: $tradingPlatformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractRevisionReasonEntityCopyWith<$Res> implements $ContractRevisionReasonEntityCopyWith<$Res> {
  factory _$ContractRevisionReasonEntityCopyWith(_ContractRevisionReasonEntity value, $Res Function(_ContractRevisionReasonEntity) _then) = __$ContractRevisionReasonEntityCopyWithImpl;
@override @useResult
$Res call({
 int requesterUserId, String? deliveryTypeReason, String? tradingPlatformReason, String? titleReason, String? priceReason, String? conditionSummaryReason, String? conditionDetailsReason, DateTime requestedAt
});




}
/// @nodoc
class __$ContractRevisionReasonEntityCopyWithImpl<$Res>
    implements _$ContractRevisionReasonEntityCopyWith<$Res> {
  __$ContractRevisionReasonEntityCopyWithImpl(this._self, this._then);

  final _ContractRevisionReasonEntity _self;
  final $Res Function(_ContractRevisionReasonEntity) _then;

/// Create a copy of ContractRevisionReasonEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requesterUserId = null,Object? deliveryTypeReason = freezed,Object? tradingPlatformReason = freezed,Object? titleReason = freezed,Object? priceReason = freezed,Object? conditionSummaryReason = freezed,Object? conditionDetailsReason = freezed,Object? requestedAt = null,}) {
  return _then(_ContractRevisionReasonEntity(
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
