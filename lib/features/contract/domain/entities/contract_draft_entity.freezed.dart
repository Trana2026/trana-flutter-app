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

 String get publicCode; ContractStatus get status; DisputeState get disputeState; DeliveryType? get deliveryType; ConsentType? get consentType; String? get tradingPlatform; String? get title; int? get price; String? get conditionSummary; String? get conditionDetails; int get warrantyPeriodDays; DateTime? get guardianConsentAt; int get version; DateTime get createdAt; DateTime get updatedAt; ContractRiskSignalsEntity? get riskSignals;
/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDraftEntityCopyWith<ContractDraftEntity> get copyWith => _$ContractDraftEntityCopyWithImpl<ContractDraftEntity>(this as ContractDraftEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDraftEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.disputeState, disputeState) || other.disputeState == disputeState)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.riskSignals, riskSignals) || other.riskSignals == riskSignals));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,disputeState,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,guardianConsentAt,version,createdAt,updatedAt,riskSignals);

@override
String toString() {
  return 'ContractDraftEntity(publicCode: $publicCode, status: $status, disputeState: $disputeState, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, guardianConsentAt: $guardianConsentAt, version: $version, createdAt: $createdAt, updatedAt: $updatedAt, riskSignals: $riskSignals)';
}


}

/// @nodoc
abstract mixin class $ContractDraftEntityCopyWith<$Res>  {
  factory $ContractDraftEntityCopyWith(ContractDraftEntity value, $Res Function(ContractDraftEntity) _then) = _$ContractDraftEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, ContractStatus status, DisputeState disputeState, DeliveryType? deliveryType, ConsentType? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? guardianConsentAt, int version, DateTime createdAt, DateTime updatedAt, ContractRiskSignalsEntity? riskSignals
});


$ContractRiskSignalsEntityCopyWith<$Res>? get riskSignals;

}
/// @nodoc
class _$ContractDraftEntityCopyWithImpl<$Res>
    implements $ContractDraftEntityCopyWith<$Res> {
  _$ContractDraftEntityCopyWithImpl(this._self, this._then);

  final ContractDraftEntity _self;
  final $Res Function(ContractDraftEntity) _then;

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? disputeState = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? guardianConsentAt = freezed,Object? version = null,Object? createdAt = null,Object? updatedAt = null,Object? riskSignals = freezed,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,disputeState: null == disputeState ? _self.disputeState : disputeState // ignore: cast_nullable_to_non_nullable
as DisputeState,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
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
as DateTime,riskSignals: freezed == riskSignals ? _self.riskSignals : riskSignals // ignore: cast_nullable_to_non_nullable
as ContractRiskSignalsEntity?,
  ));
}
/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractRiskSignalsEntityCopyWith<$Res>? get riskSignals {
    if (_self.riskSignals == null) {
    return null;
  }

  return $ContractRiskSignalsEntityCopyWith<$Res>(_self.riskSignals!, (value) {
    return _then(_self.copyWith(riskSignals: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  DisputeState disputeState,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt,  ContractRiskSignalsEntity? riskSignals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDraftEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt,_that.riskSignals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  DisputeState disputeState,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt,  ContractRiskSignalsEntity? riskSignals)  $default,) {final _that = this;
switch (_that) {
case _ContractDraftEntity():
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt,_that.riskSignals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  ContractStatus status,  DisputeState disputeState,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? guardianConsentAt,  int version,  DateTime createdAt,  DateTime updatedAt,  ContractRiskSignalsEntity? riskSignals)?  $default,) {final _that = this;
switch (_that) {
case _ContractDraftEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.disputeState,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.guardianConsentAt,_that.version,_that.createdAt,_that.updatedAt,_that.riskSignals);case _:
  return null;

}
}

}

/// @nodoc


class _ContractDraftEntity implements ContractDraftEntity {
  const _ContractDraftEntity({required this.publicCode, required this.status, required this.disputeState, this.deliveryType, this.consentType, this.tradingPlatform, this.title, this.price, this.conditionSummary, this.conditionDetails, required this.warrantyPeriodDays, this.guardianConsentAt, required this.version, required this.createdAt, required this.updatedAt, this.riskSignals});
  

@override final  String publicCode;
@override final  ContractStatus status;
@override final  DisputeState disputeState;
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
@override final  ContractRiskSignalsEntity? riskSignals;

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDraftEntityCopyWith<_ContractDraftEntity> get copyWith => __$ContractDraftEntityCopyWithImpl<_ContractDraftEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDraftEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.disputeState, disputeState) || other.disputeState == disputeState)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.riskSignals, riskSignals) || other.riskSignals == riskSignals));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,disputeState,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,guardianConsentAt,version,createdAt,updatedAt,riskSignals);

