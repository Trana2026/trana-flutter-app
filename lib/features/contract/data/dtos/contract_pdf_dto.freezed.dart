// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_pdf_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractPdfDto {

 String get downloadUrl; int get expiresInSeconds; String get sha256;
/// Create a copy of ContractPdfDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractPdfDtoCopyWith<ContractPdfDto> get copyWith => _$ContractPdfDtoCopyWithImpl<ContractPdfDto>(this as ContractPdfDto, _$identity);

  /// Serializes this ContractPdfDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractPdfDto&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.sha256, sha256) || other.sha256 == sha256));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,downloadUrl,expiresInSeconds,sha256);

@override
String toString() {
  return 'ContractPdfDto(downloadUrl: $downloadUrl, expiresInSeconds: $expiresInSeconds, sha256: $sha256)';
}


}

/// @nodoc
abstract mixin class $ContractPdfDtoCopyWith<$Res>  {
  factory $ContractPdfDtoCopyWith(ContractPdfDto value, $Res Function(ContractPdfDto) _then) = _$ContractPdfDtoCopyWithImpl;
@useResult
$Res call({
 String downloadUrl, int expiresInSeconds, String sha256
});




}
/// @nodoc
class _$ContractPdfDtoCopyWithImpl<$Res>
    implements $ContractPdfDtoCopyWith<$Res> {
  _$ContractPdfDtoCopyWithImpl(this._self, this._then);

  final ContractPdfDto _self;
  final $Res Function(ContractPdfDto) _then;

/// Create a copy of ContractPdfDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downloadUrl = null,Object? expiresInSeconds = null,Object? sha256 = null,}) {
  return _then(_self.copyWith(
downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractPdfDto].
extension ContractPdfDtoPatterns on ContractPdfDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractPdfDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractPdfDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractPdfDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractPdfDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractPdfDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractPdfDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String downloadUrl,  int expiresInSeconds,  String sha256)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractPdfDto() when $default != null:
return $default(_that.downloadUrl,_that.expiresInSeconds,_that.sha256);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String downloadUrl,  int expiresInSeconds,  String sha256)  $default,) {final _that = this;
switch (_that) {
case _ContractPdfDto():
return $default(_that.downloadUrl,_that.expiresInSeconds,_that.sha256);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String downloadUrl,  int expiresInSeconds,  String sha256)?  $default,) {final _that = this;
switch (_that) {
case _ContractPdfDto() when $default != null:
return $default(_that.downloadUrl,_that.expiresInSeconds,_that.sha256);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractPdfDto implements ContractPdfDto {
  const _ContractPdfDto({required this.downloadUrl, required this.expiresInSeconds, required this.sha256});
  factory _ContractPdfDto.fromJson(Map<String, dynamic> json) => _$ContractPdfDtoFromJson(json);

@override final  String downloadUrl;
@override final  int expiresInSeconds;
@override final  String sha256;

/// Create a copy of ContractPdfDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractPdfDtoCopyWith<_ContractPdfDto> get copyWith => __$ContractPdfDtoCopyWithImpl<_ContractPdfDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractPdfDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractPdfDto&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.sha256, sha256) || other.sha256 == sha256));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,downloadUrl,expiresInSeconds,sha256);

@override
String toString() {
  return 'ContractPdfDto(downloadUrl: $downloadUrl, expiresInSeconds: $expiresInSeconds, sha256: $sha256)';
}


}

/// @nodoc
abstract mixin class _$ContractPdfDtoCopyWith<$Res> implements $ContractPdfDtoCopyWith<$Res> {
  factory _$ContractPdfDtoCopyWith(_ContractPdfDto value, $Res Function(_ContractPdfDto) _then) = __$ContractPdfDtoCopyWithImpl;
@override @useResult
$Res call({
 String downloadUrl, int expiresInSeconds, String sha256
});




}
/// @nodoc
class __$ContractPdfDtoCopyWithImpl<$Res>
    implements _$ContractPdfDtoCopyWith<$Res> {
  __$ContractPdfDtoCopyWithImpl(this._self, this._then);

  final _ContractPdfDto _self;
  final $Res Function(_ContractPdfDto) _then;

/// Create a copy of ContractPdfDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downloadUrl = null,Object? expiresInSeconds = null,Object? sha256 = null,}) {
  return _then(_ContractPdfDto(
downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
