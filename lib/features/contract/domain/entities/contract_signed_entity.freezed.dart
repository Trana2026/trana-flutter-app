// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_signed_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractSignedEntity {

 String get publicCode; ContractStatus get status; int get pdfVersion; DateTime get creatorSignedAt;
/// Create a copy of ContractSignedEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractSignedEntityCopyWith<ContractSignedEntity> get copyWith => _$ContractSignedEntityCopyWithImpl<ContractSignedEntity>(this as ContractSignedEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractSignedEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfVersion, pdfVersion) || other.pdfVersion == pdfVersion)&&(identical(other.creatorSignedAt, creatorSignedAt) || other.creatorSignedAt == creatorSignedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,pdfVersion,creatorSignedAt);

@override
String toString() {
  return 'ContractSignedEntity(publicCode: $publicCode, status: $status, pdfVersion: $pdfVersion, creatorSignedAt: $creatorSignedAt)';
}


}

/// @nodoc
abstract mixin class $ContractSignedEntityCopyWith<$Res>  {
  factory $ContractSignedEntityCopyWith(ContractSignedEntity value, $Res Function(ContractSignedEntity) _then) = _$ContractSignedEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, ContractStatus status, int pdfVersion, DateTime creatorSignedAt
});




}
/// @nodoc
class _$ContractSignedEntityCopyWithImpl<$Res>
    implements $ContractSignedEntityCopyWith<$Res> {
  _$ContractSignedEntityCopyWithImpl(this._self, this._then);

  final ContractSignedEntity _self;
  final $Res Function(ContractSignedEntity) _then;

/// Create a copy of ContractSignedEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? pdfVersion = null,Object? creatorSignedAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,pdfVersion: null == pdfVersion ? _self.pdfVersion : pdfVersion // ignore: cast_nullable_to_non_nullable
as int,creatorSignedAt: null == creatorSignedAt ? _self.creatorSignedAt : creatorSignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractSignedEntity].
extension ContractSignedEntityPatterns on ContractSignedEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractSignedEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractSignedEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractSignedEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractSignedEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractSignedEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractSignedEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  int pdfVersion,  DateTime creatorSignedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractSignedEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.creatorSignedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  int pdfVersion,  DateTime creatorSignedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractSignedEntity():
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.creatorSignedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  ContractStatus status,  int pdfVersion,  DateTime creatorSignedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractSignedEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.creatorSignedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractSignedEntity implements ContractSignedEntity {
  const _ContractSignedEntity({required this.publicCode, required this.status, required this.pdfVersion, required this.creatorSignedAt});
  

@override final  String publicCode;
@override final  ContractStatus status;
@override final  int pdfVersion;
@override final  DateTime creatorSignedAt;

/// Create a copy of ContractSignedEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractSignedEntityCopyWith<_ContractSignedEntity> get copyWith => __$ContractSignedEntityCopyWithImpl<_ContractSignedEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractSignedEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfVersion, pdfVersion) || other.pdfVersion == pdfVersion)&&(identical(other.creatorSignedAt, creatorSignedAt) || other.creatorSignedAt == creatorSignedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,pdfVersion,creatorSignedAt);

@override
String toString() {
  return 'ContractSignedEntity(publicCode: $publicCode, status: $status, pdfVersion: $pdfVersion, creatorSignedAt: $creatorSignedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractSignedEntityCopyWith<$Res> implements $ContractSignedEntityCopyWith<$Res> {
  factory _$ContractSignedEntityCopyWith(_ContractSignedEntity value, $Res Function(_ContractSignedEntity) _then) = __$ContractSignedEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, ContractStatus status, int pdfVersion, DateTime creatorSignedAt
});




}
/// @nodoc
class __$ContractSignedEntityCopyWithImpl<$Res>
    implements _$ContractSignedEntityCopyWith<$Res> {
  __$ContractSignedEntityCopyWithImpl(this._self, this._then);

  final _ContractSignedEntity _self;
  final $Res Function(_ContractSignedEntity) _then;

/// Create a copy of ContractSignedEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? pdfVersion = null,Object? creatorSignedAt = null,}) {
  return _then(_ContractSignedEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,pdfVersion: null == pdfVersion ? _self.pdfVersion : pdfVersion // ignore: cast_nullable_to_non_nullable
as int,creatorSignedAt: null == creatorSignedAt ? _self.creatorSignedAt : creatorSignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
