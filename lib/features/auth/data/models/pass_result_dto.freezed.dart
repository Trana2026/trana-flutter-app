// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pass_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PassResultDto {

 String? get purpose; String? get accessToken; String? get refreshToken; String? get publicCode; bool? get requiresGuardian; String? get resultCode; String? get statusCode; String? get resultMsg; String? get code;
/// Create a copy of PassResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassResultDtoCopyWith<PassResultDto> get copyWith => _$PassResultDtoCopyWithImpl<PassResultDto>(this as PassResultDto, _$identity);

  /// Serializes this PassResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassResultDto&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.requiresGuardian, requiresGuardian) || other.requiresGuardian == requiresGuardian)&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purpose,accessToken,refreshToken,publicCode,requiresGuardian,resultCode,statusCode,resultMsg,code);

@override
String toString() {
  return 'PassResultDto(purpose: $purpose, accessToken: $accessToken, refreshToken: $refreshToken, publicCode: $publicCode, requiresGuardian: $requiresGuardian, resultCode: $resultCode, statusCode: $statusCode, resultMsg: $resultMsg, code: $code)';
}


}

/// @nodoc
abstract mixin class $PassResultDtoCopyWith<$Res>  {
  factory $PassResultDtoCopyWith(PassResultDto value, $Res Function(PassResultDto) _then) = _$PassResultDtoCopyWithImpl;
@useResult
$Res call({
 String? purpose, String? accessToken, String? refreshToken, String? publicCode, bool? requiresGuardian, String? resultCode, String? statusCode, String? resultMsg, String? code
});




}
/// @nodoc
class _$PassResultDtoCopyWithImpl<$Res>
    implements $PassResultDtoCopyWith<$Res> {
  _$PassResultDtoCopyWithImpl(this._self, this._then);

  final PassResultDto _self;
  final $Res Function(PassResultDto) _then;

/// Create a copy of PassResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purpose = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? publicCode = freezed,Object? requiresGuardian = freezed,Object? resultCode = freezed,Object? statusCode = freezed,Object? resultMsg = freezed,Object? code = freezed,}) {
  return _then(_self.copyWith(
purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,requiresGuardian: freezed == requiresGuardian ? _self.requiresGuardian : requiresGuardian // ignore: cast_nullable_to_non_nullable
as bool?,resultCode: freezed == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,resultMsg: freezed == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PassResultDto].
extension PassResultDtoPatterns on PassResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassResultDto value)  $default,){
final _that = this;
switch (_that) {
case _PassResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _PassResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? purpose,  String? accessToken,  String? refreshToken,  String? publicCode,  bool? requiresGuardian,  String? resultCode,  String? statusCode,  String? resultMsg,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassResultDto() when $default != null:
return $default(_that.purpose,_that.accessToken,_that.refreshToken,_that.publicCode,_that.requiresGuardian,_that.resultCode,_that.statusCode,_that.resultMsg,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? purpose,  String? accessToken,  String? refreshToken,  String? publicCode,  bool? requiresGuardian,  String? resultCode,  String? statusCode,  String? resultMsg,  String? code)  $default,) {final _that = this;
switch (_that) {
case _PassResultDto():
return $default(_that.purpose,_that.accessToken,_that.refreshToken,_that.publicCode,_that.requiresGuardian,_that.resultCode,_that.statusCode,_that.resultMsg,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? purpose,  String? accessToken,  String? refreshToken,  String? publicCode,  bool? requiresGuardian,  String? resultCode,  String? statusCode,  String? resultMsg,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _PassResultDto() when $default != null:
return $default(_that.purpose,_that.accessToken,_that.refreshToken,_that.publicCode,_that.requiresGuardian,_that.resultCode,_that.statusCode,_that.resultMsg,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PassResultDto implements PassResultDto {
  const _PassResultDto({this.purpose, this.accessToken, this.refreshToken, this.publicCode, this.requiresGuardian, this.resultCode, this.statusCode, this.resultMsg, this.code});
  factory _PassResultDto.fromJson(Map<String, dynamic> json) => _$PassResultDtoFromJson(json);

@override final  String? purpose;
@override final  String? accessToken;
@override final  String? refreshToken;
@override final  String? publicCode;
@override final  bool? requiresGuardian;
@override final  String? resultCode;
@override final  String? statusCode;
@override final  String? resultMsg;
@override final  String? code;

/// Create a copy of PassResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassResultDtoCopyWith<_PassResultDto> get copyWith => __$PassResultDtoCopyWithImpl<_PassResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PassResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassResultDto&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.requiresGuardian, requiresGuardian) || other.requiresGuardian == requiresGuardian)&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purpose,accessToken,refreshToken,publicCode,requiresGuardian,resultCode,statusCode,resultMsg,code);

@override
String toString() {
  return 'PassResultDto(purpose: $purpose, accessToken: $accessToken, refreshToken: $refreshToken, publicCode: $publicCode, requiresGuardian: $requiresGuardian, resultCode: $resultCode, statusCode: $statusCode, resultMsg: $resultMsg, code: $code)';
}


}

/// @nodoc
abstract mixin class _$PassResultDtoCopyWith<$Res> implements $PassResultDtoCopyWith<$Res> {
  factory _$PassResultDtoCopyWith(_PassResultDto value, $Res Function(_PassResultDto) _then) = __$PassResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String? purpose, String? accessToken, String? refreshToken, String? publicCode, bool? requiresGuardian, String? resultCode, String? statusCode, String? resultMsg, String? code
});




}
/// @nodoc
class __$PassResultDtoCopyWithImpl<$Res>
    implements _$PassResultDtoCopyWith<$Res> {
  __$PassResultDtoCopyWithImpl(this._self, this._then);

  final _PassResultDto _self;
  final $Res Function(_PassResultDto) _then;

/// Create a copy of PassResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purpose = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? publicCode = freezed,Object? requiresGuardian = freezed,Object? resultCode = freezed,Object? statusCode = freezed,Object? resultMsg = freezed,Object? code = freezed,}) {
  return _then(_PassResultDto(
purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,requiresGuardian: freezed == requiresGuardian ? _self.requiresGuardian : requiresGuardian // ignore: cast_nullable_to_non_nullable
as bool?,resultCode: freezed == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,resultMsg: freezed == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
