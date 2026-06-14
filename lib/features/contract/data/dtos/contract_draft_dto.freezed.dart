// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_draft_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractDraftDto {

 String get publicCode; String get status; String get disputeState; String? get deliveryType; String? get consentType; String? get tradingPlatform; String? get title; int? get price; String? get conditionSummary; String? get conditionDetails; int get warrantyPeriodDays; DateTime? get guardianConsentAt; int get version; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ContractDraftDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDraftDtoCopyWith<ContractDraftDto> get copyWith => _$ContractDraftDtoCopyWithImpl<ContractDraftDto>(this as ContractDraftDto, _$identity);

  /// Serializes this ContractDraftDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDraftDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.disputeState, disputeState) || other.disputeState == disputeState)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,status,disputeState,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,guardianConsentAt,version,createdAt,updatedAt);

@override
String toString() {
  return 'ContractDraftDto(publicCode: $publicCode, status: $status, disputeState: $disputeState, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, guardianConsentAt: $guardianConsentAt, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ContractDraftDtoCopyWith<$Res>  {
  factory $ContractDraftDtoCopyWith(ContractDraftDto value, $Res Function(ContractDraftDto) _then) = _$ContractDraftDtoCopyWithImpl;
@useResult
$Res call({
 String publicCode, String status, String disputeState, String? deliveryType, String? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? guardianConsentAt, int version, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ContractDraftDtoCopyWithImpl<$Res>
    implements $ContractDraftDtoCopyWith<$Res> {
  _$ContractDraftDtoCopyWithImpl(this._self, this._then);

  final ContractDraftDto _self;
  final $Res Function(ContractDraftDto) _then;

/// Create a copy of ContractDraftDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? disputeState = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? guardianConsentAt = freezed,Object? version = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,disputeState: null == disputeState ? _self.disputeState : disputeState // ignore: cast_nullable_to_non_nullable
as String,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as String?,tradingPlatform: freezed == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ContractDraftDto].
extension ContractDraftDtoPatterns on ContractDraftDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDraftDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDraftDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDraftDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractDraftDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDraftDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDraftDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String status,  String disputeState,  String? deliveryType,  String? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDraftDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String status,  String disputeState,  String? deliveryType,  String? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractDraftDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String status,  String disputeState,  String? deliveryType,  String? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractDraftDto() when $default != null:
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractDraftDto implements ContractDraftDto {
  const _ContractDraftDto({required this.publicCode, required this.status, required this.disputeState, this.deliveryType, this.consentType, this.tradingPlatform, this.title, this.price, this.conditionSummary, this.conditionDetails, required this.warrantyPeriodDays, this.guardianConsentAt, required this.version, required this.createdAt, required this.updatedAt});
  factory _ContractDraftDto.fromJson(Map<String, dynamic> json) => _$ContractDraftDtoFromJson(json);

@override final  String publicCode;
@override final  String status;
@override final  String disputeState;
@override final  String? deliveryType;
@override final  String? consentType;
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

/// Create a copy of ContractDraftDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDraftDtoCopyWith<_ContractDraftDto> get copyWith => __$ContractDraftDtoCopyWithImpl<_ContractDraftDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractDraftDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDraftDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.disputeState, disputeState) || other.disputeState == disputeState)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,status,disputeState,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,guardianConsentAt,version,createdAt,updatedAt);

@override
String toString() {
  return 'ContractDraftDto(publicCode: $publicCode, status: $status, disputeState: $disputeState, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, guardianConsentAt: $guardianConsentAt, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractDraftDtoCopyWith<$Res> implements $ContractDraftDtoCopyWith<$Res> {
  factory _$ContractDraftDtoCopyWith(_ContractDraftDto value, $Res Function(_ContractDraftDto) _then) = __$ContractDraftDtoCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String status, String disputeState, String? deliveryType, String? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? guardianConsentAt, int version, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ContractDraftDtoCopyWithImpl<$Res>
    implements _$ContractDraftDtoCopyWith<$Res> {
  __$ContractDraftDtoCopyWithImpl(this._self, this._then);

  final _ContractDraftDto _self;
  final $Res Function(_ContractDraftDto) _then;

/// Create a copy of ContractDraftDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? disputeState = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? guardianConsentAt = freezed,Object? version = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ContractDraftDto(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,disputeState: null == disputeState ? _self.disputeState : disputeState // ignore: cast_nullable_to_non_nullable
as String,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as String?,tradingPlatform: freezed == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
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
