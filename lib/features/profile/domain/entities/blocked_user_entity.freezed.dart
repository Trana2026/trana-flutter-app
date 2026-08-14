// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlockedUserEntity {

 String get shareCode; DateTime get blockedAt;
/// Create a copy of BlockedUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockedUserEntityCopyWith<BlockedUserEntity> get copyWith => _$BlockedUserEntityCopyWithImpl<BlockedUserEntity>(this as BlockedUserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockedUserEntity&&(identical(other.shareCode, shareCode) || other.shareCode == shareCode)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt));
}


@override
int get hashCode => Object.hash(runtimeType,shareCode,blockedAt);

@override
String toString() {
  return 'BlockedUserEntity(shareCode: $shareCode, blockedAt: $blockedAt)';
}


}

/// @nodoc
abstract mixin class $BlockedUserEntityCopyWith<$Res>  {
  factory $BlockedUserEntityCopyWith(BlockedUserEntity value, $Res Function(BlockedUserEntity) _then) = _$BlockedUserEntityCopyWithImpl;
@useResult
$Res call({
 String shareCode, DateTime blockedAt
});




}
/// @nodoc
class _$BlockedUserEntityCopyWithImpl<$Res>
    implements $BlockedUserEntityCopyWith<$Res> {
  _$BlockedUserEntityCopyWithImpl(this._self, this._then);

  final BlockedUserEntity _self;
  final $Res Function(BlockedUserEntity) _then;

/// Create a copy of BlockedUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shareCode = null,Object? blockedAt = null,}) {
  return _then(_self.copyWith(
shareCode: null == shareCode ? _self.shareCode : shareCode // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockedUserEntity].
extension BlockedUserEntityPatterns on BlockedUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockedUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockedUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockedUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _BlockedUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockedUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BlockedUserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shareCode,  DateTime blockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockedUserEntity() when $default != null:
return $default(_that.shareCode,_that.blockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shareCode,  DateTime blockedAt)  $default,) {final _that = this;
switch (_that) {
case _BlockedUserEntity():
return $default(_that.shareCode,_that.blockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shareCode,  DateTime blockedAt)?  $default,) {final _that = this;
switch (_that) {
case _BlockedUserEntity() when $default != null:
return $default(_that.shareCode,_that.blockedAt);case _:
  return null;

}
}

}

/// @nodoc


class _BlockedUserEntity implements BlockedUserEntity {
  const _BlockedUserEntity({required this.shareCode, required this.blockedAt});
  

@override final  String shareCode;
@override final  DateTime blockedAt;

/// Create a copy of BlockedUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockedUserEntityCopyWith<_BlockedUserEntity> get copyWith => __$BlockedUserEntityCopyWithImpl<_BlockedUserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockedUserEntity&&(identical(other.shareCode, shareCode) || other.shareCode == shareCode)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt));
}


@override
int get hashCode => Object.hash(runtimeType,shareCode,blockedAt);

@override
String toString() {
  return 'BlockedUserEntity(shareCode: $shareCode, blockedAt: $blockedAt)';
}


}

/// @nodoc
abstract mixin class _$BlockedUserEntityCopyWith<$Res> implements $BlockedUserEntityCopyWith<$Res> {
  factory _$BlockedUserEntityCopyWith(_BlockedUserEntity value, $Res Function(_BlockedUserEntity) _then) = __$BlockedUserEntityCopyWithImpl;
@override @useResult
$Res call({
 String shareCode, DateTime blockedAt
});




}
/// @nodoc
class __$BlockedUserEntityCopyWithImpl<$Res>
    implements _$BlockedUserEntityCopyWith<$Res> {
  __$BlockedUserEntityCopyWithImpl(this._self, this._then);

  final _BlockedUserEntity _self;
  final $Res Function(_BlockedUserEntity) _then;

/// Create a copy of BlockedUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shareCode = null,Object? blockedAt = null,}) {
  return _then(_BlockedUserEntity(
shareCode: null == shareCode ? _self.shareCode : shareCode // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
