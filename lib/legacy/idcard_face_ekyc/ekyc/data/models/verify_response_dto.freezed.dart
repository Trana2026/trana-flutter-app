// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyResponseDto {

 String get requestId; bool get verified;
/// Create a copy of VerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyResponseDtoCopyWith<VerifyResponseDto> get copyWith => _$VerifyResponseDtoCopyWithImpl<VerifyResponseDto>(this as VerifyResponseDto, _$identity);

  /// Serializes this VerifyResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyResponseDto&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.verified, verified) || other.verified == verified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,verified);

@override
String toString() {
  return 'VerifyResponseDto(requestId: $requestId, verified: $verified)';
}


}

/// @nodoc
abstract mixin class $VerifyResponseDtoCopyWith<$Res>  {
  factory $VerifyResponseDtoCopyWith(VerifyResponseDto value, $Res Function(VerifyResponseDto) _then) = _$VerifyResponseDtoCopyWithImpl;
@useResult
$Res call({
 String requestId, bool verified
});




}
/// @nodoc
class _$VerifyResponseDtoCopyWithImpl<$Res>
    implements $VerifyResponseDtoCopyWith<$Res> {
  _$VerifyResponseDtoCopyWithImpl(this._self, this._then);

  final VerifyResponseDto _self;
  final $Res Function(VerifyResponseDto) _then;

/// Create a copy of VerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? verified = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyResponseDto].
extension VerifyResponseDtoPatterns on VerifyResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _VerifyResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  bool verified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyResponseDto() when $default != null:
return $default(_that.requestId,_that.verified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  bool verified)  $default,) {final _that = this;
switch (_that) {
case _VerifyResponseDto():
return $default(_that.requestId,_that.verified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  bool verified)?  $default,) {final _that = this;
switch (_that) {
case _VerifyResponseDto() when $default != null:
return $default(_that.requestId,_that.verified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyResponseDto implements VerifyResponseDto {
  const _VerifyResponseDto({required this.requestId, required this.verified});
  factory _VerifyResponseDto.fromJson(Map<String, dynamic> json) => _$VerifyResponseDtoFromJson(json);

@override final  String requestId;
@override final  bool verified;

/// Create a copy of VerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyResponseDtoCopyWith<_VerifyResponseDto> get copyWith => __$VerifyResponseDtoCopyWithImpl<_VerifyResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyResponseDto&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.verified, verified) || other.verified == verified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,verified);

@override
String toString() {
  return 'VerifyResponseDto(requestId: $requestId, verified: $verified)';
}


}

/// @nodoc
abstract mixin class _$VerifyResponseDtoCopyWith<$Res> implements $VerifyResponseDtoCopyWith<$Res> {
  factory _$VerifyResponseDtoCopyWith(_VerifyResponseDto value, $Res Function(_VerifyResponseDto) _then) = __$VerifyResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String requestId, bool verified
});




}
/// @nodoc
class __$VerifyResponseDtoCopyWithImpl<$Res>
    implements _$VerifyResponseDtoCopyWith<$Res> {
  __$VerifyResponseDtoCopyWithImpl(this._self, this._then);

  final _VerifyResponseDto _self;
  final $Res Function(_VerifyResponseDto) _then;

/// Create a copy of VerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? verified = null,}) {
  return _then(_VerifyResponseDto(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
