// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_guardian_consent_approve_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractGuardianConsentApproveEntity {

 String get publicCode; DateTime get guardianConsentAt;
/// Create a copy of ContractGuardianConsentApproveEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractGuardianConsentApproveEntityCopyWith<ContractGuardianConsentApproveEntity> get copyWith => _$ContractGuardianConsentApproveEntityCopyWithImpl<ContractGuardianConsentApproveEntity>(this as ContractGuardianConsentApproveEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractGuardianConsentApproveEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,guardianConsentAt);

@override
String toString() {
  return 'ContractGuardianConsentApproveEntity(publicCode: $publicCode, guardianConsentAt: $guardianConsentAt)';
}


}

/// @nodoc
abstract mixin class $ContractGuardianConsentApproveEntityCopyWith<$Res>  {
  factory $ContractGuardianConsentApproveEntityCopyWith(ContractGuardianConsentApproveEntity value, $Res Function(ContractGuardianConsentApproveEntity) _then) = _$ContractGuardianConsentApproveEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, DateTime guardianConsentAt
});




}
/// @nodoc
class _$ContractGuardianConsentApproveEntityCopyWithImpl<$Res>
    implements $ContractGuardianConsentApproveEntityCopyWith<$Res> {
  _$ContractGuardianConsentApproveEntityCopyWithImpl(this._self, this._then);

  final ContractGuardianConsentApproveEntity _self;
  final $Res Function(ContractGuardianConsentApproveEntity) _then;

/// Create a copy of ContractGuardianConsentApproveEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? guardianConsentAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,guardianConsentAt: null == guardianConsentAt ? _self.guardianConsentAt : guardianConsentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractGuardianConsentApproveEntity].
extension ContractGuardianConsentApproveEntityPatterns on ContractGuardianConsentApproveEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractGuardianConsentApproveEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractGuardianConsentApproveEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractGuardianConsentApproveEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractGuardianConsentApproveEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractGuardianConsentApproveEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractGuardianConsentApproveEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  DateTime guardianConsentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractGuardianConsentApproveEntity() when $default != null:
return $default(_that.publicCode,_that.guardianConsentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  DateTime guardianConsentAt)  $default,) {final _that = this;
switch (_that) {
case _ContractGuardianConsentApproveEntity():
return $default(_that.publicCode,_that.guardianConsentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  DateTime guardianConsentAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractGuardianConsentApproveEntity() when $default != null:
return $default(_that.publicCode,_that.guardianConsentAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractGuardianConsentApproveEntity implements ContractGuardianConsentApproveEntity {
  const _ContractGuardianConsentApproveEntity({required this.publicCode, required this.guardianConsentAt});
  

@override final  String publicCode;
@override final  DateTime guardianConsentAt;

/// Create a copy of ContractGuardianConsentApproveEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractGuardianConsentApproveEntityCopyWith<_ContractGuardianConsentApproveEntity> get copyWith => __$ContractGuardianConsentApproveEntityCopyWithImpl<_ContractGuardianConsentApproveEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractGuardianConsentApproveEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.guardianConsentAt, guardianConsentAt) || other.guardianConsentAt == guardianConsentAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,guardianConsentAt);

@override
String toString() {
  return 'ContractGuardianConsentApproveEntity(publicCode: $publicCode, guardianConsentAt: $guardianConsentAt)';
}


}

/// @nodoc
abstract mixin class _$ContractGuardianConsentApproveEntityCopyWith<$Res> implements $ContractGuardianConsentApproveEntityCopyWith<$Res> {
  factory _$ContractGuardianConsentApproveEntityCopyWith(_ContractGuardianConsentApproveEntity value, $Res Function(_ContractGuardianConsentApproveEntity) _then) = __$ContractGuardianConsentApproveEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, DateTime guardianConsentAt
});




}
/// @nodoc
class __$ContractGuardianConsentApproveEntityCopyWithImpl<$Res>
    implements _$ContractGuardianConsentApproveEntityCopyWith<$Res> {
  __$ContractGuardianConsentApproveEntityCopyWithImpl(this._self, this._then);

  final _ContractGuardianConsentApproveEntity _self;
  final $Res Function(_ContractGuardianConsentApproveEntity) _then;

/// Create a copy of ContractGuardianConsentApproveEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? guardianConsentAt = null,}) {
  return _then(_ContractGuardianConsentApproveEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,guardianConsentAt: null == guardianConsentAt ? _self.guardianConsentAt : guardianConsentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
