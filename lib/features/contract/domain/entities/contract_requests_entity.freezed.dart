// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_requests_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractRequestsEntity {

 int get contractId;// 계약 ID
 String get token;// 초대 토큰
 DateTime get createdAt;
/// Create a copy of ContractRequestsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractRequestsEntityCopyWith<ContractRequestsEntity> get copyWith => _$ContractRequestsEntityCopyWithImpl<ContractRequestsEntity>(this as ContractRequestsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractRequestsEntity&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.token, token) || other.token == token)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,contractId,token,createdAt);

@override
String toString() {
  return 'ContractRequestsEntity(contractId: $contractId, token: $token, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ContractRequestsEntityCopyWith<$Res>  {
  factory $ContractRequestsEntityCopyWith(ContractRequestsEntity value, $Res Function(ContractRequestsEntity) _then) = _$ContractRequestsEntityCopyWithImpl;
@useResult
$Res call({
 int contractId, String token, DateTime createdAt
});




}
/// @nodoc
class _$ContractRequestsEntityCopyWithImpl<$Res>
    implements $ContractRequestsEntityCopyWith<$Res> {
  _$ContractRequestsEntityCopyWithImpl(this._self, this._then);

  final ContractRequestsEntity _self;
  final $Res Function(ContractRequestsEntity) _then;

/// Create a copy of ContractRequestsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contractId = null,Object? token = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractRequestsEntity].
extension ContractRequestsEntityPatterns on ContractRequestsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractInviteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractInviteEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractInviteEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractInviteEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractInviteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractInviteEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int contractId,  String token,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractInviteEntity() when $default != null:
return $default(_that.contractId,_that.token,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int contractId,  String token,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ContractInviteEntity():
return $default(_that.contractId,_that.token,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int contractId,  String token,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractInviteEntity() when $default != null:
return $default(_that.contractId,_that.token,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractInviteEntity implements ContractRequestsEntity {
  const _ContractInviteEntity({required this.contractId, required this.token, required this.createdAt});
  

@override final  int contractId;
// 계약 ID
@override final  String token;
// 초대 토큰
@override final  DateTime createdAt;

/// Create a copy of ContractRequestsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractInviteEntityCopyWith<_ContractInviteEntity> get copyWith => __$ContractInviteEntityCopyWithImpl<_ContractInviteEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractInviteEntity&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.token, token) || other.token == token)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,contractId,token,createdAt);

@override
String toString() {
  return 'ContractRequestsEntity(contractId: $contractId, token: $token, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ContractInviteEntityCopyWith<$Res> implements $ContractRequestsEntityCopyWith<$Res> {
  factory _$ContractInviteEntityCopyWith(_ContractInviteEntity value, $Res Function(_ContractInviteEntity) _then) = __$ContractInviteEntityCopyWithImpl;
@override @useResult
$Res call({
 int contractId, String token, DateTime createdAt
});




}
/// @nodoc
class __$ContractInviteEntityCopyWithImpl<$Res>
    implements _$ContractInviteEntityCopyWith<$Res> {
  __$ContractInviteEntityCopyWithImpl(this._self, this._then);

  final _ContractInviteEntity _self;
  final $Res Function(_ContractInviteEntity) _then;

/// Create a copy of ContractRequestsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contractId = null,Object? token = null,Object? createdAt = null,}) {
  return _then(_ContractInviteEntity(
contractId: null == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
