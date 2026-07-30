// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_me_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMeDto {

 String get publicCode; String? get email; String? get name; String? get phone; String get status; String? get ageGroup; String? get guardianVerifiedAt; String get shareCode;
/// Create a copy of UserMeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMeDtoCopyWith<UserMeDto> get copyWith => _$UserMeDtoCopyWithImpl<UserMeDto>(this as UserMeDto, _$identity);

  /// Serializes this UserMeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMeDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&(identical(other.shareCode, shareCode) || other.shareCode == shareCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,email,name,phone,status,ageGroup,guardianVerifiedAt,shareCode);

@override
String toString() {
  return 'UserMeDto(publicCode: $publicCode, email: $email, name: $name, phone: $phone, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, shareCode: $shareCode)';
}


}

/// @nodoc
abstract mixin class $UserMeDtoCopyWith<$Res>  {
  factory $UserMeDtoCopyWith(UserMeDto value, $Res Function(UserMeDto) _then) = _$UserMeDtoCopyWithImpl;
@useResult
$Res call({
 String publicCode, String? email, String? name, String? phone, String status, String? ageGroup, String? guardianVerifiedAt, String shareCode
});




}
/// @nodoc
class _$UserMeDtoCopyWithImpl<$Res>
    implements $UserMeDtoCopyWith<$Res> {
  _$UserMeDtoCopyWithImpl(this._self, this._then);

  final UserMeDto _self;
  final $Res Function(UserMeDto) _then;

/// Create a copy of UserMeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? email = freezed,Object? name = freezed,Object? phone = freezed,Object? status = null,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,Object? shareCode = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,shareCode: null == shareCode ? _self.shareCode : shareCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserMeDto].
extension UserMeDtoPatterns on UserMeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMeDto value)  $default,){
final _that = this;
switch (_that) {
case _UserMeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMeDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserMeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String? name,  String? phone,  String status,  String? ageGroup,  String? guardianVerifiedAt,  String shareCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMeDto() when $default != null:
return $default(_that.publicCode,_that.email,_that.name,_that.phone,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.shareCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String? name,  String? phone,  String status,  String? ageGroup,  String? guardianVerifiedAt,  String shareCode)  $default,) {final _that = this;
switch (_that) {
case _UserMeDto():
return $default(_that.publicCode,_that.email,_that.name,_that.phone,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.shareCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String? email,  String? name,  String? phone,  String status,  String? ageGroup,  String? guardianVerifiedAt,  String shareCode)?  $default,) {final _that = this;
switch (_that) {
case _UserMeDto() when $default != null:
return $default(_that.publicCode,_that.email,_that.name,_that.phone,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.shareCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserMeDto implements UserMeDto {
  const _UserMeDto({required this.publicCode, this.email, this.name, this.phone, required this.status, this.ageGroup, this.guardianVerifiedAt, required this.shareCode});
  factory _UserMeDto.fromJson(Map<String, dynamic> json) => _$UserMeDtoFromJson(json);

@override final  String publicCode;
@override final  String? email;
@override final  String? name;
@override final  String? phone;
@override final  String status;
@override final  String? ageGroup;
@override final  String? guardianVerifiedAt;
@override final  String shareCode;

/// Create a copy of UserMeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMeDtoCopyWith<_UserMeDto> get copyWith => __$UserMeDtoCopyWithImpl<_UserMeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMeDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&(identical(other.shareCode, shareCode) || other.shareCode == shareCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,email,name,phone,status,ageGroup,guardianVerifiedAt,shareCode);

@override
String toString() {
  return 'UserMeDto(publicCode: $publicCode, email: $email, name: $name, phone: $phone, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, shareCode: $shareCode)';
}


}

/// @nodoc
abstract mixin class _$UserMeDtoCopyWith<$Res> implements $UserMeDtoCopyWith<$Res> {
  factory _$UserMeDtoCopyWith(_UserMeDto value, $Res Function(_UserMeDto) _then) = __$UserMeDtoCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String? email, String? name, String? phone, String status, String? ageGroup, String? guardianVerifiedAt, String shareCode
});




}
/// @nodoc
class __$UserMeDtoCopyWithImpl<$Res>
    implements _$UserMeDtoCopyWith<$Res> {
  __$UserMeDtoCopyWithImpl(this._self, this._then);

  final _UserMeDto _self;
  final $Res Function(_UserMeDto) _then;

/// Create a copy of UserMeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? email = freezed,Object? name = freezed,Object? phone = freezed,Object? status = null,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,Object? shareCode = null,}) {
  return _then(_UserMeDto(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,shareCode: null == shareCode ? _self.shareCode : shareCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