@override
String toString() {
  return 'ContractDraftEntity(publicCode: $publicCode, status: $status, disputeState: $disputeState, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, guardianConsentAt: $guardianConsentAt, version: $version, createdAt: $createdAt, updatedAt: $updatedAt, riskSignals: $riskSignals)';
}


}

/// @nodoc
abstract mixin class _$ContractDraftEntityCopyWith<$Res> implements $ContractDraftEntityCopyWith<$Res> {
  factory _$ContractDraftEntityCopyWith(_ContractDraftEntity value, $Res Function(_ContractDraftEntity) _then) = __$ContractDraftEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, ContractStatus status, DisputeState disputeState, DeliveryType? deliveryType, ConsentType? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? guardianConsentAt, int version, DateTime createdAt, DateTime updatedAt, ContractRiskSignalsEntity? riskSignals
});


@override $ContractRiskSignalsEntityCopyWith<$Res>? get riskSignals;

}
/// @nodoc
class __$ContractDraftEntityCopyWithImpl<$Res>
    implements _$ContractDraftEntityCopyWith<$Res> {
  __$ContractDraftEntityCopyWithImpl(this._self, this._then);

  final _ContractDraftEntity _self;
  final $Res Function(_ContractDraftEntity) _then;

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? disputeState = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? guardianConsentAt = freezed,Object? version = null,Object? createdAt = null,Object? updatedAt = null,Object? riskSignals = freezed,}) {
  return _then(_ContractDraftEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,disputeState: null == disputeState ? _self.disputeState : disputeState // ignore: cast_nullable_to_non_nullable
as DisputeState,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
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
as DateTime,riskSignals: freezed == riskSignals ? _self.riskSignals : riskSignals // ignore: cast_nullable_to_non_nullable
as ContractRiskSignalsEntity?,
  ));
}

/// Create a copy of ContractDraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractRiskSignalsEntityCopyWith<$Res>? get riskSignals {
    if (_self.riskSignals == null) {
    return null;
  }

  return $ContractRiskSignalsEntityCopyWith<$Res>(_self.riskSignals!, (value) {
    return _then(_self.copyWith(riskSignals: value));
  });
}
}

/// @nodoc
mixin _$ContractRiskSignalsEntity {

 bool get hasReportHistory; bool get trustScoreZero; int? get counterpartyTrustScore; String? get counterpartyTrustGrade; bool get counterpartyIsMinor; bool get counterpartyVerified; int get counterpartyTradeCount; int get counterpartyDisputeCount; int get counterpartyConfirmedReportCount;
/// Create a copy of ContractRiskSignalsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractRiskSignalsEntityCopyWith<ContractRiskSignalsEntity> get copyWith => _$ContractRiskSignalsEntityCopyWithImpl<ContractRiskSignalsEntity>(this as ContractRiskSignalsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractRiskSignalsEntity&&(identical(other.hasReportHistory, hasReportHistory) || other.hasReportHistory == hasReportHistory)&&(identical(other.trustScoreZero, trustScoreZero) || other.trustScoreZero == trustScoreZero)&&(identical(other.counterpartyTrustScore, counterpartyTrustScore) || other.counterpartyTrustScore == counterpartyTrustScore)&&(identical(other.counterpartyTrustGrade, counterpartyTrustGrade) || other.counterpartyTrustGrade == counterpartyTrustGrade)&&(identical(other.counterpartyIsMinor, counterpartyIsMinor) || other.counterpartyIsMinor == counterpartyIsMinor)&&(identical(other.counterpartyVerified, counterpartyVerified) || other.counterpartyVerified == counterpartyVerified)&&(identical(other.counterpartyTradeCount, counterpartyTradeCount) || other.counterpartyTradeCount == counterpartyTradeCount)&&(identical(other.counterpartyDisputeCount, counterpartyDisputeCount) || other.counterpartyDisputeCount == counterpartyDisputeCount)&&(identical(other.counterpartyConfirmedReportCount, counterpartyConfirmedReportCount) || other.counterpartyConfirmedReportCount == counterpartyConfirmedReportCount));
}


