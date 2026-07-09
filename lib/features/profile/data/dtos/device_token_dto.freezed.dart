// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceTokenDto {

 int get id; String get platform; DateTime get createdAt; DateTime? get lastUsedAt;
/// Create a copy of DeviceTokenDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceTokenDtoCopyWith<DeviceTokenDto> get copyWith => _$DeviceTokenDtoCopyWithImpl<DeviceTokenDto>(this as DeviceTokenDto, _$identity);

  /// Serializes this DeviceTokenDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceTokenDto&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,createdAt,lastUsedAt);

@override
String toString() {
  return 'DeviceTokenDto(id: $id, platform: $platform, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class $DeviceTokenDtoCopyWith<$Res>  {
  factory $DeviceTokenDtoCopyWith(DeviceTokenDto value, $Res Function(DeviceTokenDto) _then) = _$DeviceTokenDtoCopyWithImpl;
@useResult
$Res call({
 int id, String platform, DateTime createdAt, DateTime? lastUsedAt
});




}
/// @nodoc
class _$DeviceTokenDtoCopyWithImpl<$Res>
    implements $DeviceTokenDtoCopyWith<$Res> {
  _$DeviceTokenDtoCopyWithImpl(this._self, this._then);

  final DeviceTokenDto _self;
  final $Res Function(DeviceTokenDto) _then;

/// Create a copy of DeviceTokenDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? platform = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceTokenDto].
extension DeviceTokenDtoPatterns on DeviceTokenDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceTokenDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceTokenDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceTokenDto value)  $default,){
final _that = this;
switch (_that) {
case _DeviceTokenDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceTokenDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceTokenDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String platform,  DateTime createdAt,  DateTime? lastUsedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceTokenDto() when $default != null:
return $default(_that.id,_that.platform,_that.createdAt,_that.lastUsedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String platform,  DateTime createdAt,  DateTime? lastUsedAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceTokenDto():
return $default(_that.id,_that.platform,_that.createdAt,_that.lastUsedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String platform,  DateTime createdAt,  DateTime? lastUsedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceTokenDto() when $default != null:
return $default(_that.id,_that.platform,_that.createdAt,_that.lastUsedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceTokenDto implements DeviceTokenDto {
  const _DeviceTokenDto({required this.id, required this.platform, required this.createdAt, this.lastUsedAt});
  factory _DeviceTokenDto.fromJson(Map<String, dynamic> json) => _$DeviceTokenDtoFromJson(json);

@override final  int id;
@override final  String platform;
@override final  DateTime createdAt;
@override final  DateTime? lastUsedAt;

/// Create a copy of DeviceTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceTokenDtoCopyWith<_DeviceTokenDto> get copyWith => __$DeviceTokenDtoCopyWithImpl<_DeviceTokenDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceTokenDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceTokenDto&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,createdAt,lastUsedAt);

@override
String toString() {
  return 'DeviceTokenDto(id: $id, platform: $platform, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceTokenDtoCopyWith<$Res> implements $DeviceTokenDtoCopyWith<$Res> {
  factory _$DeviceTokenDtoCopyWith(_DeviceTokenDto value, $Res Function(_DeviceTokenDto) _then) = __$DeviceTokenDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String platform, DateTime createdAt, DateTime? lastUsedAt
});




}
/// @nodoc
class __$DeviceTokenDtoCopyWithImpl<$Res>
    implements _$DeviceTokenDtoCopyWith<$Res> {
  __$DeviceTokenDtoCopyWithImpl(this._self, this._then);

  final _DeviceTokenDto _self;
  final $Res Function(_DeviceTokenDto) _then;

/// Create a copy of DeviceTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? platform = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_DeviceTokenDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
