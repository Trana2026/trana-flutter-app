// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_inquiry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserInquiryEntity {

 String get publicCode; String? get email; String get title; String? get content; DateTime get createdAt;
/// Create a copy of UserInquiryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInquiryEntityCopyWith<UserInquiryEntity> get copyWith => _$UserInquiryEntityCopyWithImpl<UserInquiryEntity>(this as UserInquiryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInquiryEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,title,content,createdAt);

@override
String toString() {
  return 'UserInquiryEntity(publicCode: $publicCode, email: $email, title: $title, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserInquiryEntityCopyWith<$Res>  {
  factory $UserInquiryEntityCopyWith(UserInquiryEntity value, $Res Function(UserInquiryEntity) _then) = _$UserInquiryEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, String? email, String title, String? content, DateTime createdAt
});




}
/// @nodoc
class _$UserInquiryEntityCopyWithImpl<$Res>
    implements $UserInquiryEntityCopyWith<$Res> {
  _$UserInquiryEntityCopyWithImpl(this._self, this._then);

  final UserInquiryEntity _self;
  final $Res Function(UserInquiryEntity) _then;

/// Create a copy of UserInquiryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? email = freezed,Object? title = null,Object? content = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInquiryEntity].
extension UserInquiryEntityPatterns on UserInquiryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInquiryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInquiryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInquiryEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserInquiryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInquiryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserInquiryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String title,  String? content,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInquiryEntity() when $default != null:
return $default(_that.publicCode,_that.email,_that.title,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String? email,  String title,  String? content,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserInquiryEntity():
return $default(_that.publicCode,_that.email,_that.title,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String? email,  String title,  String? content,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserInquiryEntity() when $default != null:
return $default(_that.publicCode,_that.email,_that.title,_that.content,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserInquiryEntity implements UserInquiryEntity {
  const _UserInquiryEntity({required this.publicCode, this.email, required this.title, this.content, required this.createdAt});
  

@override final  String publicCode;
@override final  String? email;
@override final  String title;
@override final  String? content;
@override final  DateTime createdAt;

/// Create a copy of UserInquiryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInquiryEntityCopyWith<_UserInquiryEntity> get copyWith => __$UserInquiryEntityCopyWithImpl<_UserInquiryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInquiryEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,title,content,createdAt);

@override
String toString() {
  return 'UserInquiryEntity(publicCode: $publicCode, email: $email, title: $title, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserInquiryEntityCopyWith<$Res> implements $UserInquiryEntityCopyWith<$Res> {
  factory _$UserInquiryEntityCopyWith(_UserInquiryEntity value, $Res Function(_UserInquiryEntity) _then) = __$UserInquiryEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String? email, String title, String? content, DateTime createdAt
});




}
/// @nodoc
class __$UserInquiryEntityCopyWithImpl<$Res>
    implements _$UserInquiryEntityCopyWith<$Res> {
  __$UserInquiryEntityCopyWithImpl(this._self, this._then);

  final _UserInquiryEntity _self;
  final $Res Function(_UserInquiryEntity) _then;

/// Create a copy of UserInquiryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? email = freezed,Object? title = null,Object? content = freezed,Object? createdAt = null,}) {
  return _then(_UserInquiryEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
