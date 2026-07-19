// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailContractState {

// ContractEntity 필드
 Role? get myRole; bool get isCreator; int get attachmentCount; String? get firstAttachmentUrl;// 공통 계약 정보
 String get publicCode; ContractStatus get status; DeliveryType? get deliveryType; ConsentType? get consentType; String? get tradingPlatform; String? get title; int? get price; String? get conditionSummary; String? get conditionDetails; int get warrantyPeriodDays; DateTime? get createdAt; DateTime? get updatedAt;// 계약 첨부 사진
 List<int> get attachmentIds; List<String> get attachmentImageUrls;// PDF 미리보기
 Uint8List? get pdfBytes; String? get pdfUrl;// 위험 신호
 bool get hasReportHistory; bool get trustScoreZero; int? get counterpartyTrustScore; String? get counterpartyTrustGrade; bool get counterpartyIsMinor; bool get counterpartyVerified; int get counterpartyTradeCount; int get counterpartyDisputeCount; int get counterpartyConfirmedReportCount; bool get isLoadingData;// 계약 상세 정보 조회 로딩중 여부
 String? get error;
/// Create a copy of DetailContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailContractStateCopyWith<DetailContractState> get copyWith => _$DetailContractStateCopyWithImpl<DetailContractState>(this as DetailContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailContractState&&(identical(other.myRole, myRole) || other.myRole == myRole)&&(identical(other.isCreator, isCreator) || other.isCreator == isCreator)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount)&&(identical(other.firstAttachmentUrl, firstAttachmentUrl) || other.firstAttachmentUrl == firstAttachmentUrl)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.attachmentIds, attachmentIds)&&const DeepCollectionEquality().equals(other.attachmentImageUrls, attachmentImageUrls)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.hasReportHistory, hasReportHistory) || other.hasReportHistory == hasReportHistory)&&(identical(other.trustScoreZero, trustScoreZero) || other.trustScoreZero == trustScoreZero)&&(identical(other.counterpartyTrustScore, counterpartyTrustScore) || other.counterpartyTrustScore == counterpartyTrustScore)&&(identical(other.counterpartyTrustGrade, counterpartyTrustGrade) || other.counterpartyTrustGrade == counterpartyTrustGrade)&&(identical(other.counterpartyIsMinor, counterpartyIsMinor) || other.counterpartyIsMinor == counterpartyIsMinor)&&(identical(other.counterpartyVerified, counterpartyVerified) || other.counterpartyVerified == counterpartyVerified)&&(identical(other.counterpartyTradeCount, counterpartyTradeCount) || other.counterpartyTradeCount == counterpartyTradeCount)&&(identical(other.counterpartyDisputeCount, counterpartyDisputeCount) || other.counterpartyDisputeCount == counterpartyDisputeCount)&&(identical(other.counterpartyConfirmedReportCount, counterpartyConfirmedReportCount) || other.counterpartyConfirmedReportCount == counterpartyConfirmedReportCount)&&(identical(other.isLoadingData, isLoadingData) || other.isLoadingData == isLoadingData)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hashAll([runtimeType,myRole,isCreator,attachmentCount,firstAttachmentUrl,publicCode,status,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,createdAt,updatedAt,const DeepCollectionEquality().hash(attachmentIds),const DeepCollectionEquality().hash(attachmentImageUrls),const DeepCollectionEquality().hash(pdfBytes),pdfUrl,hasReportHistory,trustScoreZero,counterpartyTrustScore,counterpartyTrustGrade,counterpartyIsMinor,counterpartyVerified,counterpartyTradeCount,counterpartyDisputeCount,counterpartyConfirmedReportCount,isLoadingData,error]);

