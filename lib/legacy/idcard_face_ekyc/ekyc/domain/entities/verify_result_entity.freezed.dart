// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyResultEntity {

 String get requestId; bool get verified;
/// Create a copy of VerifyResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyResultEntityCopyWith<VerifyResultEntity> get copyWith => _$VerifyResultEntityCopyWithImpl<VerifyResultEntity>(this as VerifyResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyResultEntity&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.verified, verified) || other.verified == verified));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,verified);

@override
String toString() {
  return 'VerifyResultEntity(requestId: $requestId, verified: $verified)';
}


}

/// @nodoc
abstract mixin class $VerifyResultEntityCopyWith<$Res>  {
  factory $VerifyResultEntityCopyWith(VerifyResultEntity value, $Res Function(VerifyResultEntity) _then) = _$VerifyResultEntityCopyWithImpl;
@useResult
$Res call({
 String requestId, bool verified
});




}
/// @nodoc
class _$VerifyResultEntityCopyWithImpl<$Res>
    implements $VerifyResultEntityCopyWith<$Res> {
  _$VerifyResultEntityCopyWithImpl(this._self, this._then);

  final VerifyResultEntity _self;
  final $Res Function(VerifyResultEntity) _then;

/// Create a copy of VerifyResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? verified = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyResultEntity].
extension VerifyResultEntityPatterns on VerifyResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _VerifyResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  bool verified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyResultEntity() when $default != null:
return $default(_that.requestId,_that.verified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  bool verified)  $default,) {final _that = this;
switch (_that) {
case _VerifyResultEntity():
return $default(_that.requestId,_that.verified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  bool verified)?  $default,) {final _that = this;
switch (_that) {
case _VerifyResultEntity() when $default != null:
return $default(_that.requestId,_that.verified);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyResultEntity implements VerifyResultEntity {
  const _VerifyResultEntity({required this.requestId, required this.verified});
  

@override final  String requestId;
@override final  bool verified;

/// Create a copy of VerifyResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyResultEntityCopyWith<_VerifyResultEntity> get copyWith => __$VerifyResultEntityCopyWithImpl<_VerifyResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyResultEntity&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.verified, verified) || other.verified == verified));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,verified);

@override
String toString() {
  return 'VerifyResultEntity(requestId: $requestId, verified: $verified)';
}


}

/// @nodoc
abstract mixin class _$VerifyResultEntityCopyWith<$Res> implements $VerifyResultEntityCopyWith<$Res> {
  factory _$VerifyResultEntityCopyWith(_VerifyResultEntity value, $Res Function(_VerifyResultEntity) _then) = __$VerifyResultEntityCopyWithImpl;
@override @useResult
$Res call({
 String requestId, bool verified
});




}
/// @nodoc
class __$VerifyResultEntityCopyWithImpl<$Res>
    implements _$VerifyResultEntityCopyWith<$Res> {
  __$VerifyResultEntityCopyWithImpl(this._self, this._then);

  final _VerifyResultEntity _self;
  final $Res Function(_VerifyResultEntity) _then;

/// Create a copy of VerifyResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? verified = null,}) {
  return _then(_VerifyResultEntity(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
