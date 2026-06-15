// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_guardian_consent_link_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractGuardianConsentLinkEntity {

 String get token; DateTime get expiresAt; String get verifyUrl;
/// Create a copy of ContractGuardianConsentLinkEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractGuardianConsentLinkEntityCopyWith<ContractGuardianConsentLinkEntity> get copyWith => _$ContractGuardianConsentLinkEntityCopyWithImpl<ContractGuardianConsentLinkEntity>(this as ContractGuardianConsentLinkEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractGuardianConsentLinkEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}


@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'ContractGuardianConsentLinkEntity(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class $ContractGuardianConsentLinkEntityCopyWith<$Res>  {
  factory $ContractGuardianConsentLinkEntityCopyWith(ContractGuardianConsentLinkEntity value, $Res Function(ContractGuardianConsentLinkEntity) _then) = _$ContractGuardianConsentLinkEntityCopyWithImpl;
@useResult
$Res call({
 String token, DateTime expiresAt, String verifyUrl
});




}
/// @nodoc
class _$ContractGuardianConsentLinkEntityCopyWithImpl<$Res>
    implements $ContractGuardianConsentLinkEntityCopyWith<$Res> {
  _$ContractGuardianConsentLinkEntityCopyWithImpl(this._self, this._then);

  final ContractGuardianConsentLinkEntity _self;
  final $Res Function(ContractGuardianConsentLinkEntity) _then;

/// Create a copy of ContractGuardianConsentLinkEntity
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


/// Adds pattern-matching-related methods to [ContractGuardianConsentLinkEntity].
extension ContractGuardianConsentLinkEntityPatterns on ContractGuardianConsentLinkEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractGuardianConsentLinkEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractGuardianConsentLinkEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractGuardianConsentLinkEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractGuardianConsentLinkEntity() when $default != null:
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
case _ContractGuardianConsentLinkEntity() when $default != null:
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
case _ContractGuardianConsentLinkEntity():
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
case _ContractGuardianConsentLinkEntity() when $default != null:
return $default(_that.token,_that.expiresAt,_that.verifyUrl);case _:
  return null;

}
}

}

/// @nodoc


class _ContractGuardianConsentLinkEntity implements ContractGuardianConsentLinkEntity {
  const _ContractGuardianConsentLinkEntity({required this.token, required this.expiresAt, required this.verifyUrl});
  

@override final  String token;
@override final  DateTime expiresAt;
@override final  String verifyUrl;

/// Create a copy of ContractGuardianConsentLinkEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractGuardianConsentLinkEntityCopyWith<_ContractGuardianConsentLinkEntity> get copyWith => __$ContractGuardianConsentLinkEntityCopyWithImpl<_ContractGuardianConsentLinkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractGuardianConsentLinkEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifyUrl, verifyUrl) || other.verifyUrl == verifyUrl));
}


@override
int get hashCode => Object.hash(runtimeType,token,expiresAt,verifyUrl);

@override
String toString() {
  return 'ContractGuardianConsentLinkEntity(token: $token, expiresAt: $expiresAt, verifyUrl: $verifyUrl)';
}


}

/// @nodoc
abstract mixin class _$ContractGuardianConsentLinkEntityCopyWith<$Res> implements $ContractGuardianConsentLinkEntityCopyWith<$Res> {
  factory _$ContractGuardianConsentLinkEntityCopyWith(_ContractGuardianConsentLinkEntity value, $Res Function(_ContractGuardianConsentLinkEntity) _then) = __$ContractGuardianConsentLinkEntityCopyWithImpl;
@override @useResult
$Res call({
 String token, DateTime expiresAt, String verifyUrl
});




}
/// @nodoc
class __$ContractGuardianConsentLinkEntityCopyWithImpl<$Res>
    implements _$ContractGuardianConsentLinkEntityCopyWith<$Res> {
  __$ContractGuardianConsentLinkEntityCopyWithImpl(this._self, this._then);

  final _ContractGuardianConsentLinkEntity _self;
  final $Res Function(_ContractGuardianConsentLinkEntity) _then;

/// Create a copy of ContractGuardianConsentLinkEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiresAt = null,Object? verifyUrl = null,}) {
  return _then(_ContractGuardianConsentLinkEntity(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifyUrl: null == verifyUrl ? _self.verifyUrl : verifyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
