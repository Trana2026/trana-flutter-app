// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_receiver_signed_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractReceiverSignedEntity {

 String get publicCode; ContractStatus get status; int get pdfVersion; DateTime get receiverSignedAt;
/// Create a copy of ContractReceiverSignedEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractReceiverSignedEntityCopyWith<ContractReceiverSignedEntity> get copyWith => _$ContractReceiverSignedEntityCopyWithImpl<ContractReceiverSignedEntity>(this as ContractReceiverSignedEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractReceiverSignedEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfVersion, pdfVersion) || other.pdfVersion == pdfVersion)&&(identical(other.receiverSignedAt, receiverSignedAt) || other.receiverSignedAt == receiverSignedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,pdfVersion,receiverSignedAt);

@override
String toString() {
  return 'ContractReceiverSignedEntity(publicCode: $publicCode, status: $status, pdfVersion: $pdfVersion, receiverSignedAt: $receiverSignedAt)';
}


}

/// @nodoc
abstract mixin class $ContractReceiverSignedEntityCopyWith<$Res>  {
  factory $ContractReceiverSignedEntityCopyWith(ContractReceiverSignedEntity value, $Res Function(ContractReceiverSignedEntity) _then) = _$ContractReceiverSignedEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, ContractStatus status, int pdfVersion, DateTime receiverSignedAt
});




}
/// @nodoc
class _$ContractReceiverSignedEntityCopyWithImpl<$Res>
    implements $ContractReceiverSignedEntityCopyWith<$Res> {
  _$ContractReceiverSignedEntityCopyWithImpl(this._self, this._then);

  final ContractReceiverSignedEntity _self;
  final $Res Function(ContractReceiverSignedEntity) _then;

/// Create a copy of ContractReceiverSignedEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? pdfVersion = null,Object? receiverSignedAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,pdfVersion: null == pdfVersion ? _self.pdfVersion : pdfVersion // ignore: cast_nullable_to_non_nullable
as int,receiverSignedAt: null == receiverSignedAt ? _self.receiverSignedAt : receiverSignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractReceiverSignedEntity].
extension ContractReceiverSignedEntityPatterns on ContractReceiverSignedEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractReceiverSignedEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractReceiverSignedEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractReceiverSignedEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractReceiverSignedEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractReceiverSignedEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractReceiverSignedEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  int pdfVersion,  DateTime receiverSignedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractReceiverSignedEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.receiverSignedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  int pdfVersion,  DateTime receiverSignedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractReceiverSignedEntity():
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.receiverSignedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  ContractStatus status,  int pdfVersion,  DateTime receiverSignedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractReceiverSignedEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.receiverSignedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractReceiverSignedEntity implements ContractReceiverSignedEntity {
  const _ContractReceiverSignedEntity({required this.publicCode, required this.status, required this.pdfVersion, required this.receiverSignedAt});
  

@override final  String publicCode;
@override final  ContractStatus status;
@override final  int pdfVersion;
@override final  DateTime receiverSignedAt;

/// Create a copy of ContractReceiverSignedEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractReceiverSignedEntityCopyWith<_ContractReceiverSignedEntity> get copyWith => __$ContractReceiverSignedEntityCopyWithImpl<_ContractReceiverSignedEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractReceiverSignedEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfVersion, pdfVersion) || other.pdfVersion == pdfVersion)&&(identical(other.receiverSignedAt, receiverSignedAt) || other.receiverSignedAt == receiverSignedAt));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,pdfVersion,receiverSignedAt);

@override
String toString() {
  return 'ContractReceiverSignedEntity(publicCode: $publicCode, status: $status, pdfVersion: $pdfVersion, receiverSignedAt: $receiverSignedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractReceiverSignedEntityCopyWith<$Res> implements $ContractReceiverSignedEntityCopyWith<$Res> {
  factory _$ContractReceiverSignedEntityCopyWith(_ContractReceiverSignedEntity value, $Res Function(_ContractReceiverSignedEntity) _then) = __$ContractReceiverSignedEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, ContractStatus status, int pdfVersion, DateTime receiverSignedAt
});




}
/// @nodoc
class __$ContractReceiverSignedEntityCopyWithImpl<$Res>
    implements _$ContractReceiverSignedEntityCopyWith<$Res> {
  __$ContractReceiverSignedEntityCopyWithImpl(this._self, this._then);

  final _ContractReceiverSignedEntity _self;
  final $Res Function(_ContractReceiverSignedEntity) _then;

/// Create a copy of ContractReceiverSignedEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? pdfVersion = null,Object? receiverSignedAt = null,}) {
  return _then(_ContractReceiverSignedEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,pdfVersion: null == pdfVersion ? _self.pdfVersion : pdfVersion // ignore: cast_nullable_to_non_nullable
as int,receiverSignedAt: null == receiverSignedAt ? _self.receiverSignedAt : receiverSignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
