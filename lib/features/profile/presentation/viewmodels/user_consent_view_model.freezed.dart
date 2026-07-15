// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_consent_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserConsentState {

 List<UserConsentEntity> get consents;// 본인 약관 동의 목록
 String? get error;
/// Create a copy of UserConsentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserConsentStateCopyWith<UserConsentState> get copyWith => _$UserConsentStateCopyWithImpl<UserConsentState>(this as UserConsentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserConsentState&&const DeepCollectionEquality().equals(other.consents, consents)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(consents),error);

@override
String toString() {
  return 'UserConsentState(consents: $consents, error: $error)';
}


}

/// @nodoc
abstract mixin class $UserConsentStateCopyWith<$Res>  {
  factory $UserConsentStateCopyWith(UserConsentState value, $Res Function(UserConsentState) _then) = _$UserConsentStateCopyWithImpl;
@useResult
$Res call({
 List<UserConsentEntity> consents, String? error
});




}
/// @nodoc
class _$UserConsentStateCopyWithImpl<$Res>
    implements $UserConsentStateCopyWith<$Res> {
  _$UserConsentStateCopyWithImpl(this._self, this._then);

  final UserConsentState _self;
  final $Res Function(UserConsentState) _then;

/// Create a copy of UserConsentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consents = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
consents: null == consents ? _self.consents : consents // ignore: cast_nullable_to_non_nullable
as List<UserConsentEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserConsentState].
extension UserConsentStatePatterns on UserConsentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserConsentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserConsentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserConsentState value)  $default,){
final _that = this;
switch (_that) {
case _UserConsentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserConsentState value)?  $default,){
final _that = this;
switch (_that) {
case _UserConsentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserConsentEntity> consents,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserConsentState() when $default != null:
return $default(_that.consents,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserConsentEntity> consents,  String? error)  $default,) {final _that = this;
switch (_that) {
case _UserConsentState():
return $default(_that.consents,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserConsentEntity> consents,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _UserConsentState() when $default != null:
return $default(_that.consents,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _UserConsentState implements UserConsentState {
  const _UserConsentState({final  List<UserConsentEntity> consents = const [], this.error}): _consents = consents;
  

 final  List<UserConsentEntity> _consents;
@override@JsonKey() List<UserConsentEntity> get consents {
  if (_consents is EqualUnmodifiableListView) return _consents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consents);
}

// 본인 약관 동의 목록
@override final  String? error;

/// Create a copy of UserConsentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserConsentStateCopyWith<_UserConsentState> get copyWith => __$UserConsentStateCopyWithImpl<_UserConsentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserConsentState&&const DeepCollectionEquality().equals(other._consents, _consents)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_consents),error);

@override
String toString() {
  return 'UserConsentState(consents: $consents, error: $error)';
}


}

/// @nodoc
abstract mixin class _$UserConsentStateCopyWith<$Res> implements $UserConsentStateCopyWith<$Res> {
  factory _$UserConsentStateCopyWith(_UserConsentState value, $Res Function(_UserConsentState) _then) = __$UserConsentStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserConsentEntity> consents, String? error
});




}
/// @nodoc
class __$UserConsentStateCopyWithImpl<$Res>
    implements _$UserConsentStateCopyWith<$Res> {
  __$UserConsentStateCopyWithImpl(this._self, this._then);

  final _UserConsentState _self;
  final $Res Function(_UserConsentState) _then;

/// Create a copy of UserConsentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consents = null,Object? error = freezed,}) {
  return _then(_UserConsentState(
consents: null == consents ? _self._consents : consents // ignore: cast_nullable_to_non_nullable
as List<UserConsentEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
