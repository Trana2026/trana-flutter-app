// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_confirm_completion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractConfirmCompletionEntity {

 String get publicCode; ContractStatus get status; DateTime? get sellerCompletedAt; DateTime? get buyerCompletedAt; DateTime? get completedAt;
/// Create a copy of ContractConfirmCompletionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractConfirmCompletionEntityCopyWith<ContractConfirmCompletionEntity> get copyWith => _$ContractConfirmCompletionEntityCopyWithImpl<ContractConfirmCompletionEntity>(this as ContractConfirmCompletionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractConfirmCompletionEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.sellerCompletedAt, sellerCompletedAt) || other.sellerCompletedAt == sellerCompletedAt)&&(identical(other.buyerCompletedAt, buyerCompletedAt) || other.buyerCompletedAt == buyerCompletedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,sellerCompletedAt,buyerCompletedAt,completedAt);

@override
String toString() {
  return 'ContractConfirmCompletionEntity(publicCode: $publicCode, status: $status, sellerCompletedAt: $sellerCompletedAt, buyerCompletedAt: $buyerCompletedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $ContractConfirmCompletionEntityCopyWith<$Res>  {
  factory $ContractConfirmCompletionEntityCopyWith(ContractConfirmCompletionEntity value, $Res Function(ContractConfirmCompletionEntity) _then) = _$ContractConfirmCompletionEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, ContractStatus status, DateTime? sellerCompletedAt, DateTime? buyerCompletedAt, DateTime? completedAt
});




}
/// @nodoc
class _$ContractConfirmCompletionEntityCopyWithImpl<$Res>
    implements $ContractConfirmCompletionEntityCopyWith<$Res> {
  _$ContractConfirmCompletionEntityCopyWithImpl(this._self, this._then);

  final ContractConfirmCompletionEntity _self;
  final $Res Function(ContractConfirmCompletionEntity) _then;

/// Create a copy of ContractConfirmCompletionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? sellerCompletedAt = freezed,Object? buyerCompletedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,sellerCompletedAt: freezed == sellerCompletedAt ? _self.sellerCompletedAt : sellerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,buyerCompletedAt: freezed == buyerCompletedAt ? _self.buyerCompletedAt : buyerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractConfirmCompletionEntity].
extension ContractConfirmCompletionEntityPatterns on ContractConfirmCompletionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractConfirmCompletionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractConfirmCompletionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractConfirmCompletionEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractConfirmCompletionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractConfirmCompletionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractConfirmCompletionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  DateTime? sellerCompletedAt,  DateTime? buyerCompletedAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractConfirmCompletionEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.sellerCompletedAt,_that.buyerCompletedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  DateTime? sellerCompletedAt,  DateTime? buyerCompletedAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractConfirmCompletionEntity():
return $default(_that.publicCode,_that.status,_that.sellerCompletedAt,_that.buyerCompletedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  ContractStatus status,  DateTime? sellerCompletedAt,  DateTime? buyerCompletedAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractConfirmCompletionEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.sellerCompletedAt,_that.buyerCompletedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractConfirmCompletionEntity implements ContractConfirmCompletionEntity {
  const _ContractConfirmCompletionEntity({required this.publicCode, required this.status, this.sellerCompletedAt, this.buyerCompletedAt, this.completedAt});
  

@override final  String publicCode;
@override final  ContractStatus status;
@override final  DateTime? sellerCompletedAt;
@override final  DateTime? buyerCompletedAt;
@override final  DateTime? completedAt;

/// Create a copy of ContractConfirmCompletionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractConfirmCompletionEntityCopyWith<_ContractConfirmCompletionEntity> get copyWith => __$ContractConfirmCompletionEntityCopyWithImpl<_ContractConfirmCompletionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractConfirmCompletionEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.sellerCompletedAt, sellerCompletedAt) || other.sellerCompletedAt == sellerCompletedAt)&&(identical(other.buyerCompletedAt, buyerCompletedAt) || other.buyerCompletedAt == buyerCompletedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,sellerCompletedAt,buyerCompletedAt,completedAt);

@override
String toString() {
  return 'ContractConfirmCompletionEntity(publicCode: $publicCode, status: $status, sellerCompletedAt: $sellerCompletedAt, buyerCompletedAt: $buyerCompletedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractConfirmCompletionEntityCopyWith<$Res> implements $ContractConfirmCompletionEntityCopyWith<$Res> {
  factory _$ContractConfirmCompletionEntityCopyWith(_ContractConfirmCompletionEntity value, $Res Function(_ContractConfirmCompletionEntity) _then) = __$ContractConfirmCompletionEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, ContractStatus status, DateTime? sellerCompletedAt, DateTime? buyerCompletedAt, DateTime? completedAt
});




}
/// @nodoc
class __$ContractConfirmCompletionEntityCopyWithImpl<$Res>
    implements _$ContractConfirmCompletionEntityCopyWith<$Res> {
  __$ContractConfirmCompletionEntityCopyWithImpl(this._self, this._then);

  final _ContractConfirmCompletionEntity _self;
  final $Res Function(_ContractConfirmCompletionEntity) _then;

/// Create a copy of ContractConfirmCompletionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? sellerCompletedAt = freezed,Object? buyerCompletedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_ContractConfirmCompletionEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,sellerCompletedAt: freezed == sellerCompletedAt ? _self.sellerCompletedAt : sellerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,buyerCompletedAt: freezed == buyerCompletedAt ? _self.buyerCompletedAt : buyerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
