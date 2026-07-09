// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoDto {

 String get publicCode; String? get email; String get status; String get ageGroup; DateTime? get guardianVerifiedAt; String? get name; String? get birthDate; String get gender; String? get phone; bool get pushEnabled;
/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoDtoCopyWith<UserInfoDto> get copyWith => _$UserInfoDtoCopyWithImpl<UserInfoDto>(this as UserInfoDto, _$identity);

  /// Serializes this UserInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,email,status,ageGroup,guardianVerifiedAt,name,birthDate,gender,phone,pushEnabled);

@override
String toString() {
  return 'UserInfoDto(publicCode: $publicCode, email: $email, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, name: $name, birthDate: $birthDate, gender: $gender, phone: $phone, pushEnabled: $pushEnabled)';
}


}

/// @nodoc
abstract mixin class $UserInfoDtoCopyWith<$Res>  {
  factory $UserInfoDtoCopyWith(UserInfoDto value, $Res Function(UserInfoDto) _then) = _$UserInfoDtoCopyWithImpl;
@useResult
$Res call({
 String publicCode, String? email, String status, String ageGroup, DateTime? guardianVerifiedAt, String? name, String? birthDate, String gender, String? phone, bool pushEnabled
});




}
/// @nodoc
class _$UserInfoDtoCopyWithImpl<$Res>
    implements $UserInfoDtoCopyWith<$Res> {
  _$UserInfoDtoCopyWithImpl(this._self, this._then);

  final UserInfoDto _self;
  final $Res Function(UserInfoDto) _then;

/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? email = freezed,Object? status = null,Object? ageGroup = null,Object? guardianVerifiedAt = freezed,Object? name = freezed,Object? birthDate = freezed,Object? gender = null,Object? phone = freezed,Object? pushEnabled = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfoDto].
extension UserInfoDtoPatterns on UserInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _UserInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String status,  String ageGroup,  DateTime? guardianVerifiedAt,  String? name,  String? birthDate,  String gender,  String? phone,  bool pushEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
return $default(_that.publicCode,_that.email,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.name,_that.birthDate,_that.gender,_that.phone,_that.pushEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String status,  String ageGroup,  DateTime? guardianVerifiedAt,  String? name,  String? birthDate,  String gender,  String? phone,  bool pushEnabled)  $default,) {final _that = this;
switch (_that) {
case _UserInfoDto():
return $default(_that.publicCode,_that.email,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.name,_that.birthDate,_that.gender,_that.phone,_that.pushEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String? email,  String status,  String ageGroup,  DateTime? guardianVerifiedAt,  String? name,  String? birthDate,  String gender,  String? phone,  bool pushEnabled)?  $default,) {final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
return $default(_that.publicCode,_that.email,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.name,_that.birthDate,_that.gender,_that.phone,_that.pushEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInfoDto implements UserInfoDto {
  const _UserInfoDto({required this.publicCode, this.email, required this.status, required this.ageGroup, this.guardianVerifiedAt, this.name, this.birthDate, required this.gender, this.phone, required this.pushEnabled});
  factory _UserInfoDto.fromJson(Map<String, dynamic> json) => _$UserInfoDtoFromJson(json);

@override final  String publicCode;
@override final  String? email;
@override final  String status;
@override final  String ageGroup;
@override final  DateTime? guardianVerifiedAt;
@override final  String? name;
@override final  String? birthDate;
@override final  String gender;
@override final  String? phone;
@override final  bool pushEnabled;

/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoDtoCopyWith<_UserInfoDto> get copyWith => __$UserInfoDtoCopyWithImpl<_UserInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,email,status,ageGroup,guardianVerifiedAt,name,birthDate,gender,phone,pushEnabled);

@override
String toString() {
  return 'UserInfoDto(publicCode: $publicCode, email: $email, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, name: $name, birthDate: $birthDate, gender: $gender, phone: $phone, pushEnabled: $pushEnabled)';
}


}

/// @nodoc
abstract mixin class _$UserInfoDtoCopyWith<$Res> implements $UserInfoDtoCopyWith<$Res> {
  factory _$UserInfoDtoCopyWith(_UserInfoDto value, $Res Function(_UserInfoDto) _then) = __$UserInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String? email, String status, String ageGroup, DateTime? guardianVerifiedAt, String? name, String? birthDate, String gender, String? phone, bool pushEnabled
});




}
/// @nodoc
class __$UserInfoDtoCopyWithImpl<$Res>
    implements _$UserInfoDtoCopyWith<$Res> {
  __$UserInfoDtoCopyWithImpl(this._self, this._then);

  final _UserInfoDto _self;
  final $Res Function(_UserInfoDto) _then;

/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? email = freezed,Object? status = null,Object? ageGroup = null,Object? guardianVerifiedAt = freezed,Object? name = freezed,Object? birthDate = freezed,Object? gender = null,Object? phone = freezed,Object? pushEnabled = null,}) {
  return _then(_UserInfoDto(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as String,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
