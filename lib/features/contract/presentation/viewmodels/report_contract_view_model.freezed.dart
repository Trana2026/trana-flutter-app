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

 String get reason;// 신고 사유 입력값
 String get detail;// 상세 내용 입력값
 int? get recentReportId;// 최근 신고 ID
 String? get recentReportReason;// 최근 신고 사유
 String? get recentReportDetail;// 최근 신고 상세 내용
 bool get recentReportIsMine;// 최근 신고가 본인 신고인지 여부
 String? get error;
/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportContractStateCopyWith<ReportContractState> get copyWith => _$ReportContractStateCopyWithImpl<ReportContractState>(this as ReportContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportContractState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.recentReportId, recentReportId) || other.recentReportId == recentReportId)&&(identical(other.recentReportReason, recentReportReason) || other.recentReportReason == recentReportReason)&&(identical(other.recentReportDetail, recentReportDetail) || other.recentReportDetail == recentReportDetail)&&(identical(other.recentReportIsMine, recentReportIsMine) || other.recentReportIsMine == recentReportIsMine)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,recentReportId,recentReportReason,recentReportDetail,recentReportIsMine,error);

@override
String toString() {
  return 'ReportContractState(reason: $reason, detail: $detail, recentReportId: $recentReportId, recentReportReason: $recentReportReason, recentReportDetail: $recentReportDetail, recentReportIsMine: $recentReportIsMine, error: $error)';
}


}

/// @nodoc
abstract mixin class $ReportContractStateCopyWith<$Res>  {
  factory $ReportContractStateCopyWith(ReportContractState value, $Res Function(ReportContractState) _then) = _$ReportContractStateCopyWithImpl;
@useResult
$Res call({
 String reason, String detail, int? recentReportId, String? recentReportReason, String? recentReportDetail, bool recentReportIsMine, String? error
});




}
/// @nodoc
class _$ReportContractStateCopyWithImpl<$Res>
    implements $ReportContractStateCopyWith<$Res> {
  _$ReportContractStateCopyWithImpl(this._self, this._then);

  final ReportContractState _self;
  final $Res Function(ReportContractState) _then;

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? detail = null,Object? recentReportId = freezed,Object? recentReportReason = freezed,Object? recentReportDetail = freezed,Object? recentReportIsMine = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,recentReportId: freezed == recentReportId ? _self.recentReportId : recentReportId // ignore: cast_nullable_to_non_nullable
as int?,recentReportReason: freezed == recentReportReason ? _self.recentReportReason : recentReportReason // ignore: cast_nullable_to_non_nullable
as String?,recentReportDetail: freezed == recentReportDetail ? _self.recentReportDetail : recentReportDetail // ignore: cast_nullable_to_non_nullable
as String?,recentReportIsMine: null == recentReportIsMine ? _self.recentReportIsMine : recentReportIsMine // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  String detail,  int? recentReportId,  String? recentReportReason,  String? recentReportDetail,  bool recentReportIsMine,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportContractState() when $default != null:
return $default(_that.reason,_that.detail,_that.recentReportId,_that.recentReportReason,_that.recentReportDetail,_that.recentReportIsMine,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  String detail,  int? recentReportId,  String? recentReportReason,  String? recentReportDetail,  bool recentReportIsMine,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ReportContractState():
return $default(_that.reason,_that.detail,_that.recentReportId,_that.recentReportReason,_that.recentReportDetail,_that.recentReportIsMine,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  String detail,  int? recentReportId,  String? recentReportReason,  String? recentReportDetail,  bool recentReportIsMine,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ReportContractState() when $default != null:
return $default(_that.reason,_that.detail,_that.recentReportId,_that.recentReportReason,_that.recentReportDetail,_that.recentReportIsMine,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ReportContractState implements ReportContractState {
  const _ReportContractState({this.reason = '', this.detail = '', this.recentReportId, this.recentReportReason, this.recentReportDetail, this.recentReportIsMine = false, this.error});
  

@override@JsonKey() final  String reason;
// 신고 사유 입력값
@override@JsonKey() final  String detail;
// 상세 내용 입력값
@override final  int? recentReportId;
// 최근 신고 ID
@override final  String? recentReportReason;
// 최근 신고 사유
@override final  String? recentReportDetail;
// 최근 신고 상세 내용
@override@JsonKey() final  bool recentReportIsMine;
// 최근 신고가 본인 신고인지 여부
@override final  String? error;

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportContractStateCopyWith<_ReportContractState> get copyWith => __$ReportContractStateCopyWithImpl<_ReportContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportContractState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.recentReportId, recentReportId) || other.recentReportId == recentReportId)&&(identical(other.recentReportReason, recentReportReason) || other.recentReportReason == recentReportReason)&&(identical(other.recentReportDetail, recentReportDetail) || other.recentReportDetail == recentReportDetail)&&(identical(other.recentReportIsMine, recentReportIsMine) || other.recentReportIsMine == recentReportIsMine)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,recentReportId,recentReportReason,recentReportDetail,recentReportIsMine,error);

@override
String toString() {
  return 'ReportContractState(reason: $reason, detail: $detail, recentReportId: $recentReportId, recentReportReason: $recentReportReason, recentReportDetail: $recentReportDetail, recentReportIsMine: $recentReportIsMine, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ReportContractStateCopyWith<$Res> implements $ReportContractStateCopyWith<$Res> {
  factory _$ReportContractStateCopyWith(_ReportContractState value, $Res Function(_ReportContractState) _then) = __$ReportContractStateCopyWithImpl;
@override @useResult
$Res call({
 String reason, String detail, int? recentReportId, String? recentReportReason, String? recentReportDetail, bool recentReportIsMine, String? error
});




}
/// @nodoc
class __$ReportContractStateCopyWithImpl<$Res>
    implements _$ReportContractStateCopyWith<$Res> {
  __$ReportContractStateCopyWithImpl(this._self, this._then);

  final _ReportContractState _self;
  final $Res Function(_ReportContractState) _then;

/// Create a copy of ReportContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? detail = null,Object? recentReportId = freezed,Object? recentReportReason = freezed,Object? recentReportDetail = freezed,Object? recentReportIsMine = null,Object? error = freezed,}) {
  return _then(_ReportContractState(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,recentReportId: freezed == recentReportId ? _self.recentReportId : recentReportId // ignore: cast_nullable_to_non_nullable
as int?,recentReportReason: freezed == recentReportReason ? _self.recentReportReason : recentReportReason // ignore: cast_nullable_to_non_nullable
as String?,recentReportDetail: freezed == recentReportDetail ? _self.recentReportDetail : recentReportDetail // ignore: cast_nullable_to_non_nullable
as String?,recentReportIsMine: null == recentReportIsMine ? _self.recentReportIsMine : recentReportIsMine // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
