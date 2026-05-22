// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_photos_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductPhotosEntity {

 int? get id; int get contractID;// 계약 ID
 String get s3Key;// 사진 S3 경로
 int get displayOrder;// 표시 순서
 DateTime get createdAt;
/// Create a copy of ProductPhotosEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPhotosEntityCopyWith<ProductPhotosEntity> get copyWith => _$ProductPhotosEntityCopyWithImpl<ProductPhotosEntity>(this as ProductPhotosEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPhotosEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.contractID, contractID) || other.contractID == contractID)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,contractID,s3Key,displayOrder,createdAt);

@override
String toString() {
  return 'ProductPhotosEntity(id: $id, contractID: $contractID, s3Key: $s3Key, displayOrder: $displayOrder, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProductPhotosEntityCopyWith<$Res>  {
  factory $ProductPhotosEntityCopyWith(ProductPhotosEntity value, $Res Function(ProductPhotosEntity) _then) = _$ProductPhotosEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int contractID, String s3Key, int displayOrder, DateTime createdAt
});




}
/// @nodoc
class _$ProductPhotosEntityCopyWithImpl<$Res>
    implements $ProductPhotosEntityCopyWith<$Res> {
  _$ProductPhotosEntityCopyWithImpl(this._self, this._then);

  final ProductPhotosEntity _self;
  final $Res Function(ProductPhotosEntity) _then;

/// Create a copy of ProductPhotosEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? contractID = null,Object? s3Key = null,Object? displayOrder = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,contractID: null == contractID ? _self.contractID : contractID // ignore: cast_nullable_to_non_nullable
as int,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPhotosEntity].
extension ProductPhotosEntityPatterns on ProductPhotosEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPhotosEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPhotosEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPhotosEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductPhotosEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPhotosEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPhotosEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int contractID,  String s3Key,  int displayOrder,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPhotosEntity() when $default != null:
return $default(_that.id,_that.contractID,_that.s3Key,_that.displayOrder,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int contractID,  String s3Key,  int displayOrder,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProductPhotosEntity():
return $default(_that.id,_that.contractID,_that.s3Key,_that.displayOrder,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int contractID,  String s3Key,  int displayOrder,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductPhotosEntity() when $default != null:
return $default(_that.id,_that.contractID,_that.s3Key,_that.displayOrder,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ProductPhotosEntity implements ProductPhotosEntity {
  const _ProductPhotosEntity({this.id, required this.contractID, required this.s3Key, required this.displayOrder, required this.createdAt});
  

@override final  int? id;
@override final  int contractID;
// 계약 ID
@override final  String s3Key;
// 사진 S3 경로
@override final  int displayOrder;
// 표시 순서
@override final  DateTime createdAt;

/// Create a copy of ProductPhotosEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPhotosEntityCopyWith<_ProductPhotosEntity> get copyWith => __$ProductPhotosEntityCopyWithImpl<_ProductPhotosEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPhotosEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.contractID, contractID) || other.contractID == contractID)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,contractID,s3Key,displayOrder,createdAt);

@override
String toString() {
  return 'ProductPhotosEntity(id: $id, contractID: $contractID, s3Key: $s3Key, displayOrder: $displayOrder, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProductPhotosEntityCopyWith<$Res> implements $ProductPhotosEntityCopyWith<$Res> {
  factory _$ProductPhotosEntityCopyWith(_ProductPhotosEntity value, $Res Function(_ProductPhotosEntity) _then) = __$ProductPhotosEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int contractID, String s3Key, int displayOrder, DateTime createdAt
});




}
/// @nodoc
class __$ProductPhotosEntityCopyWithImpl<$Res>
    implements _$ProductPhotosEntityCopyWith<$Res> {
  __$ProductPhotosEntityCopyWithImpl(this._self, this._then);

  final _ProductPhotosEntity _self;
  final $Res Function(_ProductPhotosEntity) _then;

/// Create a copy of ProductPhotosEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? contractID = null,Object? s3Key = null,Object? displayOrder = null,Object? createdAt = null,}) {
  return _then(_ProductPhotosEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,contractID: null == contractID ? _self.contractID : contractID // ignore: cast_nullable_to_non_nullable
as int,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
