// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guardian_link_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuardianLinkDto {

 String get token; String get expiresAt; String get verifyUrl;
/// Create a copy of GuardianLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuardianLinkDtoCopyWith<GuardianLinkDto> get copyWith => _$GuardianLinkDtoCopyWithImpl<GuardianLinkDto>(this as GuardianLinkDto, _$identity);

  /// Serializes this GuardianLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuardianLinkDto&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'GuardianLinkDto(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class $GuardianLinkDtoCopyWith<$Res>  {
  factory $GuardianLinkDtoCopyWith(GuardianLinkDto value, $Res Function(GuardianLinkDto) _then) = _$GuardianLinkDtoCopyWithImpl;
@useResult
$Res call({
 String token, String expiresAt, String verifyUrl
});




}
/// @nodoc
class _$GuardianLinkDtoCopyWithImpl<$Res>
    implements $GuardianLinkDtoCopyWith<$Res> {
  _$GuardianLinkDtoCopyWithImpl(this._self, this._then);

  final GuardianLinkDto _self;
  final $Res Function(GuardianLinkDto) _then;

/// Create a copy of GuardianLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GuardianLinkDto].
extension GuardianLinkDtoPatterns on GuardianLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuardianLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuardianLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuardianLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _GuardianLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuardianLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _GuardianLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String expiresAt,  String verifyUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuardianLinkDto() when $default != null:
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String expiresAt,  String verifyUrl)  $default,) {final _that = this;
switch (_that) {
case _GuardianLinkDto():
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String expiresAt,  String verifyUrl)?  $default,) {final _that = this;
switch (_that) {
case _GuardianLinkDto() when $default != null:
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuardianLinkDto implements GuardianLinkDto {
  const _GuardianLinkDto({required this.token, required this.expiresAt, required this.verifyUrl});
  factory _GuardianLinkDto.fromJson(Map<String, dynamic> json) => _$GuardianLinkDtoFromJson(json);

@override final  String token;
@override final  String expiresAt;
@override final  String verifyUrl;

/// Create a copy of GuardianLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuardianLinkDtoCopyWith<_GuardianLinkDto> get copyWith => __$GuardianLinkDtoCopyWithImpl<_GuardianLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuardianLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuardianLinkDto&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'GuardianLinkDto(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class _$GuardianLinkDtoCopyWith<$Res> implements $GuardianLinkDtoCopyWith<$Res> {
  factory _$GuardianLinkDtoCopyWith(_GuardianLinkDto value, $Res Function(_GuardianLinkDto) _then) = __$GuardianLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String token, String expiresAt, String verifyUrl
});




}
/// @nodoc
class __$GuardianLinkDtoCopyWithImpl<$Res>
    implements _$GuardianLinkDtoCopyWith<$Res> {
  __$GuardianLinkDtoCopyWithImpl(this._self, this._then);

  final _GuardianLinkDto _self;
  final $Res Function(_GuardianLinkDto) _then;

/// Create a copy of GuardianLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_GuardianLinkDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
