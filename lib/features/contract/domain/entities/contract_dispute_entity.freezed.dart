// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_dispute_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractDisputeEntity {

 int get disputeId; String get reason; String get detail; DisputeState get status; DateTime get reportedAt; DateTime? get cancelledAt; bool get isMine;
/// Create a copy of ContractDisputeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDisputeEntityCopyWith<ContractDisputeEntity> get copyWith => _$ContractDisputeEntityCopyWithImpl<ContractDisputeEntity>(this as ContractDisputeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDisputeEntity&&(identical(other.disputeId, disputeId) || other.disputeId == disputeId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}


@override
int get hashCode => Object.hash(runtimeType,disputeId,reason,detail,status,reportedAt,cancelledAt,isMine);

@override
String toString() {
  return 'ContractDisputeEntity(disputeId: $disputeId, reason: $reason, detail: $detail, status: $status, reportedAt: $reportedAt, cancelledAt: $cancelledAt, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class $ContractDisputeEntityCopyWith<$Res>  {
  factory $ContractDisputeEntityCopyWith(ContractDisputeEntity value, $Res Function(ContractDisputeEntity) _then) = _$ContractDisputeEntityCopyWithImpl;
@useResult
$Res call({
 int disputeId, String reason, String detail, DisputeState status, DateTime reportedAt, DateTime? cancelledAt, bool isMine
});




}
/// @nodoc
class _$ContractDisputeEntityCopyWithImpl<$Res>
    implements $ContractDisputeEntityCopyWith<$Res> {
  _$ContractDisputeEntityCopyWithImpl(this._self, this._then);

  final ContractDisputeEntity _self;
  final $Res Function(ContractDisputeEntity) _then;

/// Create a copy of ContractDisputeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? disputeId = null,Object? reason = null,Object? detail = null,Object? status = null,Object? reportedAt = null,Object? cancelledAt = freezed,Object? isMine = null,}) {
  return _then(_self.copyWith(
disputeId: null == disputeId ? _self.disputeId : disputeId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DisputeState,reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractDisputeEntity].
extension ContractDisputeEntityPatterns on ContractDisputeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDisputeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDisputeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDisputeEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractDisputeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDisputeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDisputeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int disputeId,  String reason,  String detail,  DisputeState status,  DateTime reportedAt,  DateTime? cancelledAt,  bool isMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDisputeEntity() when $default != null:
return $default(_that.disputeId,_that.reason,_that.detail,_that.status,_that.reportedAt,_that.cancelledAt,_that.isMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int disputeId,  String reason,  String detail,  DisputeState status,  DateTime reportedAt,  DateTime? cancelledAt,  bool isMine)  $default,) {final _that = this;
switch (_that) {
case _ContractDisputeEntity():
return $default(_that.disputeId,_that.reason,_that.detail,_that.status,_that.reportedAt,_that.cancelledAt,_that.isMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int disputeId,  String reason,  String detail,  DisputeState status,  DateTime reportedAt,  DateTime? cancelledAt,  bool isMine)?  $default,) {final _that = this;
switch (_that) {
case _ContractDisputeEntity() when $default != null:
return $default(_that.disputeId,_that.reason,_that.detail,_that.status,_that.reportedAt,_that.cancelledAt,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc


class _ContractDisputeEntity implements ContractDisputeEntity {
  const _ContractDisputeEntity({required this.disputeId, required this.reason, required this.detail, required this.status, required this.reportedAt, this.cancelledAt, required this.isMine});
  

@override final  int disputeId;
@override final  String reason;
@override final  String detail;
@override final  DisputeState status;
@override final  DateTime reportedAt;
@override final  DateTime? cancelledAt;
@override final  bool isMine;

/// Create a copy of ContractDisputeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDisputeEntityCopyWith<_ContractDisputeEntity> get copyWith => __$ContractDisputeEntityCopyWithImpl<_ContractDisputeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDisputeEntity&&(identical(other.disputeId, disputeId) || other.disputeId == disputeId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}


@override
int get hashCode => Object.hash(runtimeType,disputeId,reason,detail,status,reportedAt,cancelledAt,isMine);

@override
String toString() {
  return 'ContractDisputeEntity(disputeId: $disputeId, reason: $reason, detail: $detail, status: $status, reportedAt: $reportedAt, cancelledAt: $cancelledAt, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$ContractDisputeEntityCopyWith<$Res> implements $ContractDisputeEntityCopyWith<$Res> {
  factory _$ContractDisputeEntityCopyWith(_ContractDisputeEntity value, $Res Function(_ContractDisputeEntity) _then) = __$ContractDisputeEntityCopyWithImpl;
@override @useResult
$Res call({
 int disputeId, String reason, String detail, DisputeState status, DateTime reportedAt, DateTime? cancelledAt, bool isMine
});




}
/// @nodoc
class __$ContractDisputeEntityCopyWithImpl<$Res>
    implements _$ContractDisputeEntityCopyWith<$Res> {
  __$ContractDisputeEntityCopyWithImpl(this._self, this._then);

  final _ContractDisputeEntity _self;
  final $Res Function(_ContractDisputeEntity) _then;

/// Create a copy of ContractDisputeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? disputeId = null,Object? reason = null,Object? detail = null,Object? status = null,Object? reportedAt = null,Object? cancelledAt = freezed,Object? isMine = null,}) {
  return _then(_ContractDisputeEntity(
disputeId: null == disputeId ? _self.disputeId : disputeId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DisputeState,reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
