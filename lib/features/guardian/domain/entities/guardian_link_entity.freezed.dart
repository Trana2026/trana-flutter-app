// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guardian_link_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuardianLinkEntity {

 String get token;// jnanoid 21자, 일회용
 DateTime get expiresAt; String get verifyUrl;
/// Create a copy of GuardianLinkEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuardianLinkEntityCopyWith<GuardianLinkEntity> get copyWith => _$GuardianLinkEntityCopyWithImpl<GuardianLinkEntity>(this as GuardianLinkEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuardianLinkEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}


@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'GuardianLinkEntity(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class $GuardianLinkEntityCopyWith<$Res>  {
  factory $GuardianLinkEntityCopyWith(GuardianLinkEntity value, $Res Function(GuardianLinkEntity) _then) = _$GuardianLinkEntityCopyWithImpl;
@useResult
$Res call({
 String token, DateTime expiresAt, String verifyUrl
});




}
/// @nodoc
class _$GuardianLinkEntityCopyWithImpl<$Res>
    implements $GuardianLinkEntityCopyWith<$Res> {
  _$GuardianLinkEntityCopyWithImpl(this._self, this._then);

  final GuardianLinkEntity _self;
  final $Res Function(GuardianLinkEntity) _then;

/// Create a copy of GuardianLinkEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GuardianLinkEntity].
extension GuardianLinkEntityPatterns on GuardianLinkEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuardianLinkEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuardianLinkEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuardianLinkEntity value)  $default,){
final _that = this;
switch (_that) {
case _GuardianLinkEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuardianLinkEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GuardianLinkEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  DateTime expiresAt,  String verifyUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuardianLinkEntity() when $default != null:
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  DateTime expiresAt,  String verifyUrl)  $default,) {final _that = this;
switch (_that) {
case _GuardianLinkEntity():
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  DateTime expiresAt,  String verifyUrl)?  $default,) {final _that = this;
switch (_that) {
case _GuardianLinkEntity() when $default != null:
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
  return null;

}
}

}

/// @nodoc


class _GuardianLinkEntity implements GuardianLinkEntity {
  const _GuardianLinkEntity({required this.token, required this.expiresAt, required this.verifyUrl});
  

@override final  String token;
// jnanoid 21자, 일회용
@override final  DateTime expiresAt;
@override final  String verifyUrl;

/// Create a copy of GuardianLinkEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuardianLinkEntityCopyWith<_GuardianLinkEntity> get copyWith => __$GuardianLinkEntityCopyWithImpl<_GuardianLinkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuardianLinkEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}


@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'GuardianLinkEntity(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class _$GuardianLinkEntityCopyWith<$Res> implements $GuardianLinkEntityCopyWith<$Res> {
  factory _$GuardianLinkEntityCopyWith(_GuardianLinkEntity value, $Res Function(_GuardianLinkEntity) _then) = __$GuardianLinkEntityCopyWithImpl;
@override @useResult
$Res call({
 String token, DateTime expiresAt, String verifyUrl
});




}
/// @nodoc
class __$GuardianLinkEntityCopyWithImpl<$Res>
    implements _$GuardianLinkEntityCopyWith<$Res> {
  __$GuardianLinkEntityCopyWithImpl(this._self, this._then);

  final _GuardianLinkEntity _self;
  final $Res Function(_GuardianLinkEntity) _then;

/// Create a copy of GuardianLinkEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_GuardianLinkEntity(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
