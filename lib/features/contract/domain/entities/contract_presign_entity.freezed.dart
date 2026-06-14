// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_presign_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractPresignEntity {

 String get uploadUrl; String get s3Key; DateTime get expiresAt;
/// Create a copy of ContractPresignEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractPresignEntityCopyWith<ContractPresignEntity> get copyWith => _$ContractPresignEntityCopyWithImpl<ContractPresignEntity>(this as ContractPresignEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractPresignEntity&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,uploadUrl,s3Key,expiresAt);

@override
String toString() {
  return 'ContractPresignEntity(uploadUrl: $uploadUrl, s3Key: $s3Key, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $ContractPresignEntityCopyWith<$Res>  {
  factory $ContractPresignEntityCopyWith(ContractPresignEntity value, $Res Function(ContractPresignEntity) _then) = _$ContractPresignEntityCopyWithImpl;
@useResult
$Res call({
 String uploadUrl, String s3Key, DateTime expiresAt
});




}
/// @nodoc
class _$ContractPresignEntityCopyWithImpl<$Res>
    implements $ContractPresignEntityCopyWith<$Res> {
  _$ContractPresignEntityCopyWithImpl(this._self, this._then);

  final ContractPresignEntity _self;
  final $Res Function(ContractPresignEntity) _then;

/// Create a copy of ContractPresignEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadUrl = null,Object? s3Key = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractPresignEntity].
extension ContractPresignEntityPatterns on ContractPresignEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractPresignEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractPresignEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractPresignEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractPresignEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractPresignEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractPresignEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uploadUrl,  String s3Key,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractPresignEntity() when $default != null:
return $default(_that.uploadUrl,_that.s3Key,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uploadUrl,  String s3Key,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _ContractPresignEntity():
return $default(_that.uploadUrl,_that.s3Key,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uploadUrl,  String s3Key,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractPresignEntity() when $default != null:
return $default(_that.uploadUrl,_that.s3Key,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractPresignEntity implements ContractPresignEntity {
  const _ContractPresignEntity({required this.uploadUrl, required this.s3Key, required this.expiresAt});
  

@override final  String uploadUrl;
@override final  String s3Key;
@override final  DateTime expiresAt;

/// Create a copy of ContractPresignEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractPresignEntityCopyWith<_ContractPresignEntity> get copyWith => __$ContractPresignEntityCopyWithImpl<_ContractPresignEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractPresignEntity&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,uploadUrl,s3Key,expiresAt);

@override
String toString() {
  return 'ContractPresignEntity(uploadUrl: $uploadUrl, s3Key: $s3Key, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$ContractPresignEntityCopyWith<$Res> implements $ContractPresignEntityCopyWith<$Res> {
  factory _$ContractPresignEntityCopyWith(_ContractPresignEntity value, $Res Function(_ContractPresignEntity) _then) = __$ContractPresignEntityCopyWithImpl;
@override @useResult
$Res call({
 String uploadUrl, String s3Key, DateTime expiresAt
});




}
/// @nodoc
class __$ContractPresignEntityCopyWithImpl<$Res>
    implements _$ContractPresignEntityCopyWith<$Res> {
  __$ContractPresignEntityCopyWithImpl(this._self, this._then);

  final _ContractPresignEntity _self;
  final $Res Function(_ContractPresignEntity) _then;

/// Create a copy of ContractPresignEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadUrl = null,Object? s3Key = null,Object? expiresAt = null,}) {
  return _then(_ContractPresignEntity(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
