// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportContractState {

 String get reason;// 신고 사유
 String get detail;// 상세 내용
 ContractDisputeEntity? get recentReport;// 최근 신고 내역
 String? get error;
/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportContractStateCopyWith<ReportContractState> get copyWith => _$ReportContractStateCopyWithImpl<ReportContractState>(this as ReportContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportContractState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.recentReport, recentReport) || other.recentReport == recentReport)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,recentReport,error);

@override
String toString() {
  return 'ReportContractState(reason: $reason, detail: $detail, recentReport: $recentReport, error: $error)';
}


}

/// @nodoc
abstract mixin class $ReportContractStateCopyWith<$Res>  {
  factory $ReportContractStateCopyWith(ReportContractState value, $Res Function(ReportContractState) _then) = _$ReportContractStateCopyWithImpl;
@useResult
$Res call({
 String reason, String detail, ContractDisputeEntity? recentReport, String? error
});


$ContractDisputeEntityCopyWith<$Res>? get recentReport;

}
/// @nodoc
class _$ReportContractStateCopyWithImpl<$Res>
    implements $ReportContractStateCopyWith<$Res> {
  _$ReportContractStateCopyWithImpl(this._self, this._then);

  final ReportContractState _self;
  final $Res Function(ReportContractState) _then;

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? detail = null,Object? recentReport = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,recentReport: freezed == recentReport ? _self.recentReport : recentReport // ignore: cast_nullable_to_non_nullable
as ContractDisputeEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractDisputeEntityCopyWith<$Res>? get recentReport {
    if (_self.recentReport == null) {
    return null;
  }

  return $ContractDisputeEntityCopyWith<$Res>(_self.recentReport!, (value) {
    return _then(_self.copyWith(recentReport: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportContractState].
extension ReportContractStatePatterns on ReportContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportContractState value)  $default,){
final _that = this;
switch (_that) {
case _ReportContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportContractState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  String detail,  ContractDisputeEntity? recentReport,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportContractState() when $default != null:
return $default(_that.reason,_that.detail,_that.recentReport,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  String detail,  ContractDisputeEntity? recentReport,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ReportContractState():
return $default(_that.reason,_that.detail,_that.recentReport,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  String detail,  ContractDisputeEntity? recentReport,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ReportContractState() when $default != null:
return $default(_that.reason,_that.detail,_that.recentReport,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ReportContractState implements ReportContractState {
  const _ReportContractState({this.reason = '', this.detail = '', this.recentReport, this.error});
  

@override@JsonKey() final  String reason;
// 신고 사유
@override@JsonKey() final  String detail;
// 상세 내용
@override final  ContractDisputeEntity? recentReport;
// 최근 신고 내역
@override final  String? error;

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportContractStateCopyWith<_ReportContractState> get copyWith => __$ReportContractStateCopyWithImpl<_ReportContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportContractState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.recentReport, recentReport) || other.recentReport == recentReport)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,recentReport,error);

@override
String toString() {
  return 'ReportContractState(reason: $reason, detail: $detail, recentReport: $recentReport, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ReportContractStateCopyWith<$Res> implements $ReportContractStateCopyWith<$Res> {
  factory _$ReportContractStateCopyWith(_ReportContractState value, $Res Function(_ReportContractState) _then) = __$ReportContractStateCopyWithImpl;
@override @useResult
$Res call({
 String reason, String detail, ContractDisputeEntity? recentReport, String? error
});


@override $ContractDisputeEntityCopyWith<$Res>? get recentReport;

}
/// @nodoc
class __$ReportContractStateCopyWithImpl<$Res>
    implements _$ReportContractStateCopyWith<$Res> {
  __$ReportContractStateCopyWithImpl(this._self, this._then);

  final _ReportContractState _self;
  final $Res Function(_ReportContractState) _then;

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? detail = null,Object? recentReport = freezed,Object? error = freezed,}) {
  return _then(_ReportContractState(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,recentReport: freezed == recentReport ? _self.recentReport : recentReport // ignore: cast_nullable_to_non_nullable
as ContractDisputeEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractDisputeEntityCopyWith<$Res>? get recentReport {
    if (_self.recentReport == null) {
    return null;
  }

  return $ContractDisputeEntityCopyWith<$Res>(_self.recentReport!, (value) {
    return _then(_self.copyWith(recentReport: value));
  });
}
}

// dart format on
