// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preference_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreferenceDto {

 bool get pushEnabled;
/// Create a copy of UserPreferenceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferenceDtoCopyWith<UserPreferenceDto> get copyWith => _$UserPreferenceDtoCopyWithImpl<UserPreferenceDto>(this as UserPreferenceDto, _$identity);

  /// Serializes this UserPreferenceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferenceDto&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pushEnabled);

@override
String toString() {
  return 'UserPreferenceDto(pushEnabled: $pushEnabled)';
}


}

/// @nodoc
abstract mixin class $UserPreferenceDtoCopyWith<$Res>  {
  factory $UserPreferenceDtoCopyWith(UserPreferenceDto value, $Res Function(UserPreferenceDto) _then) = _$UserPreferenceDtoCopyWithImpl;
@useResult
$Res call({
 bool pushEnabled
});




}
/// @nodoc
class _$UserPreferenceDtoCopyWithImpl<$Res>
    implements $UserPreferenceDtoCopyWith<$Res> {
  _$UserPreferenceDtoCopyWithImpl(this._self, this._then);

  final UserPreferenceDto _self;
  final $Res Function(UserPreferenceDto) _then;

/// Create a copy of UserPreferenceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushEnabled = null,}) {
  return _then(_self.copyWith(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferenceDto].
extension UserPreferenceDtoPatterns on UserPreferenceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferenceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferenceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferenceDto value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferenceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferenceDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferenceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool pushEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferenceDto() when $default != null:
return $default(_that.pushEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool pushEnabled)  $default,) {final _that = this;
switch (_that) {
case _UserPreferenceDto():
return $default(_that.pushEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool pushEnabled)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferenceDto() when $default != null:
return $default(_that.pushEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPreferenceDto implements UserPreferenceDto {
  const _UserPreferenceDto({required this.pushEnabled});
  factory _UserPreferenceDto.fromJson(Map<String, dynamic> json) => _$UserPreferenceDtoFromJson(json);

@override final  bool pushEnabled;

/// Create a copy of UserPreferenceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferenceDtoCopyWith<_UserPreferenceDto> get copyWith => __$UserPreferenceDtoCopyWithImpl<_UserPreferenceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPreferenceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferenceDto&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pushEnabled);

@override
String toString() {
  return 'UserPreferenceDto(pushEnabled: $pushEnabled)';
}


}

/// @nodoc
abstract mixin class _$UserPreferenceDtoCopyWith<$Res> implements $UserPreferenceDtoCopyWith<$Res> {
  factory _$UserPreferenceDtoCopyWith(_UserPreferenceDto value, $Res Function(_UserPreferenceDto) _then) = __$UserPreferenceDtoCopyWithImpl;
@override @useResult
$Res call({
 bool pushEnabled
});




}
/// @nodoc
class __$UserPreferenceDtoCopyWithImpl<$Res>
    implements _$UserPreferenceDtoCopyWith<$Res> {
  __$UserPreferenceDtoCopyWithImpl(this._self, this._then);

  final _UserPreferenceDto _self;
  final $Res Function(_UserPreferenceDto) _then;

/// Create a copy of UserPreferenceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pushEnabled = null,}) {
  return _then(_UserPreferenceDto(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
