// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pass_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PassResultEntity {

 String get accessToken; String get refreshToken; String get publicCode; bool get requiresGuardian;
/// Create a copy of PassResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassResultEntityCopyWith<PassResultEntity> get copyWith => _$PassResultEntityCopyWithImpl<PassResultEntity>(this as PassResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassResultEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.requiresGuardian, requiresGuardian) || other.requiresGuardian == requiresGuardian));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,publicCode,requiresGuardian);

@override
String toString() {
  return 'PassResultEntity(accessToken: $accessToken, refreshToken: $refreshToken, publicCode: $publicCode, requiresGuardian: $requiresGuardian)';
}


}

/// @nodoc
abstract mixin class $PassResultEntityCopyWith<$Res>  {
  factory $PassResultEntityCopyWith(PassResultEntity value, $Res Function(PassResultEntity) _then) = _$PassResultEntityCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, String publicCode, bool requiresGuardian
});




}
/// @nodoc
class _$PassResultEntityCopyWithImpl<$Res>
    implements $PassResultEntityCopyWith<$Res> {
  _$PassResultEntityCopyWithImpl(this._self, this._then);

  final PassResultEntity _self;
  final $Res Function(PassResultEntity) _then;

/// Create a copy of PassResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? publicCode = null,Object? requiresGuardian = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,requiresGuardian: null == requiresGuardian ? _self.requiresGuardian : requiresGuardian // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PassResultEntity].
extension PassResultEntityPatterns on PassResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _PassResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PassResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  String publicCode,  bool requiresGuardian)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassResultEntity() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.publicCode,_that.requiresGuardian);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  String publicCode,  bool requiresGuardian)  $default,) {final _that = this;
switch (_that) {
case _PassResultEntity():
return $default(_that.accessToken,_that.refreshToken,_that.publicCode,_that.requiresGuardian);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  String publicCode,  bool requiresGuardian)?  $default,) {final _that = this;
switch (_that) {
case _PassResultEntity() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.publicCode,_that.requiresGuardian);case _:
  return null;

}
}

}

/// @nodoc


class _PassResultEntity implements PassResultEntity {
  const _PassResultEntity({required this.accessToken, required this.refreshToken, required this.publicCode, required this.requiresGuardian});
  

@override final  String accessToken;
@override final  String refreshToken;
@override final  String publicCode;
@override final  bool requiresGuardian;

/// Create a copy of PassResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassResultEntityCopyWith<_PassResultEntity> get copyWith => __$PassResultEntityCopyWithImpl<_PassResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassResultEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.requiresGuardian, requiresGuardian) || other.requiresGuardian == requiresGuardian));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,publicCode,requiresGuardian);

@override
String toString() {
  return 'PassResultEntity(accessToken: $accessToken, refreshToken: $refreshToken, publicCode: $publicCode, requiresGuardian: $requiresGuardian)';
}


}

/// @nodoc
abstract mixin class _$PassResultEntityCopyWith<$Res> implements $PassResultEntityCopyWith<$Res> {
  factory _$PassResultEntityCopyWith(_PassResultEntity value, $Res Function(_PassResultEntity) _then) = __$PassResultEntityCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, String publicCode, bool requiresGuardian
});




}
/// @nodoc
class __$PassResultEntityCopyWithImpl<$Res>
    implements _$PassResultEntityCopyWith<$Res> {
  __$PassResultEntityCopyWithImpl(this._self, this._then);

  final _PassResultEntity _self;
  final $Res Function(_PassResultEntity) _then;

/// Create a copy of PassResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? publicCode = null,Object? requiresGuardian = null,}) {
  return _then(_PassResultEntity(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,requiresGuardian: null == requiresGuardian ? _self.requiresGuardian : requiresGuardian // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
