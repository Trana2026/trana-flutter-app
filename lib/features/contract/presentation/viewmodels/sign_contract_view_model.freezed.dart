// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignContractState {

 String get signatureBase64;// 전자 서명 데이터
 List<int> get agreedTermIds;// 동의한 약관 id 목록
 String? get error;
/// Create a copy of SignContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignContractStateCopyWith<SignContractState> get copyWith => _$SignContractStateCopyWithImpl<SignContractState>(this as SignContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignContractState&&(identical(other.signatureBase64, signatureBase64) || other.signatureBase64 == signatureBase64)&&const DeepCollectionEquality().equals(other.agreedTermIds, agreedTermIds)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,signatureBase64,const DeepCollectionEquality().hash(agreedTermIds),error);

@override
String toString() {
  return 'SignContractState(signatureBase64: $signatureBase64, agreedTermIds: $agreedTermIds, error: $error)';
}


}

/// @nodoc
abstract mixin class $SignContractStateCopyWith<$Res>  {
  factory $SignContractStateCopyWith(SignContractState value, $Res Function(SignContractState) _then) = _$SignContractStateCopyWithImpl;
@useResult
$Res call({
 String signatureBase64, List<int> agreedTermIds, String? error
});




}
/// @nodoc
class _$SignContractStateCopyWithImpl<$Res>
    implements $SignContractStateCopyWith<$Res> {
  _$SignContractStateCopyWithImpl(this._self, this._then);

  final SignContractState _self;
  final $Res Function(SignContractState) _then;

/// Create a copy of SignContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signatureBase64 = null,Object? agreedTermIds = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
signatureBase64: null == signatureBase64 ? _self.signatureBase64 : signatureBase64 // ignore: cast_nullable_to_non_nullable
as String,agreedTermIds: null == agreedTermIds ? _self.agreedTermIds : agreedTermIds // ignore: cast_nullable_to_non_nullable
as List<int>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignContractState].
extension SignContractStatePatterns on SignContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignContractState value)  $default,){
final _that = this;
switch (_that) {
case _SignContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignContractState value)?  $default,){
final _that = this;
switch (_that) {
case _SignContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String signatureBase64,  List<int> agreedTermIds,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignContractState() when $default != null:
return $default(_that.signatureBase64,_that.agreedTermIds,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String signatureBase64,  List<int> agreedTermIds,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SignContractState():
return $default(_that.signatureBase64,_that.agreedTermIds,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String signatureBase64,  List<int> agreedTermIds,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SignContractState() when $default != null:
return $default(_that.signatureBase64,_that.agreedTermIds,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SignContractState implements SignContractState {
  const _SignContractState({this.signatureBase64 = '', final  List<int> agreedTermIds = const [], this.error}): _agreedTermIds = agreedTermIds;
  

@override@JsonKey() final  String signatureBase64;
// 전자 서명 데이터
 final  List<int> _agreedTermIds;
// 전자 서명 데이터
@override@JsonKey() List<int> get agreedTermIds {
  if (_agreedTermIds is EqualUnmodifiableListView) return _agreedTermIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_agreedTermIds);
}

// 동의한 약관 id 목록
@override final  String? error;

/// Create a copy of SignContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignContractStateCopyWith<_SignContractState> get copyWith => __$SignContractStateCopyWithImpl<_SignContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignContractState&&(identical(other.signatureBase64, signatureBase64) || other.signatureBase64 == signatureBase64)&&const DeepCollectionEquality().equals(other._agreedTermIds, _agreedTermIds)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,signatureBase64,const DeepCollectionEquality().hash(_agreedTermIds),error);

@override
String toString() {
  return 'SignContractState(signatureBase64: $signatureBase64, agreedTermIds: $agreedTermIds, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SignContractStateCopyWith<$Res> implements $SignContractStateCopyWith<$Res> {
  factory _$SignContractStateCopyWith(_SignContractState value, $Res Function(_SignContractState) _then) = __$SignContractStateCopyWithImpl;
@override @useResult
$Res call({
 String signatureBase64, List<int> agreedTermIds, String? error
});




}
/// @nodoc
class __$SignContractStateCopyWithImpl<$Res>
    implements _$SignContractStateCopyWith<$Res> {
  __$SignContractStateCopyWithImpl(this._self, this._then);

  final _SignContractState _self;
  final $Res Function(_SignContractState) _then;

/// Create a copy of SignContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signatureBase64 = null,Object? agreedTermIds = null,Object? error = freezed,}) {
  return _then(_SignContractState(
signatureBase64: null == signatureBase64 ? _self.signatureBase64 : signatureBase64 // ignore: cast_nullable_to_non_nullable
as String,agreedTermIds: null == agreedTermIds ? _self._agreedTermIds : agreedTermIds // ignore: cast_nullable_to_non_nullable
as List<int>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
