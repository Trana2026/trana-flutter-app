// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consent_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsentResultEntity {

 String? get signupSessionId;
/// Create a copy of ConsentResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsentResultEntityCopyWith<ConsentResultEntity> get copyWith => _$ConsentResultEntityCopyWithImpl<ConsentResultEntity>(this as ConsentResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsentResultEntity&&(identical(other.signupSessionId, signupSessionId) || other.signupSessionId == signupSessionId));
}


@override
int get hashCode => Object.hash(runtimeType,signupSessionId);

@override
String toString() {
  return 'ConsentResultEntity(signupSessionId: $signupSessionId)';
}


}

/// @nodoc
abstract mixin class $ConsentResultEntityCopyWith<$Res>  {
  factory $ConsentResultEntityCopyWith(ConsentResultEntity value, $Res Function(ConsentResultEntity) _then) = _$ConsentResultEntityCopyWithImpl;
@useResult
$Res call({
 String? signupSessionId
});




}
/// @nodoc
class _$ConsentResultEntityCopyWithImpl<$Res>
    implements $ConsentResultEntityCopyWith<$Res> {
  _$ConsentResultEntityCopyWithImpl(this._self, this._then);

  final ConsentResultEntity _self;
  final $Res Function(ConsentResultEntity) _then;

/// Create a copy of ConsentResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signupSessionId = freezed,}) {
  return _then(_self.copyWith(
signupSessionId: freezed == signupSessionId ? _self.signupSessionId : signupSessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsentResultEntity].
extension ConsentResultEntityPatterns on ConsentResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsentResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsentResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsentResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConsentResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsentResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConsentResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? signupSessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsentResultEntity() when $default != null:
return $default(_that.signupSessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? signupSessionId)  $default,) {final _that = this;
switch (_that) {
case _ConsentResultEntity():
return $default(_that.signupSessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? signupSessionId)?  $default,) {final _that = this;
switch (_that) {
case _ConsentResultEntity() when $default != null:
return $default(_that.signupSessionId);case _:
  return null;

}
}

}

/// @nodoc


class _ConsentResultEntity implements ConsentResultEntity {
  const _ConsentResultEntity({this.signupSessionId});
  

@override final  String? signupSessionId;

/// Create a copy of ConsentResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsentResultEntityCopyWith<_ConsentResultEntity> get copyWith => __$ConsentResultEntityCopyWithImpl<_ConsentResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsentResultEntity&&(identical(other.signupSessionId, signupSessionId) || other.signupSessionId == signupSessionId));
}


@override
int get hashCode => Object.hash(runtimeType,signupSessionId);

@override
String toString() {
  return 'ConsentResultEntity(signupSessionId: $signupSessionId)';
}


}

/// @nodoc
abstract mixin class _$ConsentResultEntityCopyWith<$Res> implements $ConsentResultEntityCopyWith<$Res> {
  factory _$ConsentResultEntityCopyWith(_ConsentResultEntity value, $Res Function(_ConsentResultEntity) _then) = __$ConsentResultEntityCopyWithImpl;
@override @useResult
$Res call({
 String? signupSessionId
});




}
/// @nodoc
class __$ConsentResultEntityCopyWithImpl<$Res>
    implements _$ConsentResultEntityCopyWith<$Res> {
  __$ConsentResultEntityCopyWithImpl(this._self, this._then);

  final _ConsentResultEntity _self;
  final $Res Function(_ConsentResultEntity) _then;

/// Create a copy of ConsentResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signupSessionId = freezed,}) {
  return _then(_ConsentResultEntity(
signupSessionId: freezed == signupSessionId ? _self.signupSessionId : signupSessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
