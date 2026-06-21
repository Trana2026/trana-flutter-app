// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 int get id; String get publicId; String get ageGroup; String get accountStatus; String get name; String get email; String get phone; bool get pushEnabled; DateTime get createdAt; DateTime? get withdrawnAt;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.publicId, publicId) || other.publicId == publicId)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.accountStatus, accountStatus) || other.accountStatus == accountStatus)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.withdrawnAt, withdrawnAt) || other.withdrawnAt == withdrawnAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,publicId,ageGroup,accountStatus,name,email,phone,pushEnabled,createdAt,withdrawnAt);

@override
String toString() {
  return 'UserEntity(id: $id, publicId: $publicId, ageGroup: $ageGroup, accountStatus: $accountStatus, name: $name, email: $email, phone: $phone, pushEnabled: $pushEnabled, createdAt: $createdAt, withdrawnAt: $withdrawnAt)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 int id, String publicId, String ageGroup, String accountStatus, String name, String email, String phone, bool pushEnabled, DateTime createdAt, DateTime? withdrawnAt
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? publicId = null,Object? ageGroup = null,Object? accountStatus = null,Object? name = null,Object? email = null,Object? phone = null,Object? pushEnabled = null,Object? createdAt = null,Object? withdrawnAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,publicId: null == publicId ? _self.publicId : publicId // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String,accountStatus: null == accountStatus ? _self.accountStatus : accountStatus // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,withdrawnAt: freezed == withdrawnAt ? _self.withdrawnAt : withdrawnAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String publicId,  String ageGroup,  String accountStatus,  String name,  String email,  String phone,  bool pushEnabled,  DateTime createdAt,  DateTime? withdrawnAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.publicId,_that.ageGroup,_that.accountStatus,_that.name,_that.email,_that.phone,_that.pushEnabled,_that.createdAt,_that.withdrawnAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String publicId,  String ageGroup,  String accountStatus,  String name,  String email,  String phone,  bool pushEnabled,  DateTime createdAt,  DateTime? withdrawnAt)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.publicId,_that.ageGroup,_that.accountStatus,_that.name,_that.email,_that.phone,_that.pushEnabled,_that.createdAt,_that.withdrawnAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String publicId,  String ageGroup,  String accountStatus,  String name,  String email,  String phone,  bool pushEnabled,  DateTime createdAt,  DateTime? withdrawnAt)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.publicId,_that.ageGroup,_that.accountStatus,_that.name,_that.email,_that.phone,_that.pushEnabled,_that.createdAt,_that.withdrawnAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.id, required this.publicId, required this.ageGroup, required this.accountStatus, required this.name, required this.email, required this.phone, required this.pushEnabled, required this.createdAt, this.withdrawnAt});
  

@override final  int id;
@override final  String publicId;
@override final  String ageGroup;
@override final  String accountStatus;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  bool pushEnabled;
@override final  DateTime createdAt;
@override final  DateTime? withdrawnAt;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.publicId, publicId) || other.publicId == publicId)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.accountStatus, accountStatus) || other.accountStatus == accountStatus)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.withdrawnAt, withdrawnAt) || other.withdrawnAt == withdrawnAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,publicId,ageGroup,accountStatus,name,email,phone,pushEnabled,createdAt,withdrawnAt);

@override
String toString() {
  return 'UserEntity(id: $id, publicId: $publicId, ageGroup: $ageGroup, accountStatus: $accountStatus, name: $name, email: $email, phone: $phone, pushEnabled: $pushEnabled, createdAt: $createdAt, withdrawnAt: $withdrawnAt)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String publicId, String ageGroup, String accountStatus, String name, String email, String phone, bool pushEnabled, DateTime createdAt, DateTime? withdrawnAt
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? publicId = null,Object? ageGroup = null,Object? accountStatus = null,Object? name = null,Object? email = null,Object? phone = null,Object? pushEnabled = null,Object? createdAt = null,Object? withdrawnAt = freezed,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,publicId: null == publicId ? _self.publicId : publicId // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String,accountStatus: null == accountStatus ? _self.accountStatus : accountStatus // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,withdrawnAt: freezed == withdrawnAt ? _self.withdrawnAt : withdrawnAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
