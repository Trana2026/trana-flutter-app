// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contracts_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractsEntity {

 int? get id; int get senderUserId;// 요청자 사용자 ID
 int? get recipientUserId;// 수신자 사용자 ID
 ContractStatus get status;// 거래 상태
 String get productName;// 상품명
 int get amount;// 거래 금액
 String get conditionSummary;// 상품 상태
 String get conditionDetails;// 상품 상세 설명
 TransactionMethod get transactionMethod;// 거래 방식
 bool get warranted;// 보증 제공 여부 (기본 3일)
 String get pdfS3Key;// S3 PDF 경로
 DateTime? get signedAt;// 양측 서명 일시
 DateTime? get completedAt;// 거래 완료 일시
 DateTime get createdAt;
/// Create a copy of ContractsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractsEntityCopyWith<ContractsEntity> get copyWith => _$ContractsEntityCopyWithImpl<ContractsEntity>(this as ContractsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.senderUserId, senderUserId) || other.senderUserId == senderUserId)&&(identical(other.recipientUserId, recipientUserId) || other.recipientUserId == recipientUserId)&&(identical(other.status, status) || other.status == status)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.transactionMethod, transactionMethod) || other.transactionMethod == transactionMethod)&&(identical(other.warranted, warranted) || other.warranted == warranted)&&(identical(other.pdfS3Key, pdfS3Key) || other.pdfS3Key == pdfS3Key)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,senderUserId,recipientUserId,status,productName,amount,conditionSummary,conditionDetails,transactionMethod,warranted,pdfS3Key,signedAt,completedAt,createdAt);

