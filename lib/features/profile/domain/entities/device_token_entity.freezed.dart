// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceTokenEntity {

 int get id; DevicePlatform get platform; DateTime get createdAt; DateTime? get lastUsedAt;
/// Create a copy of DeviceTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceTokenEntityCopyWith<DeviceTokenEntity> get copyWith => _$DeviceTokenEntityCopyWithImpl<DeviceTokenEntity>(this as DeviceTokenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceTokenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,platform,createdAt,lastUsedAt);

@override
String toString() {
  return 'DeviceTokenEntity(id: $id, platform: $platform, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class $DeviceTokenEntityCopyWith<$Res>  {
  factory $DeviceTokenEntityCopyWith(DeviceTokenEntity value, $Res Function(DeviceTokenEntity) _then) = _$DeviceTokenEntityCopyWithImpl;
@useResult
$Res call({
 int id, DevicePlatform platform, DateTime createdAt, DateTime? lastUsedAt
});




}
/// @nodoc
class _$DeviceTokenEntityCopyWithImpl<$Res>
    implements $DeviceTokenEntityCopyWith<$Res> {
  _$DeviceTokenEntityCopyWithImpl(this._self, this._then);

  final DeviceTokenEntity _self;
  final $Res Function(DeviceTokenEntity) _then;

/// Create a copy of DeviceTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? platform = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as DevicePlatform,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceTokenEntity].
extension DeviceTokenEntityPatterns on DeviceTokenEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceTokenEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceTokenEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceTokenEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeviceTokenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceTokenEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceTokenEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DevicePlatform platform,  DateTime createdAt,  DateTime? lastUsedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceTokenEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DevicePlatform platform,  DateTime createdAt,  DateTime? lastUsedAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceTokenEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DevicePlatform platform,  DateTime createdAt,  DateTime? lastUsedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceTokenEntity() when $default != null:
return $default(_that.id,_that.platform,_that.createdAt,_that.lastUsedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceTokenEntity implements DeviceTokenEntity {
  const _DeviceTokenEntity({required this.id, required this.platform, required this.createdAt, this.lastUsedAt});
  

@override final  int id;
@override final  DevicePlatform platform;
@override final  DateTime createdAt;
@override final  DateTime? lastUsedAt;

/// Create a copy of DeviceTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceTokenEntityCopyWith<_DeviceTokenEntity> get copyWith => __$DeviceTokenEntityCopyWithImpl<_DeviceTokenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceTokenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,platform,createdAt,lastUsedAt);

@override
String toString() {
  return 'DeviceTokenEntity(id: $id, platform: $platform, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceTokenEntityCopyWith<$Res> implements $DeviceTokenEntityCopyWith<$Res> {
  factory _$DeviceTokenEntityCopyWith(_DeviceTokenEntity value, $Res Function(_DeviceTokenEntity) _then) = __$DeviceTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, DevicePlatform platform, DateTime createdAt, DateTime? lastUsedAt
});




}
/// @nodoc
class __$DeviceTokenEntityCopyWithImpl<$Res>
    implements _$DeviceTokenEntityCopyWith<$Res> {
  __$DeviceTokenEntityCopyWithImpl(this._self, this._then);

  final _DeviceTokenEntity _self;
  final $Res Function(_DeviceTokenEntity) _then;

/// Create a copy of DeviceTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? platform = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_DeviceTokenEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as DevicePlatform,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
