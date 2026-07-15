// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receive_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReceiveContractState {

 String? get publicCode;// 수신된 계약 publicCode
 int get warrantyPeriodDays;// 선택된 보증 제공 여부 (0: 미제공, 3: 제공)
 String? get error;
/// Create a copy of ReceiveContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveContractStateCopyWith<ReceiveContractState> get copyWith => _$ReceiveContractStateCopyWithImpl<ReceiveContractState>(this as ReceiveContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveContractState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,warrantyPeriodDays,error);

@override
String toString() {
  return 'ReceiveContractState(publicCode: $publicCode, warrantyPeriodDays: $warrantyPeriodDays, error: $error)';
}


}

/// @nodoc
abstract mixin class $ReceiveContractStateCopyWith<$Res>  {
  factory $ReceiveContractStateCopyWith(ReceiveContractState value, $Res Function(ReceiveContractState) _then) = _$ReceiveContractStateCopyWithImpl;
@useResult
$Res call({
 String? publicCode, int warrantyPeriodDays, String? error
});




}
/// @nodoc
class _$ReceiveContractStateCopyWithImpl<$Res>
    implements $ReceiveContractStateCopyWith<$Res> {
  _$ReceiveContractStateCopyWithImpl(this._self, this._then);

  final ReceiveContractState _self;
  final $Res Function(ReceiveContractState) _then;

/// Create a copy of ReceiveContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = freezed,Object? warrantyPeriodDays = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiveContractState].
extension ReceiveContractStatePatterns on ReceiveContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiveContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiveContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiveContractState value)  $default,){
final _that = this;
switch (_that) {
case _ReceiveContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiveContractState value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiveContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? publicCode,  int warrantyPeriodDays,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiveContractState() when $default != null:
return $default(_that.publicCode,_that.warrantyPeriodDays,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? publicCode,  int warrantyPeriodDays,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ReceiveContractState():
return $default(_that.publicCode,_that.warrantyPeriodDays,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? publicCode,  int warrantyPeriodDays,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ReceiveContractState() when $default != null:
return $default(_that.publicCode,_that.warrantyPeriodDays,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ReceiveContractState implements ReceiveContractState {
  const _ReceiveContractState({this.publicCode, this.warrantyPeriodDays = 0, this.error});
  

@override final  String? publicCode;
// 수신된 계약 publicCode
@override@JsonKey() final  int warrantyPeriodDays;
// 선택된 보증 제공 여부 (0: 미제공, 3: 제공)
@override final  String? error;

/// Create a copy of ReceiveContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiveContractStateCopyWith<_ReceiveContractState> get copyWith => __$ReceiveContractStateCopyWithImpl<_ReceiveContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiveContractState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,warrantyPeriodDays,error);

@override
String toString() {
  return 'ReceiveContractState(publicCode: $publicCode, warrantyPeriodDays: $warrantyPeriodDays, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ReceiveContractStateCopyWith<$Res> implements $ReceiveContractStateCopyWith<$Res> {
  factory _$ReceiveContractStateCopyWith(_ReceiveContractState value, $Res Function(_ReceiveContractState) _then) = __$ReceiveContractStateCopyWithImpl;
@override @useResult
$Res call({
 String? publicCode, int warrantyPeriodDays, String? error
});




}
/// @nodoc
class __$ReceiveContractStateCopyWithImpl<$Res>
    implements _$ReceiveContractStateCopyWith<$Res> {
  __$ReceiveContractStateCopyWithImpl(this._self, this._then);

  final _ReceiveContractState _self;
  final $Res Function(_ReceiveContractState) _then;

/// Create a copy of ReceiveContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = freezed,Object? warrantyPeriodDays = null,Object? error = freezed,}) {
  return _then(_ReceiveContractState(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
