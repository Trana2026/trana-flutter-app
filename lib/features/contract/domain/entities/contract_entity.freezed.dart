// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractEntity {

 String get id; String get itemName; String get price; ContractStatus get status; UserRole get userRole; DateTime get createdAt;
/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractEntityCopyWith<ContractEntity> get copyWith => _$ContractEntityCopyWithImpl<ContractEntity>(this as ContractEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemName,price,status,userRole,createdAt);

@override
String toString() {
  return 'ContractEntity(id: $id, itemName: $itemName, price: $price, status: $status, userRole: $userRole, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ContractEntityCopyWith<$Res>  {
  factory $ContractEntityCopyWith(ContractEntity value, $Res Function(ContractEntity) _then) = _$ContractEntityCopyWithImpl;
@useResult
$Res call({
 String id, String itemName, String price, ContractStatus status, UserRole userRole, DateTime createdAt
});




}
/// @nodoc
class _$ContractEntityCopyWithImpl<$Res>
    implements $ContractEntityCopyWith<$Res> {
  _$ContractEntityCopyWithImpl(this._self, this._then);

  final ContractEntity _self;
  final $Res Function(ContractEntity) _then;

/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemName = null,Object? price = null,Object? status = null,Object? userRole = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as UserRole,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractEntity].
extension ContractEntityPatterns on ContractEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String itemName,  String price,  ContractStatus status,  UserRole userRole,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
return $default(_that.id,_that.itemName,_that.price,_that.status,_that.userRole,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String itemName,  String price,  ContractStatus status,  UserRole userRole,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ContractEntity():
return $default(_that.id,_that.itemName,_that.price,_that.status,_that.userRole,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String itemName,  String price,  ContractStatus status,  UserRole userRole,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
return $default(_that.id,_that.itemName,_that.price,_that.status,_that.userRole,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractEntity implements ContractEntity {
  const _ContractEntity({required this.id, required this.itemName, required this.price, required this.status, required this.userRole, required this.createdAt});
  

@override final  String id;
@override final  String itemName;
@override final  String price;
@override final  ContractStatus status;
@override final  UserRole userRole;
@override final  DateTime createdAt;

/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractEntityCopyWith<_ContractEntity> get copyWith => __$ContractEntityCopyWithImpl<_ContractEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemName,price,status,userRole,createdAt);

@override
String toString() {
  return 'ContractEntity(id: $id, itemName: $itemName, price: $price, status: $status, userRole: $userRole, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ContractEntityCopyWith<$Res> implements $ContractEntityCopyWith<$Res> {
  factory _$ContractEntityCopyWith(_ContractEntity value, $Res Function(_ContractEntity) _then) = __$ContractEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String itemName, String price, ContractStatus status, UserRole userRole, DateTime createdAt
});




}
/// @nodoc
class __$ContractEntityCopyWithImpl<$Res>
    implements _$ContractEntityCopyWith<$Res> {
  __$ContractEntityCopyWithImpl(this._self, this._then);

  final _ContractEntity _self;
  final $Res Function(_ContractEntity) _then;

/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemName = null,Object? price = null,Object? status = null,Object? userRole = null,Object? createdAt = null,}) {
  return _then(_ContractEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as UserRole,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
