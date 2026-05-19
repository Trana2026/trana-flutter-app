// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PdfEntity {

 String get productName;// 거래 물품명
 int get amount;// 거래 금액
 String get conditionSummary;// 상품 상태
 String get conditionDetails;// 상품 상세 설명
 TransactionMethod get transactionMethod;// 거래 방식
 String? get buyerSign;// 구매자 서명 png
 String? get sellerSign;
/// Create a copy of PdfEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PdfEntityCopyWith<PdfEntity> get copyWith => _$PdfEntityCopyWithImpl<PdfEntity>(this as PdfEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PdfEntity&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.transactionMethod, transactionMethod) || other.transactionMethod == transactionMethod)&&(identical(other.buyerSign, buyerSign) || other.buyerSign == buyerSign)&&(identical(other.sellerSign, sellerSign) || other.sellerSign == sellerSign));
}


@override
int get hashCode => Object.hash(runtimeType,productName,amount,conditionSummary,conditionDetails,transactionMethod,buyerSign,sellerSign);

@override
String toString() {
  return 'PdfEntity(productName: $productName, amount: $amount, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, transactionMethod: $transactionMethod, buyerSign: $buyerSign, sellerSign: $sellerSign)';
}


}

/// @nodoc
abstract mixin class $PdfEntityCopyWith<$Res>  {
  factory $PdfEntityCopyWith(PdfEntity value, $Res Function(PdfEntity) _then) = _$PdfEntityCopyWithImpl;
@useResult
$Res call({
 String productName, int amount, String conditionSummary, String conditionDetails, TransactionMethod transactionMethod, String? buyerSign, String? sellerSign
});




}
/// @nodoc
class _$PdfEntityCopyWithImpl<$Res>
    implements $PdfEntityCopyWith<$Res> {
  _$PdfEntityCopyWithImpl(this._self, this._then);

  final PdfEntity _self;
  final $Res Function(PdfEntity) _then;

/// Create a copy of PdfEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? amount = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? transactionMethod = null,Object? buyerSign = freezed,Object? sellerSign = freezed,}) {
  return _then(_self.copyWith(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,transactionMethod: null == transactionMethod ? _self.transactionMethod : transactionMethod // ignore: cast_nullable_to_non_nullable
as TransactionMethod,buyerSign: freezed == buyerSign ? _self.buyerSign : buyerSign // ignore: cast_nullable_to_non_nullable
as String?,sellerSign: freezed == sellerSign ? _self.sellerSign : sellerSign // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PdfEntity].
extension PdfEntityPatterns on PdfEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PdfEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PdfEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PdfEntity value)  $default,){
final _that = this;
switch (_that) {
case _PdfEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PdfEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PdfEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productName,  int amount,  String conditionSummary,  String conditionDetails,  TransactionMethod transactionMethod,  String? buyerSign,  String? sellerSign)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PdfEntity() when $default != null:
return $default(_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails,_that.transactionMethod,_that.buyerSign,_that.sellerSign);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productName,  int amount,  String conditionSummary,  String conditionDetails,  TransactionMethod transactionMethod,  String? buyerSign,  String? sellerSign)  $default,) {final _that = this;
switch (_that) {
case _PdfEntity():
return $default(_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails,_that.transactionMethod,_that.buyerSign,_that.sellerSign);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productName,  int amount,  String conditionSummary,  String conditionDetails,  TransactionMethod transactionMethod,  String? buyerSign,  String? sellerSign)?  $default,) {final _that = this;
switch (_that) {
case _PdfEntity() when $default != null:
return $default(_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails,_that.transactionMethod,_that.buyerSign,_that.sellerSign);case _:
  return null;

}
}

}

/// @nodoc


class _PdfEntity implements PdfEntity {
  const _PdfEntity({required this.productName, required this.amount, required this.conditionSummary, required this.conditionDetails, required this.transactionMethod, this.buyerSign, this.sellerSign});
  

@override final  String productName;
// 거래 물품명
@override final  int amount;
// 거래 금액
@override final  String conditionSummary;
// 상품 상태
@override final  String conditionDetails;
// 상품 상세 설명
@override final  TransactionMethod transactionMethod;
// 거래 방식
@override final  String? buyerSign;
// 구매자 서명 png
@override final  String? sellerSign;

/// Create a copy of PdfEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PdfEntityCopyWith<_PdfEntity> get copyWith => __$PdfEntityCopyWithImpl<_PdfEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PdfEntity&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.transactionMethod, transactionMethod) || other.transactionMethod == transactionMethod)&&(identical(other.buyerSign, buyerSign) || other.buyerSign == buyerSign)&&(identical(other.sellerSign, sellerSign) || other.sellerSign == sellerSign));
}


@override
int get hashCode => Object.hash(runtimeType,productName,amount,conditionSummary,conditionDetails,transactionMethod,buyerSign,sellerSign);

@override
String toString() {
  return 'PdfEntity(productName: $productName, amount: $amount, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, transactionMethod: $transactionMethod, buyerSign: $buyerSign, sellerSign: $sellerSign)';
}


}

/// @nodoc
abstract mixin class _$PdfEntityCopyWith<$Res> implements $PdfEntityCopyWith<$Res> {
  factory _$PdfEntityCopyWith(_PdfEntity value, $Res Function(_PdfEntity) _then) = __$PdfEntityCopyWithImpl;
@override @useResult
$Res call({
 String productName, int amount, String conditionSummary, String conditionDetails, TransactionMethod transactionMethod, String? buyerSign, String? sellerSign
});




}
/// @nodoc
class __$PdfEntityCopyWithImpl<$Res>
    implements _$PdfEntityCopyWith<$Res> {
  __$PdfEntityCopyWithImpl(this._self, this._then);

  final _PdfEntity _self;
  final $Res Function(_PdfEntity) _then;

/// Create a copy of PdfEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? amount = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? transactionMethod = null,Object? buyerSign = freezed,Object? sellerSign = freezed,}) {
  return _then(_PdfEntity(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,transactionMethod: null == transactionMethod ? _self.transactionMethod : transactionMethod // ignore: cast_nullable_to_non_nullable
as TransactionMethod,buyerSign: freezed == buyerSign ? _self.buyerSign : buyerSign // ignore: cast_nullable_to_non_nullable
as String?,sellerSign: freezed == sellerSign ? _self.sellerSign : sellerSign // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
