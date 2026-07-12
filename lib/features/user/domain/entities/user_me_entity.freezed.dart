// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_me_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserMeEntity {

 String get publicCode; String? get email; String? get name;// 실명 (PASS 인증 유저)
 String? get phone;// 휴대폰 번호 (PASS 인증 유저)
 String get status;// ACTIVE | WITHDRAWN
 String? get ageGroup;// ADULT | MINOR | null(미완료)
 DateTime? get guardianVerifiedAt;
/// Create a copy of UserMeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMeEntityCopyWith<UserMeEntity> get copyWith => _$UserMeEntityCopyWithImpl<UserMeEntity>(this as UserMeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMeEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,name,phone,status,ageGroup,guardianVerifiedAt);

@override
String toString() {
  return 'UserMeEntity(publicCode: $publicCode, email: $email, name: $name, phone: $phone, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt)';
}


}

/// @nodoc
abstract mixin class $UserMeEntityCopyWith<$Res>  {
  factory $UserMeEntityCopyWith(UserMeEntity value, $Res Function(UserMeEntity) _then) = _$UserMeEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, String? email, String? name, String? phone, String status, String? ageGroup, DateTime? guardianVerifiedAt
});




}
/// @nodoc
class _$UserMeEntityCopyWithImpl<$Res>
    implements $UserMeEntityCopyWith<$Res> {
  _$UserMeEntityCopyWithImpl(this._self, this._then);

  final UserMeEntity _self;
  final $Res Function(UserMeEntity) _then;

/// Create a copy of UserMeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? email = freezed,Object? name = freezed,Object? phone = freezed,Object? status = null,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserMeEntity].
extension UserMeEntityPatterns on UserMeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMeEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserMeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserMeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String? name,  String? phone,  String status,  String? ageGroup,  DateTime? guardianVerifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMeEntity() when $default != null:
return $default(_that.publicCode,_that.email,_that.name,_that.phone,_that.status,_that.ageGroup,_that.guardianVerifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String? name,  String? phone,  String status,  String? ageGroup,  DateTime? guardianVerifiedAt)  $default,) {final _that = this;
switch (_that) {
case _UserMeEntity():
return $default(_that.publicCode,_that.email,_that.name,_that.phone,_that.status,_that.ageGroup,_that.guardianVerifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String? email,  String? name,  String? phone,  String status,  String? ageGroup,  DateTime? guardianVerifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserMeEntity() when $default != null:
return $default(_that.publicCode,_that.email,_that.name,_that.phone,_that.status,_that.ageGroup,_that.guardianVerifiedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserMeEntity implements UserMeEntity {
  const _UserMeEntity({required this.publicCode, this.email, this.name, this.phone, required this.status, this.ageGroup, this.guardianVerifiedAt});
  

@override final  String publicCode;
@override final  String? email;
@override final  String? name;
// 실명 (PASS 인증 유저)
@override final  String? phone;
// 휴대폰 번호 (PASS 인증 유저)
@override final  String status;
// ACTIVE | WITHDRAWN
@override final  String? ageGroup;
// ADULT | MINOR | null(미완료)
@override final  DateTime? guardianVerifiedAt;

/// Create a copy of UserMeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMeEntityCopyWith<_UserMeEntity> get copyWith => __$UserMeEntityCopyWithImpl<_UserMeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMeEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,name,phone,status,ageGroup,guardianVerifiedAt);

@override
String toString() {
  return 'UserMeEntity(publicCode: $publicCode, email: $email, name: $name, phone: $phone, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt)';
}


}

/// @nodoc
abstract mixin class _$UserMeEntityCopyWith<$Res> implements $UserMeEntityCopyWith<$Res> {
  factory _$UserMeEntityCopyWith(_UserMeEntity value, $Res Function(_UserMeEntity) _then) = __$UserMeEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String? email, String? name, String? phone, String status, String? ageGroup, DateTime? guardianVerifiedAt
});




}
/// @nodoc
class __$UserMeEntityCopyWithImpl<$Res>
    implements _$UserMeEntityCopyWith<$Res> {
  __$UserMeEntityCopyWithImpl(this._self, this._then);

  final _UserMeEntity _self;
  final $Res Function(_UserMeEntity) _then;

/// Create a copy of UserMeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? email = freezed,Object? name = freezed,Object? phone = freezed,Object? status = null,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,}) {
  return _then(_UserMeEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