@override
String toString() {
  return 'ContractsEntity(id: $id, senderUserId: $senderUserId, recipientUserId: $recipientUserId, status: $status, productName: $productName, amount: $amount, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, transactionMethod: $transactionMethod, warranted: $warranted, pdfS3Key: $pdfS3Key, signedAt: $signedAt, completedAt: $completedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ContractsEntityCopyWith<$Res>  {
  factory $ContractsEntityCopyWith(ContractsEntity value, $Res Function(ContractsEntity) _then) = _$ContractsEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int senderUserId, int? recipientUserId, ContractStatus status, String productName, int amount, String conditionSummary, String conditionDetails, TransactionMethod transactionMethod, bool warranted, String pdfS3Key, DateTime? signedAt, DateTime? completedAt, DateTime createdAt
});




}
/// @nodoc
class _$ContractsEntityCopyWithImpl<$Res>
    implements $ContractsEntityCopyWith<$Res> {
  _$ContractsEntityCopyWithImpl(this._self, this._then);

  final ContractsEntity _self;
  final $Res Function(ContractsEntity) _then;

/// Create a copy of ContractsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? senderUserId = null,Object? recipientUserId = freezed,Object? status = null,Object? productName = null,Object? amount = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? transactionMethod = null,Object? warranted = null,Object? pdfS3Key = null,Object? signedAt = freezed,Object? completedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,senderUserId: null == senderUserId ? _self.senderUserId : senderUserId // ignore: cast_nullable_to_non_nullable
as int,recipientUserId: freezed == recipientUserId ? _self.recipientUserId : recipientUserId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,transactionMethod: null == transactionMethod ? _self.transactionMethod : transactionMethod // ignore: cast_nullable_to_non_nullable
as TransactionMethod,warranted: null == warranted ? _self.warranted : warranted // ignore: cast_nullable_to_non_nullable
as bool,pdfS3Key: null == pdfS3Key ? _self.pdfS3Key : pdfS3Key // ignore: cast_nullable_to_non_nullable
as String,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractsEntity].
extension ContractsEntityPatterns on ContractsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int senderUserId,  int? recipientUserId,  ContractStatus status,  String productName,  int amount,  String conditionSummary,  String conditionDetails,  TransactionMethod transactionMethod,  bool warranted,  String pdfS3Key,  DateTime? signedAt,  DateTime? completedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractsEntity() when $default != null:
return $default(_that.id,_that.senderUserId,_that.recipientUserId,_that.status,_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails,_that.transactionMethod,_that.warranted,_that.pdfS3Key,_that.signedAt,_that.completedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int senderUserId,  int? recipientUserId,  ContractStatus status,  String productName,  int amount,  String conditionSummary,  String conditionDetails,  TransactionMethod transactionMethod,  bool warranted,  String pdfS3Key,  DateTime? signedAt,  DateTime? completedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ContractsEntity():
return $default(_that.id,_that.senderUserId,_that.recipientUserId,_that.status,_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails,_that.transactionMethod,_that.warranted,_that.pdfS3Key,_that.signedAt,_that.completedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int senderUserId,  int? recipientUserId,  ContractStatus status,  String productName,  int amount,  String conditionSummary,  String conditionDetails,  TransactionMethod transactionMethod,  bool warranted,  String pdfS3Key,  DateTime? signedAt,  DateTime? completedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractsEntity() when $default != null:
return $default(_that.id,_that.senderUserId,_that.recipientUserId,_that.status,_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails,_that.transactionMethod,_that.warranted,_that.pdfS3Key,_that.signedAt,_that.completedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractsEntity implements ContractsEntity {
  const _ContractsEntity({this.id, required this.senderUserId, this.recipientUserId, required this.status, required this.productName, required this.amount, required this.conditionSummary, required this.conditionDetails, required this.transactionMethod, required this.warranted, required this.pdfS3Key, this.signedAt, this.completedAt, required this.createdAt});
  

@override final  int? id;
@override final  int senderUserId;
// 요청자 사용자 ID
@override final  int? recipientUserId;
// 수신자 사용자 ID
@override final  ContractStatus status;
// 거래 상태
@override final  String productName;
// 상품명
@override final  int amount;
// 거래 금액
@override final  String conditionSummary;
// 상품 상태
@override final  String conditionDetails;
// 상품 상세 설명
@override final  TransactionMethod transactionMethod;
// 거래 방식
@override final  bool warranted;
// 보증 제공 여부 (기본 3일)
@override final  String pdfS3Key;
// S3 PDF 경로
@override final  DateTime? signedAt;
// 양측 서명 일시
@override final  DateTime? completedAt;
// 거래 완료 일시
@override final  DateTime createdAt;

/// Create a copy of ContractsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractsEntityCopyWith<_ContractsEntity> get copyWith => __$ContractsEntityCopyWithImpl<_ContractsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.senderUserId, senderUserId) || other.senderUserId == senderUserId)&&(identical(other.recipientUserId, recipientUserId) || other.recipientUserId == recipientUserId)&&(identical(other.status, status) || other.status == status)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.transactionMethod, transactionMethod) || other.transactionMethod == transactionMethod)&&(identical(other.warranted, warranted) || other.warranted == warranted)&&(identical(other.pdfS3Key, pdfS3Key) || other.pdfS3Key == pdfS3Key)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,senderUserId,recipientUserId,status,productName,amount,conditionSummary,conditionDetails,transactionMethod,warranted,pdfS3Key,signedAt,completedAt,createdAt);

@override
String toString() {
  return 'ContractsEntity(id: $id, senderUserId: $senderUserId, recipientUserId: $recipientUserId, status: $status, productName: $productName, amount: $amount, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, transactionMethod: $transactionMethod, warranted: $warranted, pdfS3Key: $pdfS3Key, signedAt: $signedAt, completedAt: $completedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ContractsEntityCopyWith<$Res> implements $ContractsEntityCopyWith<$Res> {
  factory _$ContractsEntityCopyWith(_ContractsEntity value, $Res Function(_ContractsEntity) _then) = __$ContractsEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int senderUserId, int? recipientUserId, ContractStatus status, String productName, int amount, String conditionSummary, String conditionDetails, TransactionMethod transactionMethod, bool warranted, String pdfS3Key, DateTime? signedAt, DateTime? completedAt, DateTime createdAt
});




}
/// @nodoc
class __$ContractsEntityCopyWithImpl<$Res>
    implements _$ContractsEntityCopyWith<$Res> {
  __$ContractsEntityCopyWithImpl(this._self, this._then);

  final _ContractsEntity _self;
  final $Res Function(_ContractsEntity) _then;

/// Create a copy of ContractsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? senderUserId = null,Object? recipientUserId = freezed,Object? status = null,Object? productName = null,Object? amount = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? transactionMethod = null,Object? warranted = null,Object? pdfS3Key = null,Object? signedAt = freezed,Object? completedAt = freezed,Object? createdAt = null,}) {
  return _then(_ContractsEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,senderUserId: null == senderUserId ? _self.senderUserId : senderUserId // ignore: cast_nullable_to_non_nullable
as int,recipientUserId: freezed == recipientUserId ? _self.recipientUserId : recipientUserId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,transactionMethod: null == transactionMethod ? _self.transactionMethod : transactionMethod // ignore: cast_nullable_to_non_nullable
as TransactionMethod,warranted: null == warranted ? _self.warranted : warranted // ignore: cast_nullable_to_non_nullable
as bool,pdfS3Key: null == pdfS3Key ? _self.pdfS3Key : pdfS3Key // ignore: cast_nullable_to_non_nullable
as String,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
