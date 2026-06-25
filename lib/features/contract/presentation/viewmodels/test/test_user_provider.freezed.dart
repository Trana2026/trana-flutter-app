// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_user_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestUserEntity implements DiagnosticableTreeMixin {

 String get publicCode; String get email; String get nickname; String get status; AgeGroup? get ageGroup; DateTime? get guardianVerifiedAt; String get accessToken; String get refreshToken;
/// Create a copy of TestUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestUserEntityCopyWith<TestUserEntity> get copyWith => _$TestUserEntityCopyWithImpl<TestUserEntity>(this as TestUserEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TestUserEntity'))
    ..add(DiagnosticsProperty('publicCode', publicCode))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('nickname', nickname))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('ageGroup', ageGroup))..add(DiagnosticsProperty('guardianVerifiedAt', guardianVerifiedAt))..add(DiagnosticsProperty('accessToken', accessToken))..add(DiagnosticsProperty('refreshToken', refreshToken));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestUserEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,nickname,status,ageGroup,guardianVerifiedAt,accessToken,refreshToken);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TestUserEntity(publicCode: $publicCode, email: $email, nickname: $nickname, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $TestUserEntityCopyWith<$Res>  {
  factory $TestUserEntityCopyWith(TestUserEntity value, $Res Function(TestUserEntity) _then) = _$TestUserEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, String email, String nickname, String status, AgeGroup? ageGroup, DateTime? guardianVerifiedAt, String accessToken, String refreshToken
});




}
/// @nodoc
class _$TestUserEntityCopyWithImpl<$Res>
    implements $TestUserEntityCopyWith<$Res> {
  _$TestUserEntityCopyWithImpl(this._self, this._then);

  final TestUserEntity _self;
  final $Res Function(TestUserEntity) _then;

/// Create a copy of TestUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? email = null,Object? nickname = null,Object? status = null,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TestUserEntity].
extension TestUserEntityPatterns on TestUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _TestUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TestUserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String email,  String nickname,  String status,  AgeGroup? ageGroup,  DateTime? guardianVerifiedAt,  String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestUserEntity() when $default != null:
return $default(_that.publicCode,_that.email,_that.nickname,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String email,  String nickname,  String status,  AgeGroup? ageGroup,  DateTime? guardianVerifiedAt,  String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _TestUserEntity():
return $default(_that.publicCode,_that.email,_that.nickname,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String email,  String nickname,  String status,  AgeGroup? ageGroup,  DateTime? guardianVerifiedAt,  String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _TestUserEntity() when $default != null:
return $default(_that.publicCode,_that.email,_that.nickname,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc


class _TestUserEntity with DiagnosticableTreeMixin implements TestUserEntity {
  const _TestUserEntity({required this.publicCode, required this.email, required this.nickname, required this.status, this.ageGroup, this.guardianVerifiedAt, required this.accessToken, required this.refreshToken});
  

@override final  String publicCode;
@override final  String email;
@override final  String nickname;
@override final  String status;
@override final  AgeGroup? ageGroup;
@override final  DateTime? guardianVerifiedAt;
@override final  String accessToken;
@override final  String refreshToken;

/// Create a copy of TestUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestUserEntityCopyWith<_TestUserEntity> get copyWith => __$TestUserEntityCopyWithImpl<_TestUserEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TestUserEntity'))
    ..add(DiagnosticsProperty('publicCode', publicCode))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('nickname', nickname))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('ageGroup', ageGroup))..add(DiagnosticsProperty('guardianVerifiedAt', guardianVerifiedAt))..add(DiagnosticsProperty('accessToken', accessToken))..add(DiagnosticsProperty('refreshToken', refreshToken));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestUserEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,nickname,status,ageGroup,guardianVerifiedAt,accessToken,refreshToken);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TestUserEntity(publicCode: $publicCode, email: $email, nickname: $nickname, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$TestUserEntityCopyWith<$Res> implements $TestUserEntityCopyWith<$Res> {
  factory _$TestUserEntityCopyWith(_TestUserEntity value, $Res Function(_TestUserEntity) _then) = __$TestUserEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String email, String nickname, String status, AgeGroup? ageGroup, DateTime? guardianVerifiedAt, String accessToken, String refreshToken
});




}
/// @nodoc
class __$TestUserEntityCopyWithImpl<$Res>
    implements _$TestUserEntityCopyWith<$Res> {
  __$TestUserEntityCopyWithImpl(this._self, this._then);

  final _TestUserEntity _self;
  final $Res Function(_TestUserEntity) _then;

/// Create a copy of TestUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? email = null,Object? nickname = null,Object? status = null,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_TestUserEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
