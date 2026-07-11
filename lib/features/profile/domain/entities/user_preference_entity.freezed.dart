// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preference_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPreferenceEntity {

 bool get pushEnabled;
/// Create a copy of UserPreferenceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferenceEntityCopyWith<UserPreferenceEntity> get copyWith => _$UserPreferenceEntityCopyWithImpl<UserPreferenceEntity>(this as UserPreferenceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferenceEntity&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,pushEnabled);

@override
String toString() {
  return 'UserPreferenceEntity(pushEnabled: $pushEnabled)';
}


}

/// @nodoc
abstract mixin class $UserPreferenceEntityCopyWith<$Res>  {
  factory $UserPreferenceEntityCopyWith(UserPreferenceEntity value, $Res Function(UserPreferenceEntity) _then) = _$UserPreferenceEntityCopyWithImpl;
@useResult
$Res call({
 bool pushEnabled
});




}
/// @nodoc
class _$UserPreferenceEntityCopyWithImpl<$Res>
    implements $UserPreferenceEntityCopyWith<$Res> {
  _$UserPreferenceEntityCopyWithImpl(this._self, this._then);

  final UserPreferenceEntity _self;
  final $Res Function(UserPreferenceEntity) _then;

/// Create a copy of UserPreferenceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushEnabled = null,}) {
  return _then(_self.copyWith(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferenceEntity].
extension UserPreferenceEntityPatterns on UserPreferenceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferenceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferenceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferenceEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferenceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferenceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferenceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool pushEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferenceEntity() when $default != null:
return $default(_that.pushEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool pushEnabled)  $default,) {final _that = this;
switch (_that) {
case _UserPreferenceEntity():
return $default(_that.pushEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool pushEnabled)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferenceEntity() when $default != null:
return $default(_that.pushEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _UserPreferenceEntity implements UserPreferenceEntity {
  const _UserPreferenceEntity({required this.pushEnabled});
  

@override final  bool pushEnabled;

/// Create a copy of UserPreferenceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferenceEntityCopyWith<_UserPreferenceEntity> get copyWith => __$UserPreferenceEntityCopyWithImpl<_UserPreferenceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferenceEntity&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,pushEnabled);

@override
String toString() {
  return 'UserPreferenceEntity(pushEnabled: $pushEnabled)';
}


}

/// @nodoc
abstract mixin class _$UserPreferenceEntityCopyWith<$Res> implements $UserPreferenceEntityCopyWith<$Res> {
  factory _$UserPreferenceEntityCopyWith(_UserPreferenceEntity value, $Res Function(_UserPreferenceEntity) _then) = __$UserPreferenceEntityCopyWithImpl;
@override @useResult
$Res call({
 bool pushEnabled
});




}
/// @nodoc
class __$UserPreferenceEntityCopyWithImpl<$Res>
    implements _$UserPreferenceEntityCopyWith<$Res> {
  __$UserPreferenceEntityCopyWithImpl(this._self, this._then);

  final _UserPreferenceEntity _self;
  final $Res Function(_UserPreferenceEntity) _then;

/// Create a copy of UserPreferenceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pushEnabled = null,}) {
  return _then(_UserPreferenceEntity(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
