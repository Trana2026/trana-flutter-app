// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_parties_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractPartiesEntity {

 int? get id; int get contractId;// 계약 ID
 int get userId;// 사용자 ID
 Role get role;// 역할
 PartyType get partyType;// 계약 당사자 유형
 bool get validated;// 해당 거래 내 인증 여부 (false: 미성년자 미인증 시)
 DateTime? get signedAt;// 서명 일시
 DateTime get createdAt;
/// Create a copy of ContractPartiesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractPartiesEntityCopyWith<ContractPartiesEntity> get copyWith => _$ContractPartiesEntityCopyWithImpl<ContractPartiesEntity>(this as ContractPartiesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractPartiesEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.validated, validated) || other.validated == validated)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,contractId,userId,role,partyType,validated,signedAt,createdAt);

@override
String toString() {
  return 'ContractPartiesEntity(id: $id, contractId: $contractId, userId: $userId, role: $role, partyType: $partyType, validated: $validated, signedAt: $signedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ContractPartiesEntityCopyWith<$Res>  {
  factory $ContractPartiesEntityCopyWith(ContractPartiesEntity value, $Res Function(ContractPartiesEntity) _then) = _$ContractPartiesEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int contractId, int userId, Role role, PartyType partyType, bool validated, DateTime? signedAt, DateTime createdAt
});




}
/// @nodoc
class _$ContractPartiesEntityCopyWithImpl<$Res>
    implements $ContractPartiesEntityCopyWith<$Res> {
  _$ContractPartiesEntityCopyWithImpl(this._self, this._then);

  final ContractPartiesEntity _self;
  final $Res Function(ContractPartiesEntity) _then;

/// Create a copy of ContractPartiesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? contractId = null,Object? userId = null,Object? role = null,Object? partyType = null,Object? validated = null,Object? signedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,partyType: null == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as PartyType,validated: null == validated ? _self.validated : validated // ignore: cast_nullable_to_non_nullable
as bool,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractPartiesEntity].
extension ContractPartiesEntityPatterns on ContractPartiesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractPartiesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractPartiesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractPartiesEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractPartiesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractPartiesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractPartiesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int contractId,  int userId,  Role role,  PartyType partyType,  bool validated,  DateTime? signedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractPartiesEntity() when $default != null:
return $default(_that.id,_that.contractId,_that.userId,_that.role,_that.partyType,_that.validated,_that.signedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int contractId,  int userId,  Role role,  PartyType partyType,  bool validated,  DateTime? signedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ContractPartiesEntity():
return $default(_that.id,_that.contractId,_that.userId,_that.role,_that.partyType,_that.validated,_that.signedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int contractId,  int userId,  Role role,  PartyType partyType,  bool validated,  DateTime? signedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractPartiesEntity() when $default != null:
return $default(_that.id,_that.contractId,_that.userId,_that.role,_that.partyType,_that.validated,_that.signedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractPartiesEntity implements ContractPartiesEntity {
  const _ContractPartiesEntity({this.id, required this.contractId, required this.userId, required this.role, required this.partyType, required this.validated, this.signedAt, required this.createdAt});
  

@override final  int? id;
@override final  int contractId;
// 계약 ID
@override final  int userId;
// 사용자 ID
@override final  Role role;
// 역할
@override final  PartyType partyType;
// 계약 당사자 유형
@override final  bool validated;
// 해당 거래 내 인증 여부 (false: 미성년자 미인증 시)
@override final  DateTime? signedAt;
// 서명 일시
@override final  DateTime createdAt;

/// Create a copy of ContractPartiesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractPartiesEntityCopyWith<_ContractPartiesEntity> get copyWith => __$ContractPartiesEntityCopyWithImpl<_ContractPartiesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractPartiesEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.validated, validated) || other.validated == validated)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,contractId,userId,role,partyType,validated,signedAt,createdAt);

@override
String toString() {
  return 'ContractPartiesEntity(id: $id, contractId: $contractId, userId: $userId, role: $role, partyType: $partyType, validated: $validated, signedAt: $signedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ContractPartiesEntityCopyWith<$Res> implements $ContractPartiesEntityCopyWith<$Res> {
  factory _$ContractPartiesEntityCopyWith(_ContractPartiesEntity value, $Res Function(_ContractPartiesEntity) _then) = __$ContractPartiesEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int contractId, int userId, Role role, PartyType partyType, bool validated, DateTime? signedAt, DateTime createdAt
});




}
/// @nodoc
class __$ContractPartiesEntityCopyWithImpl<$Res>
    implements _$ContractPartiesEntityCopyWith<$Res> {
  __$ContractPartiesEntityCopyWithImpl(this._self, this._then);

  final _ContractPartiesEntity _self;
  final $Res Function(_ContractPartiesEntity) _then;

/// Create a copy of ContractPartiesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? contractId = null,Object? userId = null,Object? role = null,Object? partyType = null,Object? validated = null,Object? signedAt = freezed,Object? createdAt = null,}) {
  return _then(_ContractPartiesEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,partyType: null == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as PartyType,validated: null == validated ? _self.validated : validated // ignore: cast_nullable_to_non_nullable
as bool,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
