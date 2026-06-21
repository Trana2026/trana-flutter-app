// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consent_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsentResponseDto {

 String? get signupSessionId;
/// Create a copy of ConsentResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsentResponseDtoCopyWith<ConsentResponseDto> get copyWith => _$ConsentResponseDtoCopyWithImpl<ConsentResponseDto>(this as ConsentResponseDto, _$identity);

  /// Serializes this ConsentResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsentResponseDto&&(identical(other.signupSessionId, signupSessionId) || other.signupSessionId == signupSessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,signupSessionId);

@override
String toString() {
  return 'ConsentResponseDto(signupSessionId: $signupSessionId)';
}


}

/// @nodoc
abstract mixin class $ConsentResponseDtoCopyWith<$Res>  {
  factory $ConsentResponseDtoCopyWith(ConsentResponseDto value, $Res Function(ConsentResponseDto) _then) = _$ConsentResponseDtoCopyWithImpl;
@useResult
$Res call({
 String? signupSessionId
});




}
/// @nodoc
class _$ConsentResponseDtoCopyWithImpl<$Res>
    implements $ConsentResponseDtoCopyWith<$Res> {
  _$ConsentResponseDtoCopyWithImpl(this._self, this._then);

  final ConsentResponseDto _self;
  final $Res Function(ConsentResponseDto) _then;

/// Create a copy of ConsentResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signupSessionId = freezed,}) {
  return _then(_self.copyWith(
signupSessionId: freezed == signupSessionId ? _self.signupSessionId : signupSessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsentResponseDto].
extension ConsentResponseDtoPatterns on ConsentResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsentResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsentResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsentResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ConsentResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsentResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConsentResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? signupSessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsentResponseDto() when $default != null:
return $default(_that.signupSessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? signupSessionId)  $default,) {final _that = this;
switch (_that) {
case _ConsentResponseDto():
return $default(_that.signupSessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? signupSessionId)?  $default,) {final _that = this;
switch (_that) {
case _ConsentResponseDto() when $default != null:
return $default(_that.signupSessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsentResponseDto implements ConsentResponseDto {
  const _ConsentResponseDto({this.signupSessionId});
  factory _ConsentResponseDto.fromJson(Map<String, dynamic> json) => _$ConsentResponseDtoFromJson(json);

@override final  String? signupSessionId;

/// Create a copy of ConsentResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsentResponseDtoCopyWith<_ConsentResponseDto> get copyWith => __$ConsentResponseDtoCopyWithImpl<_ConsentResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsentResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsentResponseDto&&(identical(other.signupSessionId, signupSessionId) || other.signupSessionId == signupSessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,signupSessionId);

@override
String toString() {
  return 'ConsentResponseDto(signupSessionId: $signupSessionId)';
}


}

/// @nodoc
abstract mixin class _$ConsentResponseDtoCopyWith<$Res> implements $ConsentResponseDtoCopyWith<$Res> {
  factory _$ConsentResponseDtoCopyWith(_ConsentResponseDto value, $Res Function(_ConsentResponseDto) _then) = __$ConsentResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String? signupSessionId
});




}
/// @nodoc
class __$ConsentResponseDtoCopyWithImpl<$Res>
    implements _$ConsentResponseDtoCopyWith<$Res> {
  __$ConsentResponseDtoCopyWithImpl(this._self, this._then);

  final _ConsentResponseDto _self;
  final $Res Function(_ConsentResponseDto) _then;

/// Create a copy of ConsentResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signupSessionId = freezed,}) {
  return _then(_ConsentResponseDto(
signupSessionId: freezed == signupSessionId ? _self.signupSessionId : signupSessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
