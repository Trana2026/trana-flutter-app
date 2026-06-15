// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_guardian_consent_link_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractGuardianConsentLinkDto {

 String get token; DateTime get expiresAt; String get verifyUrl;
/// Create a copy of ContractGuardianConsentLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractGuardianConsentLinkDtoCopyWith<ContractGuardianConsentLinkDto> get copyWith => _$ContractGuardianConsentLinkDtoCopyWithImpl<ContractGuardianConsentLinkDto>(this as ContractGuardianConsentLinkDto, _$identity);

  /// Serializes this ContractGuardianConsentLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractGuardianConsentLinkDto&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'ContractGuardianConsentLinkDto(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class $ContractGuardianConsentLinkDtoCopyWith<$Res>  {
  factory $ContractGuardianConsentLinkDtoCopyWith(ContractGuardianConsentLinkDto value, $Res Function(ContractGuardianConsentLinkDto) _then) = _$ContractGuardianConsentLinkDtoCopyWithImpl;
@useResult
$Res call({
 String token, DateTime expiresAt, String verifyUrl
});




}
/// @nodoc
class _$ContractGuardianConsentLinkDtoCopyWithImpl<$Res>
    implements $ContractGuardianConsentLinkDtoCopyWith<$Res> {
  _$ContractGuardianConsentLinkDtoCopyWithImpl(this._self, this._then);

  final ContractGuardianConsentLinkDto _self;
  final $Res Function(ContractGuardianConsentLinkDto) _then;

/// Create a copy of ContractGuardianConsentLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractGuardianConsentLinkDto].
extension ContractGuardianConsentLinkDtoPatterns on ContractGuardianConsentLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractGuardianConsentLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractGuardianConsentLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractGuardianConsentLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  DateTime expiresAt,  String verifyUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  DateTime expiresAt,  String verifyUrl)  $default,) {final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  DateTime expiresAt,  String verifyUrl)?  $default,) {final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkDto() when $default != null:
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractGuardianConsentLinkDto implements ContractGuardianConsentLinkDto {
  const _ContractGuardianConsentLinkDto({required this.token, required this.expiresAt, required this.verifyUrl});
  factory _ContractGuardianConsentLinkDto.fromJson(Map<String, dynamic> json) => _$ContractGuardianConsentLinkDtoFromJson(json);

@override final  String token;
@override final  DateTime expiresAt;
@override final  String verifyUrl;

/// Create a copy of ContractGuardianConsentLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractGuardianConsentLinkDtoCopyWith<_ContractGuardianConsentLinkDto> get copyWith => __$ContractGuardianConsentLinkDtoCopyWithImpl<_ContractGuardianConsentLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractGuardianConsentLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractGuardianConsentLinkDto&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'ContractGuardianConsentLinkDto(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class _$ContractGuardianConsentLinkDtoCopyWith<$Res> implements $ContractGuardianConsentLinkDtoCopyWith<$Res> {
  factory _$ContractGuardianConsentLinkDtoCopyWith(_ContractGuardianConsentLinkDto value, $Res Function(_ContractGuardianConsentLinkDto) _then) = __$ContractGuardianConsentLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String token, DateTime expiresAt, String verifyUrl
});




}
/// @nodoc
class __$ContractGuardianConsentLinkDtoCopyWithImpl<$Res>
    implements _$ContractGuardianConsentLinkDtoCopyWith<$Res> {
  __$ContractGuardianConsentLinkDtoCopyWithImpl(this._self, this._then);

  final _ContractGuardianConsentLinkDto _self;
  final $Res Function(_ContractGuardianConsentLinkDto) _then;

/// Create a copy of ContractGuardianConsentLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_ContractGuardianConsentLinkDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
