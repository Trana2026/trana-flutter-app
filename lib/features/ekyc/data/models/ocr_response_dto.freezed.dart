// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OcrResponseDto {

 String get requestId; String get idType; String get name; String get birthDate; String get gender;
/// Create a copy of OcrResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OcrResponseDtoCopyWith<OcrResponseDto> get copyWith => _$OcrResponseDtoCopyWithImpl<OcrResponseDto>(this as OcrResponseDto, _$identity);

  /// Serializes this OcrResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OcrResponseDto&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.name, name) || other.name == name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,idType,name,birthDate,gender);

@override
String toString() {
  return 'OcrResponseDto(requestId: $requestId, idType: $idType, name: $name, birthDate: $birthDate, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $OcrResponseDtoCopyWith<$Res>  {
  factory $OcrResponseDtoCopyWith(OcrResponseDto value, $Res Function(OcrResponseDto) _then) = _$OcrResponseDtoCopyWithImpl;
@useResult
$Res call({
 String requestId, String idType, String name, String birthDate, String gender
});




}
/// @nodoc
class _$OcrResponseDtoCopyWithImpl<$Res>
    implements $OcrResponseDtoCopyWith<$Res> {
  _$OcrResponseDtoCopyWithImpl(this._self, this._then);

  final OcrResponseDto _self;
  final $Res Function(OcrResponseDto) _then;

/// Create a copy of OcrResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? idType = null,Object? name = null,Object? birthDate = null,Object? gender = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OcrResponseDto].
extension OcrResponseDtoPatterns on OcrResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OcrResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OcrResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OcrResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _OcrResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OcrResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _OcrResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String idType,  String name,  String birthDate,  String gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OcrResponseDto() when $default != null:
return $default(_that.requestId,_that.idType,_that.name,_that.birthDate,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String idType,  String name,  String birthDate,  String gender)  $default,) {final _that = this;
switch (_that) {
case _OcrResponseDto():
return $default(_that.requestId,_that.idType,_that.name,_that.birthDate,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String idType,  String name,  String birthDate,  String gender)?  $default,) {final _that = this;
switch (_that) {
case _OcrResponseDto() when $default != null:
return $default(_that.requestId,_that.idType,_that.name,_that.birthDate,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OcrResponseDto implements OcrResponseDto {
  const _OcrResponseDto({required this.requestId, required this.idType, required this.name, required this.birthDate, required this.gender});
  factory _OcrResponseDto.fromJson(Map<String, dynamic> json) => _$OcrResponseDtoFromJson(json);

@override final  String requestId;
@override final  String idType;
@override final  String name;
@override final  String birthDate;
@override final  String gender;

/// Create a copy of OcrResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OcrResponseDtoCopyWith<_OcrResponseDto> get copyWith => __$OcrResponseDtoCopyWithImpl<_OcrResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OcrResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OcrResponseDto&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.name, name) || other.name == name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,idType,name,birthDate,gender);

@override
String toString() {
  return 'OcrResponseDto(requestId: $requestId, idType: $idType, name: $name, birthDate: $birthDate, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$OcrResponseDtoCopyWith<$Res> implements $OcrResponseDtoCopyWith<$Res> {
  factory _$OcrResponseDtoCopyWith(_OcrResponseDto value, $Res Function(_OcrResponseDto) _then) = __$OcrResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String idType, String name, String birthDate, String gender
});




}
/// @nodoc
class __$OcrResponseDtoCopyWithImpl<$Res>
    implements _$OcrResponseDtoCopyWith<$Res> {
  __$OcrResponseDtoCopyWithImpl(this._self, this._then);

  final _OcrResponseDto _self;
  final $Res Function(_OcrResponseDto) _then;

/// Create a copy of OcrResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? idType = null,Object? name = null,Object? birthDate = null,Object? gender = null,}) {
  return _then(_OcrResponseDto(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
