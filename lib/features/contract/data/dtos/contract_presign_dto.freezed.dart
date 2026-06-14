// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_presign_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractPresignDto {

 String get uploadUrl; String get s3Key; DateTime get expiresAt;
/// Create a copy of ContractPresignDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractPresignDtoCopyWith<ContractPresignDto> get copyWith => _$ContractPresignDtoCopyWithImpl<ContractPresignDto>(this as ContractPresignDto, _$identity);

  /// Serializes this ContractPresignDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractPresignDto&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,s3Key,expiresAt);

@override
String toString() {
  return 'ContractPresignDto(uploadUrl: $uploadUrl, s3Key: $s3Key, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $ContractPresignDtoCopyWith<$Res>  {
  factory $ContractPresignDtoCopyWith(ContractPresignDto value, $Res Function(ContractPresignDto) _then) = _$ContractPresignDtoCopyWithImpl;
@useResult
$Res call({
 String uploadUrl, String s3Key, DateTime expiresAt
});




}
/// @nodoc
class _$ContractPresignDtoCopyWithImpl<$Res>
    implements $ContractPresignDtoCopyWith<$Res> {
  _$ContractPresignDtoCopyWithImpl(this._self, this._then);

  final ContractPresignDto _self;
  final $Res Function(ContractPresignDto) _then;

/// Create a copy of ContractPresignDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadUrl = null,Object? s3Key = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractPresignDto].
extension ContractPresignDtoPatterns on ContractPresignDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractPresignDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractPresignDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractPresignDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractPresignDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractPresignDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractPresignDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uploadUrl,  String s3Key,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractPresignDto() when $default != null:
return $default(_that.uploadUrl,_that.s3Key,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uploadUrl,  String s3Key,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _ContractPresignDto():
return $default(_that.uploadUrl,_that.s3Key,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uploadUrl,  String s3Key,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractPresignDto() when $default != null:
return $default(_that.uploadUrl,_that.s3Key,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractPresignDto implements ContractPresignDto {
  const _ContractPresignDto({required this.uploadUrl, required this.s3Key, required this.expiresAt});
  factory _ContractPresignDto.fromJson(Map<String, dynamic> json) => _$ContractPresignDtoFromJson(json);

@override final  String uploadUrl;
@override final  String s3Key;
@override final  DateTime expiresAt;

/// Create a copy of ContractPresignDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractPresignDtoCopyWith<_ContractPresignDto> get copyWith => __$ContractPresignDtoCopyWithImpl<_ContractPresignDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractPresignDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractPresignDto&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,s3Key,expiresAt);

@override
String toString() {
  return 'ContractPresignDto(uploadUrl: $uploadUrl, s3Key: $s3Key, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$ContractPresignDtoCopyWith<$Res> implements $ContractPresignDtoCopyWith<$Res> {
  factory _$ContractPresignDtoCopyWith(_ContractPresignDto value, $Res Function(_ContractPresignDto) _then) = __$ContractPresignDtoCopyWithImpl;
@override @useResult
$Res call({
 String uploadUrl, String s3Key, DateTime expiresAt
});




}
/// @nodoc
class __$ContractPresignDtoCopyWithImpl<$Res>
    implements _$ContractPresignDtoCopyWith<$Res> {
  __$ContractPresignDtoCopyWithImpl(this._self, this._then);

  final _ContractPresignDto _self;
  final $Res Function(_ContractPresignDto) _then;

/// Create a copy of ContractPresignDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadUrl = null,Object? s3Key = null,Object? expiresAt = null,}) {
  return _then(_ContractPresignDto(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
