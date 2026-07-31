// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CancelContractState {

 CancellationReason get reason;// 취소 사유
 String get detail;// 상세 내용
 String? get recentCancelReason;// 최근 취소 사유
 String? get recentCancelDetail;// 최근 취소 상세 내용
 bool get recentCancelIsMine;// 최근 취소가 본인 요청인지 여부
 String? get error;
/// Create a copy of CancelContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelContractStateCopyWith<CancelContractState> get copyWith => _$CancelContractStateCopyWithImpl<CancelContractState>(this as CancelContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelContractState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.recentCancelReason, recentCancelReason) || other.recentCancelReason == recentCancelReason)&&(identical(other.recentCancelDetail, recentCancelDetail) || other.recentCancelDetail == recentCancelDetail)&&(identical(other.recentCancelIsMine, recentCancelIsMine) || other.recentCancelIsMine == recentCancelIsMine)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,recentCancelReason,recentCancelDetail,recentCancelIsMine,error);

@override
String toString() {
  return 'CancelContractState(reason: $reason, detail: $detail, recentCancelReason: $recentCancelReason, recentCancelDetail: $recentCancelDetail, recentCancelIsMine: $recentCancelIsMine, error: $error)';
}


}

/// @nodoc
abstract mixin class $CancelContractStateCopyWith<$Res>  {
  factory $CancelContractStateCopyWith(CancelContractState value, $Res Function(CancelContractState) _then) = _$CancelContractStateCopyWithImpl;
@useResult
$Res call({
 CancellationReason reason, String detail, String? recentCancelReason, String? recentCancelDetail, bool recentCancelIsMine, String? error
});




}
/// @nodoc
class _$CancelContractStateCopyWithImpl<$Res>
    implements $CancelContractStateCopyWith<$Res> {
  _$CancelContractStateCopyWithImpl(this._self, this._then);

  final CancelContractState _self;
  final $Res Function(CancelContractState) _then;

/// Create a copy of CancelContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? detail = null,Object? recentCancelReason = freezed,Object? recentCancelDetail = freezed,Object? recentCancelIsMine = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as CancellationReason,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,recentCancelReason: freezed == recentCancelReason ? _self.recentCancelReason : recentCancelReason // ignore: cast_nullable_to_non_nullable
as String?,recentCancelDetail: freezed == recentCancelDetail ? _self.recentCancelDetail : recentCancelDetail // ignore: cast_nullable_to_non_nullable
as String?,recentCancelIsMine: null == recentCancelIsMine ? _self.recentCancelIsMine : recentCancelIsMine // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CancelContractState].
extension CancelContractStatePatterns on CancelContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CancelContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CancelContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CancelContractState value)  $default,){
final _that = this;
switch (_that) {
case _CancelContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CancelContractState value)?  $default,){
final _that = this;
switch (_that) {
case _CancelContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CancellationReason reason,  String detail,  String? recentCancelReason,  String? recentCancelDetail,  bool recentCancelIsMine,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CancelContractState() when $default != null:
return $default(_that.reason,_that.detail,_that.recentCancelReason,_that.recentCancelDetail,_that.recentCancelIsMine,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CancellationReason reason,  String detail,  String? recentCancelReason,  String? recentCancelDetail,  bool recentCancelIsMine,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CancelContractState():
return $default(_that.reason,_that.detail,_that.recentCancelReason,_that.recentCancelDetail,_that.recentCancelIsMine,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CancellationReason reason,  String detail,  String? recentCancelReason,  String? recentCancelDetail,  bool recentCancelIsMine,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CancelContractState() when $default != null:
return $default(_that.reason,_that.detail,_that.recentCancelReason,_that.recentCancelDetail,_that.recentCancelIsMine,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CancelContractState implements CancelContractState {
  const _CancelContractState({this.reason = CancellationReason.reportHistory, this.detail = '', this.recentCancelReason, this.recentCancelDetail, this.recentCancelIsMine = false, this.error});
  

@override@JsonKey() final  CancellationReason reason;
// 취소 사유
@override@JsonKey() final  String detail;
// 상세 내용
@override final  String? recentCancelReason;
// 최근 취소 사유
@override final  String? recentCancelDetail;
// 최근 취소 상세 내용
@override@JsonKey() final  bool recentCancelIsMine;
// 최근 취소가 본인 요청인지 여부
@override final  String? error;

/// Create a copy of CancelContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelContractStateCopyWith<_CancelContractState> get copyWith => __$CancelContractStateCopyWithImpl<_CancelContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelContractState&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.recentCancelReason, recentCancelReason) || other.recentCancelReason == recentCancelReason)&&(identical(other.recentCancelDetail, recentCancelDetail) || other.recentCancelDetail == recentCancelDetail)&&(identical(other.recentCancelIsMine, recentCancelIsMine) || other.recentCancelIsMine == recentCancelIsMine)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,recentCancelReason,recentCancelDetail,recentCancelIsMine,error);

@override
String toString() {
  return 'CancelContractState(reason: $reason, detail: $detail, recentCancelReason: $recentCancelReason, recentCancelDetail: $recentCancelDetail, recentCancelIsMine: $recentCancelIsMine, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CancelContractStateCopyWith<$Res> implements $CancelContractStateCopyWith<$Res> {
  factory _$CancelContractStateCopyWith(_CancelContractState value, $Res Function(_CancelContractState) _then) = __$CancelContractStateCopyWithImpl;
@override @useResult
$Res call({
 CancellationReason reason, String detail, String? recentCancelReason, String? recentCancelDetail, bool recentCancelIsMine, String? error
});




}
/// @nodoc
class __$CancelContractStateCopyWithImpl<$Res>
    implements _$CancelContractStateCopyWith<$Res> {
  __$CancelContractStateCopyWithImpl(this._self, this._then);

  final _CancelContractState _self;
  final $Res Function(_CancelContractState) _then;

/// Create a copy of CancelContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? detail = null,Object? recentCancelReason = freezed,Object? recentCancelDetail = freezed,Object? recentCancelIsMine = null,Object? error = freezed,}) {
  return _then(_CancelContractState(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as CancellationReason,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,recentCancelReason: freezed == recentCancelReason ? _self.recentCancelReason : recentCancelReason // ignore: cast_nullable_to_non_nullable
as String?,recentCancelDetail: freezed == recentCancelDetail ? _self.recentCancelDetail : recentCancelDetail // ignore: cast_nullable_to_non_nullable
as String?,recentCancelIsMine: null == recentCancelIsMine ? _self.recentCancelIsMine : recentCancelIsMine // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