@override
String toString() {
  return 'DetailContractState(myRole: $myRole, isCreator: $isCreator, attachmentCount: $attachmentCount, firstAttachmentUrl: $firstAttachmentUrl, publicCode: $publicCode, status: $status, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, createdAt: $createdAt, updatedAt: $updatedAt, attachmentIds: $attachmentIds, attachmentImageUrls: $attachmentImageUrls, pdfBytes: $pdfBytes, pdfUrl: $pdfUrl, hasReportHistory: $hasReportHistory, trustScoreZero: $trustScoreZero, counterpartyTrustScore: $counterpartyTrustScore, counterpartyTrustGrade: $counterpartyTrustGrade, counterpartyIsMinor: $counterpartyIsMinor, counterpartyVerified: $counterpartyVerified, counterpartyTradeCount: $counterpartyTradeCount, counterpartyDisputeCount: $counterpartyDisputeCount, counterpartyConfirmedReportCount: $counterpartyConfirmedReportCount, isLoadingData: $isLoadingData, error: $error)';
}


}

/// @nodoc
abstract mixin class $DetailContractStateCopyWith<$Res>  {
  factory $DetailContractStateCopyWith(DetailContractState value, $Res Function(DetailContractState) _then) = _$DetailContractStateCopyWithImpl;
@useResult
$Res call({
 Role? myRole, bool isCreator, int attachmentCount, String? firstAttachmentUrl, String publicCode, ContractStatus status, DeliveryType? deliveryType, ConsentType? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? createdAt, DateTime? updatedAt, List<int> attachmentIds, List<String> attachmentImageUrls, Uint8List? pdfBytes, String? pdfUrl, bool hasReportHistory, bool trustScoreZero, int? counterpartyTrustScore, String? counterpartyTrustGrade, bool counterpartyIsMinor, bool counterpartyVerified, int counterpartyTradeCount, int counterpartyDisputeCount, int counterpartyConfirmedReportCount, bool isLoadingData, String? error
});




}
/// @nodoc
class _$DetailContractStateCopyWithImpl<$Res>
    implements $DetailContractStateCopyWith<$Res> {
  _$DetailContractStateCopyWithImpl(this._self, this._then);

  final DetailContractState _self;
  final $Res Function(DetailContractState) _then;

/// Create a copy of DetailContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myRole = freezed,Object? isCreator = null,Object? attachmentCount = null,Object? firstAttachmentUrl = freezed,Object? publicCode = null,Object? status = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attachmentIds = null,Object? attachmentImageUrls = null,Object? pdfBytes = freezed,Object? pdfUrl = freezed,Object? hasReportHistory = null,Object? trustScoreZero = null,Object? counterpartyTrustScore = freezed,Object? counterpartyTrustGrade = freezed,Object? counterpartyIsMinor = null,Object? counterpartyVerified = null,Object? counterpartyTradeCount = null,Object? counterpartyDisputeCount = null,Object? counterpartyConfirmedReportCount = null,Object? isLoadingData = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
myRole: freezed == myRole ? _self.myRole : myRole // ignore: cast_nullable_to_non_nullable
as Role?,isCreator: null == isCreator ? _self.isCreator : isCreator // ignore: cast_nullable_to_non_nullable
as bool,attachmentCount: null == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int,firstAttachmentUrl: freezed == firstAttachmentUrl ? _self.firstAttachmentUrl : firstAttachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as ConsentType?,tradingPlatform: freezed == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,conditionSummary: freezed == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String?,conditionDetails: freezed == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String?,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attachmentIds: null == attachmentIds ? _self.attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<int>,attachmentImageUrls: null == attachmentImageUrls ? _self.attachmentImageUrls : attachmentImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,hasReportHistory: null == hasReportHistory ? _self.hasReportHistory : hasReportHistory // ignore: cast_nullable_to_non_nullable
as bool,trustScoreZero: null == trustScoreZero ? _self.trustScoreZero : trustScoreZero // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTrustScore: freezed == counterpartyTrustScore ? _self.counterpartyTrustScore : counterpartyTrustScore // ignore: cast_nullable_to_non_nullable
as int?,counterpartyTrustGrade: freezed == counterpartyTrustGrade ? _self.counterpartyTrustGrade : counterpartyTrustGrade // ignore: cast_nullable_to_non_nullable
as String?,counterpartyIsMinor: null == counterpartyIsMinor ? _self.counterpartyIsMinor : counterpartyIsMinor // ignore: cast_nullable_to_non_nullable
as bool,counterpartyVerified: null == counterpartyVerified ? _self.counterpartyVerified : counterpartyVerified // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTradeCount: null == counterpartyTradeCount ? _self.counterpartyTradeCount : counterpartyTradeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyDisputeCount: null == counterpartyDisputeCount ? _self.counterpartyDisputeCount : counterpartyDisputeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyConfirmedReportCount: null == counterpartyConfirmedReportCount ? _self.counterpartyConfirmedReportCount : counterpartyConfirmedReportCount // ignore: cast_nullable_to_non_nullable
as int,isLoadingData: null == isLoadingData ? _self.isLoadingData : isLoadingData // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailContractState].
extension DetailContractStatePatterns on DetailContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailContractState value)  $default,){
final _that = this;
switch (_that) {
case _DetailContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailContractState value)?  $default,){
final _that = this;
switch (_that) {
case _DetailContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Role? myRole,  bool isCreator,  int attachmentCount,  String? firstAttachmentUrl,  String publicCode,  ContractStatus status,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? createdAt,  DateTime? updatedAt,  List<int> attachmentIds,  List<String> attachmentImageUrls,  Uint8List? pdfBytes,  String? pdfUrl,  bool hasReportHistory,  bool trustScoreZero,  int? counterpartyTrustScore,  String? counterpartyTrustGrade,  bool counterpartyIsMinor,  bool counterpartyVerified,  int counterpartyTradeCount,  int counterpartyDisputeCount,  int counterpartyConfirmedReportCount,  bool isLoadingData,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailContractState() when $default != null:
return $default(_that.myRole,_that.isCreator,_that.attachmentCount,_that.firstAttachmentUrl,_that.publicCode,_that.status,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.createdAt,_that.updatedAt,_that.attachmentIds,_that.attachmentImageUrls,_that.pdfBytes,_that.pdfUrl,_that.hasReportHistory,_that.trustScoreZero,_that.counterpartyTrustScore,_that.counterpartyTrustGrade,_that.counterpartyIsMinor,_that.counterpartyVerified,_that.counterpartyTradeCount,_that.counterpartyDisputeCount,_that.counterpartyConfirmedReportCount,_that.isLoadingData,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Role? myRole,  bool isCreator,  int attachmentCount,  String? firstAttachmentUrl,  String publicCode,  ContractStatus status,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? createdAt,  DateTime? updatedAt,  List<int> attachmentIds,  List<String> attachmentImageUrls,  Uint8List? pdfBytes,  String? pdfUrl,  bool hasReportHistory,  bool trustScoreZero,  int? counterpartyTrustScore,  String? counterpartyTrustGrade,  bool counterpartyIsMinor,  bool counterpartyVerified,  int counterpartyTradeCount,  int counterpartyDisputeCount,  int counterpartyConfirmedReportCount,  bool isLoadingData,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DetailContractState():
return $default(_that.myRole,_that.isCreator,_that.attachmentCount,_that.firstAttachmentUrl,_that.publicCode,_that.status,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.createdAt,_that.updatedAt,_that.attachmentIds,_that.attachmentImageUrls,_that.pdfBytes,_that.pdfUrl,_that.hasReportHistory,_that.trustScoreZero,_that.counterpartyTrustScore,_that.counterpartyTrustGrade,_that.counterpartyIsMinor,_that.counterpartyVerified,_that.counterpartyTradeCount,_that.counterpartyDisputeCount,_that.counterpartyConfirmedReportCount,_that.isLoadingData,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Role? myRole,  bool isCreator,  int attachmentCount,  String? firstAttachmentUrl,  String publicCode,  ContractStatus status,  DeliveryType? deliveryType,  ConsentType? consentType,  String? tradingPlatform,  String? title,  int? price,  String? conditionSummary,  String? conditionDetails,  int warrantyPeriodDays,  DateTime? createdAt,  DateTime? updatedAt,  List<int> attachmentIds,  List<String> attachmentImageUrls,  Uint8List? pdfBytes,  String? pdfUrl,  bool hasReportHistory,  bool trustScoreZero,  int? counterpartyTrustScore,  String? counterpartyTrustGrade,  bool counterpartyIsMinor,  bool counterpartyVerified,  int counterpartyTradeCount,  int counterpartyDisputeCount,  int counterpartyConfirmedReportCount,  bool isLoadingData,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DetailContractState() when $default != null:
return $default(_that.myRole,_that.isCreator,_that.attachmentCount,_that.firstAttachmentUrl,_that.publicCode,_that.status,_that.deliveryType,_that.consentType,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.createdAt,_that.updatedAt,_that.attachmentIds,_that.attachmentImageUrls,_that.pdfBytes,_that.pdfUrl,_that.hasReportHistory,_that.trustScoreZero,_that.counterpartyTrustScore,_that.counterpartyTrustGrade,_that.counterpartyIsMinor,_that.counterpartyVerified,_that.counterpartyTradeCount,_that.counterpartyDisputeCount,_that.counterpartyConfirmedReportCount,_that.isLoadingData,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DetailContractState extends DetailContractState {
  const _DetailContractState({this.myRole, this.isCreator = false, this.attachmentCount = 0, this.firstAttachmentUrl, this.publicCode = '', this.status = ContractStatus.draft, this.deliveryType, this.consentType, this.tradingPlatform, this.title, this.price, this.conditionSummary, this.conditionDetails, this.warrantyPeriodDays = 0, this.createdAt, this.updatedAt, final  List<int> attachmentIds = const [], final  List<String> attachmentImageUrls = const [], this.pdfBytes, this.pdfUrl, this.hasReportHistory = false, this.trustScoreZero = false, this.counterpartyTrustScore, this.counterpartyTrustGrade, this.counterpartyIsMinor = false, this.counterpartyVerified = false, this.counterpartyTradeCount = 0, this.counterpartyDisputeCount = 0, this.counterpartyConfirmedReportCount = 0, this.isLoadingData = false, this.error}): _attachmentIds = attachmentIds,_attachmentImageUrls = attachmentImageUrls,super._();
  

// ContractEntity 필드
@override final  Role? myRole;
@override@JsonKey() final  bool isCreator;
@override@JsonKey() final  int attachmentCount;
@override final  String? firstAttachmentUrl;
// 공통 계약 정보
@override@JsonKey() final  String publicCode;
@override@JsonKey() final  ContractStatus status;
@override final  DeliveryType? deliveryType;
@override final  ConsentType? consentType;
@override final  String? tradingPlatform;
@override final  String? title;
@override final  int? price;
@override final  String? conditionSummary;
@override final  String? conditionDetails;
@override@JsonKey() final  int warrantyPeriodDays;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// 계약 첨부 사진
 final  List<int> _attachmentIds;
// 계약 첨부 사진
@override@JsonKey() List<int> get attachmentIds {
  if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentIds);
}

 final  List<String> _attachmentImageUrls;
@override@JsonKey() List<String> get attachmentImageUrls {
  if (_attachmentImageUrls is EqualUnmodifiableListView) return _attachmentImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentImageUrls);
}

// PDF 미리보기
@override final  Uint8List? pdfBytes;
@override final  String? pdfUrl;
// 위험 신호
@override@JsonKey() final  bool hasReportHistory;
@override@JsonKey() final  bool trustScoreZero;
@override final  int? counterpartyTrustScore;
@override final  String? counterpartyTrustGrade;
@override@JsonKey() final  bool counterpartyIsMinor;
@override@JsonKey() final  bool counterpartyVerified;
@override@JsonKey() final  int counterpartyTradeCount;
@override@JsonKey() final  int counterpartyDisputeCount;
@override@JsonKey() final  int counterpartyConfirmedReportCount;
@override@JsonKey() final  bool isLoadingData;
// 계약 상세 정보 조회 로딩중 여부
@override final  String? error;

/// Create a copy of DetailContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailContractStateCopyWith<_DetailContractState> get copyWith => __$DetailContractStateCopyWithImpl<_DetailContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailContractState&&(identical(other.myRole, myRole) || other.myRole == myRole)&&(identical(other.isCreator, isCreator) || other.isCreator == isCreator)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount)&&(identical(other.firstAttachmentUrl, firstAttachmentUrl) || other.firstAttachmentUrl == firstAttachmentUrl)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._attachmentIds, _attachmentIds)&&const DeepCollectionEquality().equals(other._attachmentImageUrls, _attachmentImageUrls)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.hasReportHistory, hasReportHistory) || other.hasReportHistory == hasReportHistory)&&(identical(other.trustScoreZero, trustScoreZero) || other.trustScoreZero == trustScoreZero)&&(identical(other.counterpartyTrustScore, counterpartyTrustScore) || other.counterpartyTrustScore == counterpartyTrustScore)&&(identical(other.counterpartyTrustGrade, counterpartyTrustGrade) || other.counterpartyTrustGrade == counterpartyTrustGrade)&&(identical(other.counterpartyIsMinor, counterpartyIsMinor) || other.counterpartyIsMinor == counterpartyIsMinor)&&(identical(other.counterpartyVerified, counterpartyVerified) || other.counterpartyVerified == counterpartyVerified)&&(identical(other.counterpartyTradeCount, counterpartyTradeCount) || other.counterpartyTradeCount == counterpartyTradeCount)&&(identical(other.counterpartyDisputeCount, counterpartyDisputeCount) || other.counterpartyDisputeCount == counterpartyDisputeCount)&&(identical(other.counterpartyConfirmedReportCount, counterpartyConfirmedReportCount) || other.counterpartyConfirmedReportCount == counterpartyConfirmedReportCount)&&(identical(other.isLoadingData, isLoadingData) || other.isLoadingData == isLoadingData)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hashAll([runtimeType,myRole,isCreator,attachmentCount,firstAttachmentUrl,publicCode,status,deliveryType,consentType,tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,createdAt,updatedAt,const DeepCollectionEquality().hash(_attachmentIds),const DeepCollectionEquality().hash(_attachmentImageUrls),const DeepCollectionEquality().hash(pdfBytes),pdfUrl,hasReportHistory,trustScoreZero,counterpartyTrustScore,counterpartyTrustGrade,counterpartyIsMinor,counterpartyVerified,counterpartyTradeCount,counterpartyDisputeCount,counterpartyConfirmedReportCount,isLoadingData,error]);

@override
String toString() {
  return 'DetailContractState(myRole: $myRole, isCreator: $isCreator, attachmentCount: $attachmentCount, firstAttachmentUrl: $firstAttachmentUrl, publicCode: $publicCode, status: $status, deliveryType: $deliveryType, consentType: $consentType, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, createdAt: $createdAt, updatedAt: $updatedAt, attachmentIds: $attachmentIds, attachmentImageUrls: $attachmentImageUrls, pdfBytes: $pdfBytes, pdfUrl: $pdfUrl, hasReportHistory: $hasReportHistory, trustScoreZero: $trustScoreZero, counterpartyTrustScore: $counterpartyTrustScore, counterpartyTrustGrade: $counterpartyTrustGrade, counterpartyIsMinor: $counterpartyIsMinor, counterpartyVerified: $counterpartyVerified, counterpartyTradeCount: $counterpartyTradeCount, counterpartyDisputeCount: $counterpartyDisputeCount, counterpartyConfirmedReportCount: $counterpartyConfirmedReportCount, isLoadingData: $isLoadingData, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DetailContractStateCopyWith<$Res> implements $DetailContractStateCopyWith<$Res> {
  factory _$DetailContractStateCopyWith(_DetailContractState value, $Res Function(_DetailContractState) _then) = __$DetailContractStateCopyWithImpl;
@override @useResult
$Res call({
 Role? myRole, bool isCreator, int attachmentCount, String? firstAttachmentUrl, String publicCode, ContractStatus status, DeliveryType? deliveryType, ConsentType? consentType, String? tradingPlatform, String? title, int? price, String? conditionSummary, String? conditionDetails, int warrantyPeriodDays, DateTime? createdAt, DateTime? updatedAt, List<int> attachmentIds, List<String> attachmentImageUrls, Uint8List? pdfBytes, String? pdfUrl, bool hasReportHistory, bool trustScoreZero, int? counterpartyTrustScore, String? counterpartyTrustGrade, bool counterpartyIsMinor, bool counterpartyVerified, int counterpartyTradeCount, int counterpartyDisputeCount, int counterpartyConfirmedReportCount, bool isLoadingData, String? error
});




}
/// @nodoc
class __$DetailContractStateCopyWithImpl<$Res>
    implements _$DetailContractStateCopyWith<$Res> {
  __$DetailContractStateCopyWithImpl(this._self, this._then);

  final _DetailContractState _self;
  final $Res Function(_DetailContractState) _then;

/// Create a copy of DetailContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myRole = freezed,Object? isCreator = null,Object? attachmentCount = null,Object? firstAttachmentUrl = freezed,Object? publicCode = null,Object? status = null,Object? deliveryType = freezed,Object? consentType = freezed,Object? tradingPlatform = freezed,Object? title = freezed,Object? price = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,Object? warrantyPeriodDays = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attachmentIds = null,Object? attachmentImageUrls = null,Object? pdfBytes = freezed,Object? pdfUrl = freezed,Object? hasReportHistory = null,Object? trustScoreZero = null,Object? counterpartyTrustScore = freezed,Object? counterpartyTrustGrade = freezed,Object? counterpartyIsMinor = null,Object? counterpartyVerified = null,Object? counterpartyTradeCount = null,Object? counterpartyDisputeCount = null,Object? counterpartyConfirmedReportCount = null,Object? isLoadingData = null,Object? error = freezed,}) {
  return _then(_DetailContractState(
myRole: freezed == myRole ? _self.myRole : myRole // ignore: cast_nullable_to_non_nullable
as Role?,isCreator: null == isCreator ? _self.isCreator : isCreator // ignore: cast_nullable_to_non_nullable
as bool,attachmentCount: null == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int,firstAttachmentUrl: freezed == firstAttachmentUrl ? _self.firstAttachmentUrl : firstAttachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,deliveryType: freezed == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as ConsentType?,tradingPlatform: freezed == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,conditionSummary: freezed == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String?,conditionDetails: freezed == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String?,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attachmentIds: null == attachmentIds ? _self._attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<int>,attachmentImageUrls: null == attachmentImageUrls ? _self._attachmentImageUrls : attachmentImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,hasReportHistory: null == hasReportHistory ? _self.hasReportHistory : hasReportHistory // ignore: cast_nullable_to_non_nullable
as bool,trustScoreZero: null == trustScoreZero ? _self.trustScoreZero : trustScoreZero // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTrustScore: freezed == counterpartyTrustScore ? _self.counterpartyTrustScore : counterpartyTrustScore // ignore: cast_nullable_to_non_nullable
as int?,counterpartyTrustGrade: freezed == counterpartyTrustGrade ? _self.counterpartyTrustGrade : counterpartyTrustGrade // ignore: cast_nullable_to_non_nullable
as String?,counterpartyIsMinor: null == counterpartyIsMinor ? _self.counterpartyIsMinor : counterpartyIsMinor // ignore: cast_nullable_to_non_nullable
as bool,counterpartyVerified: null == counterpartyVerified ? _self.counterpartyVerified : counterpartyVerified // ignore: cast_nullable_to_non_nullable
as bool,counterpartyTradeCount: null == counterpartyTradeCount ? _self.counterpartyTradeCount : counterpartyTradeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyDisputeCount: null == counterpartyDisputeCount ? _self.counterpartyDisputeCount : counterpartyDisputeCount // ignore: cast_nullable_to_non_nullable
as int,counterpartyConfirmedReportCount: null == counterpartyConfirmedReportCount ? _self.counterpartyConfirmedReportCount : counterpartyConfirmedReportCount // ignore: cast_nullable_to_non_nullable
as int,isLoadingData: null == isLoadingData ? _self.isLoadingData : isLoadingData // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
