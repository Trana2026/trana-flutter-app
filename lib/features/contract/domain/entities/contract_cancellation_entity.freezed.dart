// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_cancellation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractCancellationEntity {

 int get cancellationRequestId; String get reason; String get detail; String get status; DateTime get requestedAt; DateTime? get confirmedAt; bool get isMine;
/// Create a copy of ContractCancellationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractCancellationEntityCopyWith<ContractCancellationEntity> get copyWith => _$ContractCancellationEntityCopyWithImpl<ContractCancellationEntity>(this as ContractCancellationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractCancellationEntity&&(identical(other.cancellationRequestId, cancellationRequestId) || other.cancellationRequestId == cancellationRequestId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}


@override
int get hashCode => Object.hash(runtimeType,cancellationRequestId,reason,detail,status,requestedAt,confirmedAt,isMine);

@override
String toString() {
  return 'ContractCancellationEntity(cancellationRequestId: $cancellationRequestId, reason: $reason, detail: $detail, status: $status, requestedAt: $requestedAt, confirmedAt: $confirmedAt, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class $ContractCancellationEntityCopyWith<$Res>  {
  factory $ContractCancellationEntityCopyWith(ContractCancellationEntity value, $Res Function(ContractCancellationEntity) _then) = _$ContractCancellationEntityCopyWithImpl;
@useResult
$Res call({
 int cancellationRequestId, String reason, String detail, String status, DateTime requestedAt, DateTime? confirmedAt, bool isMine
});




}
/// @nodoc
class _$ContractCancellationEntityCopyWithImpl<$Res>
    implements $ContractCancellationEntityCopyWith<$Res> {
  _$ContractCancellationEntityCopyWithImpl(this._self, this._then);

  final ContractCancellationEntity _self;
  final $Res Function(ContractCancellationEntity) _then;

/// Create a copy of ContractCancellationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cancellationRequestId = null,Object? reason = null,Object? detail = null,Object? status = null,Object? requestedAt = null,Object? confirmedAt = freezed,Object? isMine = null,}) {
  return _then(_self.copyWith(
cancellationRequestId: null == cancellationRequestId ? _self.cancellationRequestId : cancellationRequestId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractCancellationEntity].
extension ContractCancellationEntityPatterns on ContractCancellationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractCancellationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractCancellationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractCancellationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractCancellationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractCancellationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractCancellationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cancellationRequestId,  String reason,  String detail,  String status,  DateTime requestedAt,  DateTime? confirmedAt,  bool isMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractCancellationEntity() when $default != null:
return $default(_that.cancellationRequestId,_that.reason,_that.detail,_that.status,_that.requestedAt,_that.confirmedAt,_that.isMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cancellationRequestId,  String reason,  String detail,  String status,  DateTime requestedAt,  DateTime? confirmedAt,  bool isMine)  $default,) {final _that = this;
switch (_that) {
case _ContractCancellationEntity():
return $default(_that.cancellationRequestId,_that.reason,_that.detail,_that.status,_that.requestedAt,_that.confirmedAt,_that.isMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cancellationRequestId,  String reason,  String detail,  String status,  DateTime requestedAt,  DateTime? confirmedAt,  bool isMine)?  $default,) {final _that = this;
switch (_that) {
case _ContractCancellationEntity() when $default != null:
return $default(_that.cancellationRequestId,_that.reason,_that.detail,_that.status,_that.requestedAt,_that.confirmedAt,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc


class _ContractCancellationEntity implements ContractCancellationEntity {
  const _ContractCancellationEntity({required this.cancellationRequestId, required this.reason, required this.detail, required this.status, required this.requestedAt, this.confirmedAt, required this.isMine});
  

@override final  int cancellationRequestId;
@override final  String reason;
@override final  String detail;
@override final  String status;
@override final  DateTime requestedAt;
@override final  DateTime? confirmedAt;
@override final  bool isMine;

/// Create a copy of ContractCancellationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractCancellationEntityCopyWith<_ContractCancellationEntity> get copyWith => __$ContractCancellationEntityCopyWithImpl<_ContractCancellationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractCancellationEntity&&(identical(other.cancellationRequestId, cancellationRequestId) || other.cancellationRequestId == cancellationRequestId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}


@override
int get hashCode => Object.hash(runtimeType,cancellationRequestId,reason,detail,status,requestedAt,confirmedAt,isMine);

@override
String toString() {
  return 'ContractCancellationEntity(cancellationRequestId: $cancellationRequestId, reason: $reason, detail: $detail, status: $status, requestedAt: $requestedAt, confirmedAt: $confirmedAt, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$ContractCancellationEntityCopyWith<$Res> implements $ContractCancellationEntityCopyWith<$Res> {
  factory _$ContractCancellationEntityCopyWith(_ContractCancellationEntity value, $Res Function(_ContractCancellationEntity) _then) = __$ContractCancellationEntityCopyWithImpl;
@override @useResult
$Res call({
 int cancellationRequestId, String reason, String detail, String status, DateTime requestedAt, DateTime? confirmedAt, bool isMine
});




}
/// @nodoc
class __$ContractCancellationEntityCopyWithImpl<$Res>
    implements _$ContractCancellationEntityCopyWith<$Res> {
  __$ContractCancellationEntityCopyWithImpl(this._self, this._then);

  final _ContractCancellationEntity _self;
  final $Res Function(_ContractCancellationEntity) _then;

/// Create a copy of ContractCancellationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cancellationRequestId = null,Object? reason = null,Object? detail = null,Object? status = null,Object? requestedAt = null,Object? confirmedAt = freezed,Object? isMine = null,}) {
  return _then(_ContractCancellationEntity(
cancellationRequestId: null == cancellationRequestId ? _self.cancellationRequestId : cancellationRequestId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
