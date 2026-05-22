// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_auto_fill_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiAutoFillEntity {

 String? get productName;// 거래 물품명
 int? get amount;// 거래 금액
 String? get conditionSummary;// 상품 상태
 String? get conditionDetails;
/// Create a copy of AiAutoFillEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAutoFillEntityCopyWith<AiAutoFillEntity> get copyWith => _$AiAutoFillEntityCopyWithImpl<AiAutoFillEntity>(this as AiAutoFillEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAutoFillEntity&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails));
}


@override
int get hashCode => Object.hash(runtimeType,productName,amount,conditionSummary,conditionDetails);

@override
String toString() {
  return 'AiAutoFillEntity(productName: $productName, amount: $amount, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails)';
}


}

/// @nodoc
abstract mixin class $AiAutoFillEntityCopyWith<$Res>  {
  factory $AiAutoFillEntityCopyWith(AiAutoFillEntity value, $Res Function(AiAutoFillEntity) _then) = _$AiAutoFillEntityCopyWithImpl;
@useResult
$Res call({
 String? productName, int? amount, String? conditionSummary, String? conditionDetails
});




}
/// @nodoc
class _$AiAutoFillEntityCopyWithImpl<$Res>
    implements $AiAutoFillEntityCopyWith<$Res> {
  _$AiAutoFillEntityCopyWithImpl(this._self, this._then);

  final AiAutoFillEntity _self;
  final $Res Function(AiAutoFillEntity) _then;

/// Create a copy of AiAutoFillEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = freezed,Object? amount = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,}) {
  return _then(_self.copyWith(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,conditionSummary: freezed == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String?,conditionDetails: freezed == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AiAutoFillEntity].
extension AiAutoFillEntityPatterns on AiAutoFillEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiAutoFillEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiAutoFillEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiAutoFillEntity value)  $default,){
final _that = this;
switch (_that) {
case _AiAutoFillEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiAutoFillEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AiAutoFillEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? productName,  int? amount,  String? conditionSummary,  String? conditionDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiAutoFillEntity() when $default != null:
return $default(_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? productName,  int? amount,  String? conditionSummary,  String? conditionDetails)  $default,) {final _that = this;
switch (_that) {
case _AiAutoFillEntity():
return $default(_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? productName,  int? amount,  String? conditionSummary,  String? conditionDetails)?  $default,) {final _that = this;
switch (_that) {
case _AiAutoFillEntity() when $default != null:
return $default(_that.productName,_that.amount,_that.conditionSummary,_that.conditionDetails);case _:
  return null;

}
}

}

/// @nodoc


class _AiAutoFillEntity implements AiAutoFillEntity {
  const _AiAutoFillEntity({this.productName, this.amount, this.conditionSummary, this.conditionDetails});
  

@override final  String? productName;
// 거래 물품명
@override final  int? amount;
// 거래 금액
@override final  String? conditionSummary;
// 상품 상태
@override final  String? conditionDetails;

/// Create a copy of AiAutoFillEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiAutoFillEntityCopyWith<_AiAutoFillEntity> get copyWith => __$AiAutoFillEntityCopyWithImpl<_AiAutoFillEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiAutoFillEntity&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails));
}


@override
int get hashCode => Object.hash(runtimeType,productName,amount,conditionSummary,conditionDetails);

@override
String toString() {
  return 'AiAutoFillEntity(productName: $productName, amount: $amount, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails)';
}


}

/// @nodoc
abstract mixin class _$AiAutoFillEntityCopyWith<$Res> implements $AiAutoFillEntityCopyWith<$Res> {
  factory _$AiAutoFillEntityCopyWith(_AiAutoFillEntity value, $Res Function(_AiAutoFillEntity) _then) = __$AiAutoFillEntityCopyWithImpl;
@override @useResult
$Res call({
 String? productName, int? amount, String? conditionSummary, String? conditionDetails
});




}
/// @nodoc
class __$AiAutoFillEntityCopyWithImpl<$Res>
    implements _$AiAutoFillEntityCopyWith<$Res> {
  __$AiAutoFillEntityCopyWithImpl(this._self, this._then);

  final _AiAutoFillEntity _self;
  final $Res Function(_AiAutoFillEntity) _then;

/// Create a copy of AiAutoFillEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = freezed,Object? amount = freezed,Object? conditionSummary = freezed,Object? conditionDetails = freezed,}) {
  return _then(_AiAutoFillEntity(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,conditionSummary: freezed == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String?,conditionDetails: freezed == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
