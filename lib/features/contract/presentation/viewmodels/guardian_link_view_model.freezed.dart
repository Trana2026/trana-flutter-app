// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guardian_link_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuardianLinkState {

 String? get verifyUrl;// 발급된 보호자 인증 링크
 bool get isLoading; String? get error;
/// Create a copy of GuardianLinkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuardianLinkStateCopyWith<GuardianLinkState> get copyWith => _$GuardianLinkStateCopyWithImpl<GuardianLinkState>(this as GuardianLinkState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuardianLinkState&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,verifyUrl,isLoading,error);

@override
String toString() {
  return 'GuardianLinkState(verifyUrl: $verifyUrl, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $GuardianLinkStateCopyWith<$Res>  {
  factory $GuardianLinkStateCopyWith(GuardianLinkState value, $Res Function(GuardianLinkState) _then) = _$GuardianLinkStateCopyWithImpl;
@useResult
$Res call({
 String? verifyUrl, bool isLoading, String? error
});




}
/// @nodoc
class _$GuardianLinkStateCopyWithImpl<$Res>
    implements $GuardianLinkStateCopyWith<$Res> {
  _$GuardianLinkStateCopyWithImpl(this._self, this._then);

  final GuardianLinkState _self;
  final $Res Function(GuardianLinkState) _then;

/// Create a copy of GuardianLinkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verifyUrl = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
verifyUrl: freezed == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuardianLinkState].
extension GuardianLinkStatePatterns on GuardianLinkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuardianLinkState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuardianLinkState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuardianLinkState value)  $default,){
final _that = this;
switch (_that) {
case _GuardianLinkState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuardianLinkState value)?  $default,){
final _that = this;
switch (_that) {
case _GuardianLinkState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? verifyUrl,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuardianLinkState() when $default != null:
return $default(_that.verifyUrl,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? verifyUrl,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _GuardianLinkState():
return $default(_that.verifyUrl,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? verifyUrl,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _GuardianLinkState() when $default != null:
return $default(_that.verifyUrl,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GuardianLinkState implements GuardianLinkState {
  const _GuardianLinkState({this.verifyUrl, this.isLoading = false, this.error});
  

@override final  String? verifyUrl;
// 발급된 보호자 인증 링크
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of GuardianLinkState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuardianLinkStateCopyWith<_GuardianLinkState> get copyWith => __$GuardianLinkStateCopyWithImpl<_GuardianLinkState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuardianLinkState&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,verifyUrl,isLoading,error);

@override
String toString() {
  return 'GuardianLinkState(verifyUrl: $verifyUrl, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$GuardianLinkStateCopyWith<$Res> implements $GuardianLinkStateCopyWith<$Res> {
  factory _$GuardianLinkStateCopyWith(_GuardianLinkState value, $Res Function(_GuardianLinkState) _then) = __$GuardianLinkStateCopyWithImpl;
@override @useResult
$Res call({
 String? verifyUrl, bool isLoading, String? error
});




}
/// @nodoc
class __$GuardianLinkStateCopyWithImpl<$Res>
    implements _$GuardianLinkStateCopyWith<$Res> {
  __$GuardianLinkStateCopyWithImpl(this._self, this._then);

  final _GuardianLinkState _self;
  final $Res Function(_GuardianLinkState) _then;

/// Create a copy of GuardianLinkState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verifyUrl = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_GuardianLinkState(
verifyUrl: freezed == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