@override
int get hashCode => Object.hash(runtimeType,hasReportHistory,trustScoreZero,counterpartyTrustScore,counterpartyTrustGrade,counterpartyIsMinor,counterpartyVerified,counterpartyTradeCount,counterpartyDisputeCount,counterpartyConfirmedReportCount);

@override
String toString() {
  return 'ContractRiskSignalsEntity(hasReportHistory: $hasReportHistory, trustScoreZero: $trustScoreZero, counterpartyTrustScore: $counterpartyTrustScore, counterpartyTrustGrade: $counterpartyTrustGrade, counterpartyIsMinor: $counterpartyIsMinor, counterpartyVerified: $counterpartyVerified, counterpartyTradeCount: $counterpartyTradeCount, counterpartyDisputeCount: $counterpartyDisputeCount, counterpartyConfirmedReportCount: $counterpartyConfirmedReportCount)';
}


}

/// @nodoc
abstract mixin class $ContractRiskSignalsEntityCopyWith<$Res>  {
  factory $ContractRiskSignalsEntityCopyWith(ContractRiskSignalsEntity value, $Res Function(ContractRiskSignalsEntity) _then) = _$ContractRiskSignalsEntityCopyWithImpl;
@useResult
$Res call({
 bool hasReportHistory, bool trustScoreZero, int? counterpartyTrustScore, String? counterpartyTrustGrade, bool counterpartyIsMinor, bool counterpartyVerified, int counterpartyTradeCount, int counterpartyDisputeCount, int counterpartyConfirmedReportCount
});




}
/// @nodoc
class _$ContractRiskSignalsEntityCopyWithImpl<$Res>
    implements $ContractRiskSignalsEntityCopyWith<$Res> {
  _$ContractRiskSignalsEntityCopyWithImpl(this._self, this._then);

  final ContractRiskSignalsEntity _self;
  final $Res Function(ContractRiskSignalsEntity) _then;

/// Create a copy of ContractRiskSignalsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasReportHistory = null,Object? trustScoreZero = null,Object? counterpartyTrustScore = freezed,Object? counterpartyTrustGrade = freezed,Object? counterpartyIsMinor = null,Object? counterpartyVerified = null,Object? counterpartyTradeCount = null,Object? counterpartyDisputeCount = null,Object? counterpartyConfirmedReportCount = null,}) {
  return _then(_self.copyWith(
hasReportHistory: null == hasReportHistory ? _self.hasReportHistory : hasReportHistory // ignore: cast_nullable_to_non_nullable
as bool,trustScoreZero: null == trustScoreZero ? _self.trustScoreZero : trustScoreZero // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTrustScore: freezed == counterpartyTrustScore ? _self.counterpartyTrustScore : counterpartyTrustScore // ignore: cast_nullable_to_non_nullable
as int?,counterpartyTrustGrade: freezed == counterpartyTrustGrade ? _self.counterpartyTrustGrade : counterpartyTrustGrade // ignore: cast_nullable_to_non_nullable
as String?,counterpartyIsMinor: null == counterpartyIsMinor ? _self.counterpartyIsMinor : counterpartyIsMinor // ignore: cast_nullable_to_non_nullable
as bool,counterpartyVerified: null == counterpartyVerified ? _self.counterpartyVerified : counterpartyVerified // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTradeCount: null == counterpartyTradeCount ? _self.counterpartyTradeCount : counterpartyTradeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyDisputeCount: null == counterpartyDisputeCount ? _self.counterpartyDisputeCount : counterpartyDisputeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyConfirmedReportCount: null == counterpartyConfirmedReportCount ? _self.counterpartyConfirmedReportCount : counterpartyConfirmedReportCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractRiskSignalsEntity].
extension ContractRiskSignalsEntityPatterns on ContractRiskSignalsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractRiskSignalsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractRiskSignalsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractRiskSignalsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractRiskSignalsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractRiskSignalsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractRiskSignalsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasReportHistory,  bool trustScoreZero,  int? counterpartyTrustScore,  String? counterpartyTrustGrade,  bool counterpartyIsMinor,  bool counterpartyVerified,  int counterpartyTradeCount,  int counterpartyDisputeCount,  int counterpartyConfirmedReportCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractRiskSignalsEntity() when $default != null:
return $default(_that.hasReportHistory,_that.trustScoreZero,_that.counterpartyTrustScore,_that.counterpartyTrustGrade,_that.counterpartyIsMinor,_that.counterpartyVerified,_that.counterpartyTradeCount,_that.counterpartyDisputeCount,_that.counterpartyConfirmedReportCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasReportHistory,  bool trustScoreZero,  int? counterpartyTrustScore,  String? counterpartyTrustGrade,  bool counterpartyIsMinor,  bool counterpartyVerified,  int counterpartyTradeCount,  int counterpartyDisputeCount,  int counterpartyConfirmedReportCount)  $default,) {final _that = this;
switch (_that) {
case _ContractRiskSignalsEntity():
return $default(_that.hasReportHistory,_that.trustScoreZero,_that.counterpartyTrustScore,_that.counterpartyTrustGrade,_that.counterpartyIsMinor,_that.counterpartyVerified,_that.counterpartyTradeCount,_that.counterpartyDisputeCount,_that.counterpartyConfirmedReportCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasReportHistory,  bool trustScoreZero,  int? counterpartyTrustScore,  String? counterpartyTrustGrade,  bool counterpartyIsMinor,  bool counterpartyVerified,  int counterpartyTradeCount,  int counterpartyDisputeCount,  int counterpartyConfirmedReportCount)?  $default,) {final _that = this;
switch (_that) {
case _ContractRiskSignalsEntity() when $default != null:
return $default(_that.hasReportHistory,_that.trustScoreZero,_that.counterpartyTrustScore,_that.counterpartyTrustGrade,_that.counterpartyIsMinor,_that.counterpartyVerified,_that.counterpartyTradeCount,_that.counterpartyDisputeCount,_that.counterpartyConfirmedReportCount);case _:
  return null;

}
}

}

/// @nodoc


class _ContractRiskSignalsEntity implements ContractRiskSignalsEntity {
  const _ContractRiskSignalsEntity({this.hasReportHistory = false, this.trustScoreZero = false, this.counterpartyTrustScore, this.counterpartyTrustGrade, this.counterpartyIsMinor = false, this.counterpartyVerified = false, this.counterpartyTradeCount = 0, this.counterpartyDisputeCount = 0, this.counterpartyConfirmedReportCount = 0});
  

@override@JsonKey() final  bool hasReportHistory;
@override@JsonKey() final  bool trustScoreZero;
@override final  int? counterpartyTrustScore;
@override final  String? counterpartyTrustGrade;
@override@JsonKey() final  bool counterpartyIsMinor;
@override@JsonKey() final  bool counterpartyVerified;
@override@JsonKey() final  int counterpartyTradeCount;
@override@JsonKey() final  int counterpartyDisputeCount;
@override@JsonKey() final  int counterpartyConfirmedReportCount;

/// Create a copy of ContractRiskSignalsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractRiskSignalsEntityCopyWith<_ContractRiskSignalsEntity> get copyWith => __$ContractRiskSignalsEntityCopyWithImpl<_ContractRiskSignalsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractRiskSignalsEntity&&(identical(other.hasReportHistory, hasReportHistory) || other.hasReportHistory == hasReportHistory)&&(identical(other.trustScoreZero, trustScoreZero) || other.trustScoreZero == trustScoreZero)&&(identical(other.counterpartyTrustScore, counterpartyTrustScore) || other.counterpartyTrustScore == counterpartyTrustScore)&&(identical(other.counterpartyTrustGrade, counterpartyTrustGrade) || other.counterpartyTrustGrade == counterpartyTrustGrade)&&(identical(other.counterpartyIsMinor, counterpartyIsMinor) || other.counterpartyIsMinor == counterpartyIsMinor)&&(identical(other.counterpartyVerified, counterpartyVerified) || other.counterpartyVerified == counterpartyVerified)&&(identical(other.counterpartyTradeCount, counterpartyTradeCount) || other.counterpartyTradeCount == counterpartyTradeCount)&&(identical(other.counterpartyDisputeCount, counterpartyDisputeCount) || other.counterpartyDisputeCount == counterpartyDisputeCount)&&(identical(other.counterpartyConfirmedReportCount, counterpartyConfirmedReportCount) || other.counterpartyConfirmedReportCount == counterpartyConfirmedReportCount));
}


@override
int get hashCode => Object.hash(runtimeType,hasReportHistory,trustScoreZero,counterpartyTrustScore,counterpartyTrustGrade,counterpartyIsMinor,counterpartyVerified,counterpartyTradeCount,counterpartyDisputeCount,counterpartyConfirmedReportCount);

@override
String toString() {
  return 'ContractRiskSignalsEntity(hasReportHistory: $hasReportHistory, trustScoreZero: $trustScoreZero, counterpartyTrustScore: $counterpartyTrustScore, counterpartyTrustGrade: $counterpartyTrustGrade, counterpartyIsMinor: $counterpartyIsMinor, counterpartyVerified: $counterpartyVerified, counterpartyTradeCount: $counterpartyTradeCount, counterpartyDisputeCount: $counterpartyDisputeCount, counterpartyConfirmedReportCount: $counterpartyConfirmedReportCount)';
}


}

/// @nodoc
abstract mixin class _$ContractRiskSignalsEntityCopyWith<$Res> implements $ContractRiskSignalsEntityCopyWith<$Res> {
  factory _$ContractRiskSignalsEntityCopyWith(_ContractRiskSignalsEntity value, $Res Function(_ContractRiskSignalsEntity) _then) = __$ContractRiskSignalsEntityCopyWithImpl;
@override @useResult
$Res call({
 bool hasReportHistory, bool trustScoreZero, int? counterpartyTrustScore, String? counterpartyTrustGrade, bool counterpartyIsMinor, bool counterpartyVerified, int counterpartyTradeCount, int counterpartyDisputeCount, int counterpartyConfirmedReportCount
});




}
/// @nodoc
class __$ContractRiskSignalsEntityCopyWithImpl<$Res>
    implements _$ContractRiskSignalsEntityCopyWith<$Res> {
  __$ContractRiskSignalsEntityCopyWithImpl(this._self, this._then);

  final _ContractRiskSignalsEntity _self;
  final $Res Function(_ContractRiskSignalsEntity) _then;

/// Create a copy of ContractRiskSignalsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasReportHistory = null,Object? trustScoreZero = null,Object? counterpartyTrustScore = freezed,Object? counterpartyTrustGrade = freezed,Object? counterpartyIsMinor = null,Object? counterpartyVerified = null,Object? counterpartyTradeCount = null,Object? counterpartyDisputeCount = null,Object? counterpartyConfirmedReportCount = null,}) {
  return _then(_ContractRiskSignalsEntity(
hasReportHistory: null == hasReportHistory ? _self.hasReportHistory : hasReportHistory // ignore: cast_nullable_to_non_nullable
as bool,trustScoreZero: null == trustScoreZero ? _self.trustScoreZero : trustScoreZero // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTrustScore: freezed == counterpartyTrustScore ? _self.counterpartyTrustScore : counterpartyTrustScore // ignore: cast_nullable_to_non_nullable
as int?,counterpartyTrustGrade: freezed == counterpartyTrustGrade ? _self.counterpartyTrustGrade : counterpartyTrustGrade // ignore: cast_nullable_to_non_nullable
as String?,counterpartyIsMinor: null == counterpartyIsMinor ? _self.counterpartyIsMinor : counterpartyIsMinor // ignore: cast_nullable_to_non_nullable
as bool,counterpartyVerified: null == counterpartyVerified ? _self.counterpartyVerified : counterpartyVerified // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTradeCount: null == counterpartyTradeCount ? _self.counterpartyTradeCount : counterpartyTradeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyDisputeCount: null == counterpartyDisputeCount ? _self.counterpartyDisputeCount : counterpartyDisputeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyConfirmedReportCount: null == counterpartyConfirmedReportCount ? _self.counterpartyConfirmedReportCount : counterpartyConfirmedReportCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
