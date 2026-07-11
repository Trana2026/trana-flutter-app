// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_consent_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserConsentDto {

 int get termsId; String get type; String get version; String get title; DateTime get agreedAt;
/// Create a copy of UserConsentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserConsentDtoCopyWith<UserConsentDto> get copyWith => _$UserConsentDtoCopyWithImpl<UserConsentDto>(this as UserConsentDto, _$identity);

  /// Serializes this UserConsentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserConsentDto&&(identical(other.termsId, termsId) || other.termsId == termsId)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.agreedAt, agreedAt) || other.agreedAt == agreedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,termsId,type,version,title,agreedAt);

@override
String toString() {
  return 'UserConsentDto(termsId: $termsId, type: $type, version: $version, title: $title, agreedAt: $agreedAt)';
}


}

/// @nodoc
abstract mixin class $UserConsentDtoCopyWith<$Res>  {
  factory $UserConsentDtoCopyWith(UserConsentDto value, $Res Function(UserConsentDto) _then) = _$UserConsentDtoCopyWithImpl;
@useResult
$Res call({
 int termsId, String type, String version, String title, DateTime agreedAt
});




}
/// @nodoc
class _$UserConsentDtoCopyWithImpl<$Res>
    implements $UserConsentDtoCopyWith<$Res> {
  _$UserConsentDtoCopyWithImpl(this._self, this._then);

  final UserConsentDto _self;
  final $Res Function(UserConsentDto) _then;

/// Create a copy of UserConsentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? termsId = null,Object? type = null,Object? version = null,Object? title = null,Object? agreedAt = null,}) {
  return _then(_self.copyWith(
termsId: null == termsId ? _self.termsId : termsId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agreedAt: null == agreedAt ? _self.agreedAt : agreedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserConsentDto].
extension UserConsentDtoPatterns on UserConsentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserConsentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserConsentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserConsentDto value)  $default,){
final _that = this;
switch (_that) {
case _UserConsentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserConsentDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserConsentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int termsId,  String type,  String version,  String title,  DateTime agreedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserConsentDto() when $default != null:
return $default(_that.termsId,_that.type,_that.version,_that.title,_that.agreedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int termsId,  String type,  String version,  String title,  DateTime agreedAt)  $default,) {final _that = this;
switch (_that) {
case _UserConsentDto():
return $default(_that.termsId,_that.type,_that.version,_that.title,_that.agreedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int termsId,  String type,  String version,  String title,  DateTime agreedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserConsentDto() when $default != null:
return $default(_that.termsId,_that.type,_that.version,_that.title,_that.agreedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserConsentDto implements UserConsentDto {
  const _UserConsentDto({required this.termsId, required this.type, required this.version, required this.title, required this.agreedAt});
  factory _UserConsentDto.fromJson(Map<String, dynamic> json) => _$UserConsentDtoFromJson(json);

@override final  int termsId;
@override final  String type;
@override final  String version;
@override final  String title;
@override final  DateTime agreedAt;

/// Create a copy of UserConsentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserConsentDtoCopyWith<_UserConsentDto> get copyWith => __$UserConsentDtoCopyWithImpl<_UserConsentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserConsentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserConsentDto&&(identical(other.termsId, termsId) || other.termsId == termsId)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.agreedAt, agreedAt) || other.agreedAt == agreedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,termsId,type,version,title,agreedAt);

@override
String toString() {
  return 'UserConsentDto(termsId: $termsId, type: $type, version: $version, title: $title, agreedAt: $agreedAt)';
}


}

/// @nodoc
abstract mixin class _$UserConsentDtoCopyWith<$Res> implements $UserConsentDtoCopyWith<$Res> {
  factory _$UserConsentDtoCopyWith(_UserConsentDto value, $Res Function(_UserConsentDto) _then) = __$UserConsentDtoCopyWithImpl;
@override @useResult
$Res call({
 int termsId, String type, String version, String title, DateTime agreedAt
});




}
/// @nodoc
class __$UserConsentDtoCopyWithImpl<$Res>
    implements _$UserConsentDtoCopyWith<$Res> {
  __$UserConsentDtoCopyWithImpl(this._self, this._then);

  final _UserConsentDto _self;
  final $Res Function(_UserConsentDto) _then;

/// Create a copy of UserConsentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? termsId = null,Object? type = null,Object? version = null,Object? title = null,Object? agreedAt = null,}) {
  return _then(_UserConsentDto(
termsId: null == termsId ? _self.termsId : termsId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,agreedAt: null == agreedAt ? _self.agreedAt : agreedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
