// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pass_verify_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PassVerifyState {

 bool get isLoading; bool get requiresGuardian; String? get error;
/// Create a copy of PassVerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassVerifyStateCopyWith<PassVerifyState> get copyWith => _$PassVerifyStateCopyWithImpl<PassVerifyState>(this as PassVerifyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassVerifyState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.requiresGuardian, requiresGuardian) || other.requiresGuardian == requiresGuardian)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,requiresGuardian,error);

@override
String toString() {
  return 'PassVerifyState(isLoading: $isLoading, requiresGuardian: $requiresGuardian, error: $error)';
}


}

/// @nodoc
abstract mixin class $PassVerifyStateCopyWith<$Res>  {
  factory $PassVerifyStateCopyWith(PassVerifyState value, $Res Function(PassVerifyState) _then) = _$PassVerifyStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool requiresGuardian, String? error
});




}
/// @nodoc
class _$PassVerifyStateCopyWithImpl<$Res>
    implements $PassVerifyStateCopyWith<$Res> {
  _$PassVerifyStateCopyWithImpl(this._self, this._then);

  final PassVerifyState _self;
  final $Res Function(PassVerifyState) _then;

/// Create a copy of PassVerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? requiresGuardian = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,requiresGuardian: null == requiresGuardian ? _self.requiresGuardian : requiresGuardian // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PassVerifyState].
extension PassVerifyStatePatterns on PassVerifyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassVerifyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassVerifyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassVerifyState value)  $default,){
final _that = this;
switch (_that) {
case _PassVerifyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassVerifyState value)?  $default,){
final _that = this;
switch (_that) {
case _PassVerifyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool requiresGuardian,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassVerifyState() when $default != null:
return $default(_that.isLoading,_that.requiresGuardian,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool requiresGuardian,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PassVerifyState():
return $default(_that.isLoading,_that.requiresGuardian,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool requiresGuardian,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PassVerifyState() when $default != null:
return $default(_that.isLoading,_that.requiresGuardian,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PassVerifyState implements PassVerifyState {
  const _PassVerifyState({this.isLoading = false, this.requiresGuardian = false, this.error});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool requiresGuardian;
@override final  String? error;

/// Create a copy of PassVerifyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassVerifyStateCopyWith<_PassVerifyState> get copyWith => __$PassVerifyStateCopyWithImpl<_PassVerifyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassVerifyState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.requiresGuardian, requiresGuardian) || other.requiresGuardian == requiresGuardian)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,requiresGuardian,error);

@override
String toString() {
  return 'PassVerifyState(isLoading: $isLoading, requiresGuardian: $requiresGuardian, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PassVerifyStateCopyWith<$Res> implements $PassVerifyStateCopyWith<$Res> {
  factory _$PassVerifyStateCopyWith(_PassVerifyState value, $Res Function(_PassVerifyState) _then) = __$PassVerifyStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool requiresGuardian, String? error
});




}
/// @nodoc
class __$PassVerifyStateCopyWithImpl<$Res>
    implements _$PassVerifyStateCopyWith<$Res> {
  __$PassVerifyStateCopyWithImpl(this._self, this._then);

  final _PassVerifyState _self;
  final $Res Function(_PassVerifyState) _then;

/// Create a copy of PassVerifyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? requiresGuardian = null,Object? error = freezed,}) {
  return _then(_PassVerifyState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,requiresGuardian: null == requiresGuardian ? _self.requiresGuardian : requiresGuardian // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
