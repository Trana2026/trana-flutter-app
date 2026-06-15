// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_draft_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractDraftEntity {

 String get publicCode; ContractStatus get status; String get disputeState; DeliveryType? get deliveryType; ConsentType? get consentType; String? get tradingPlatform; String? get title; int? get price; String? get conditionSummary; String? get conditionDetails; int get warrantyPeriodDays; DateTime? get guardianConsentAt; int get version; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDraftEntityCopyWith<ContractDraftEntity> get copyWith => _$ContractDraftEntityCopyWithImpl<ContractDraftEntity>(this as ContractDraftEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDraftEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.disputeState, disputeState) || other.disputeState == disputeState)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,disputeState,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,guardianConsentAt,version,createdAt,updatedAt);

@override
String toString() {
  return 'ContractDraftEntity(publicCode: $publicCode, status: $status, disputeState: $disputeState, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, guardianConsentAt: $guardianConsentAt, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ContractDraftEntityCopyWith<$Res>  {
  factory $ContractDraftEntityCopyWith(ContractDraftEntity value, $Res Function(ContractDraftEntity) _then) = _$ContractDraftEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, ContractStatus status, String disputeState, DeliveryType? deliveryType, ConsentType? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? guardianConsentAt, int version, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ContractDraftEntityCopyWithImpl<$Res>
    implements $ContractDraftEntityCopyWith<$Res> {
  _$ContractDraftEntityCopyWithImpl(this._self, this._then);

  final ContractDraftEntity _self;
  final $Res Function(ContractDraftEntity) _then;

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? disputeState = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? guardianConsentAt = freezed,Object? version = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,disputeState: null == disputeState ? _self.disputeState : disputeState // ignore: cast_nullable_to_non_nullable
as String,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as ConsentType?,tradingPlatform: freezed == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,conditionSummary: freezed == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String?,conditionDetails: freezed == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String?,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,guardianConsentAt: freezed == guardianConsentAt ? _self.guardianConsentAt : guardianConsentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractDraftEntity].
extension ContractDraftEntityPatterns on ContractDraftEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDraftEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDraftEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDraftEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractDraftEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDraftEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDraftEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  String disputeState,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDraftEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  String disputeState,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractDraftEntity():
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  ContractStatus status,  String disputeState,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractDraftEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractDraftEntity implements ContractDraftEntity {
  const _ContractDraftEntity({required this.publicCode, required this.status, required this.disputeState, this.deliveryType, this.consentType, this.tradingPlatform, this.title, this.price, this.conditionSummary, this.conditionDetails, required this.warrantyPeriodDays, this.guardianConsentAt, required this.version, required this.createdAt, required this.updatedAt});
  

@override final  String publicCode;
@override final  ContractStatus status;
@override final  String disputeState;
@override final  DeliveryType? deliveryType;
@override final  ConsentType? consentType;
@override final  String? tradingPlatform;
@override final  String? title;
@override final  int? price;
@override final  String? conditionSummary;
@override final  String? conditionDetails;
@override final  int warrantyPeriodDays;
@override final  DateTime? guardianConsentAt;
@override final  int version;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDraftEntityCopyWith<_ContractDraftEntity> get copyWith => __$ContractDraftEntityCopyWithImpl<_ContractDraftEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDraftEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.disputeState, disputeState) || other.disputeState == disputeState)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,disputeState,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,guardianConsentAt,version,createdAt,updatedAt);

@override
String toString() {
  return 'ContractDraftEntity(publicCode: $publicCode, status: $status, disputeState: $disputeState, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, guardianConsentAt: $guardianConsentAt, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractDraftEntityCopyWith<$Res> implements $ContractDraftEntityCopyWith<$Res> {
  factory _$ContractDraftEntityCopyWith(_ContractDraftEntity value, $Res Function(_ContractDraftEntity) _then) = __$ContractDraftEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, ContractStatus status, String disputeState, DeliveryType? deliveryType, ConsentType? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? guardianConsentAt, int version, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ContractDraftEntityCopyWithImpl<$Res>
    implements _$ContractDraftEntityCopyWith<$Res> {
  __$ContractDraftEntityCopyWithImpl(this._self, this._then);

  final _ContractDraftEntity _self;
  final $Res Function(_ContractDraftEntity) _then;

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? disputeState = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? guardianConsentAt = freezed,Object? version = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ContractDraftEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,disputeState: null == disputeState ? _self.disputeState : disputeState // ignore: cast_nullable_to_non_nullable
as String,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as ConsentType?,tradingPlatform: freezed == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,conditionSummary: freezed == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String?,conditionDetails: freezed == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String?,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,guardianConsentAt: freezed == guardianConsentAt ? _self.guardianConsentAt : guardianConsentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
