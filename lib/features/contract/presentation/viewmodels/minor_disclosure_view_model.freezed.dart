// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'minor_disclosure_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MinorDisclosureState {

 ContractMinorDisclosureEntity? get disclosureText;// 위험 고지 문구
 DateTime? get confirmedAt;// 확인 완료 시각
 bool get isLoadingDisclosureText;// 위험 고지 문구 조회 로딩중 여부
 String? get error;
/// Create a copy of MinorDisclosureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinorDisclosureStateCopyWith<MinorDisclosureState> get copyWith => _$MinorDisclosureStateCopyWithImpl<MinorDisclosureState>(this as MinorDisclosureState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinorDisclosureState&&(identical(other.disclosureText, disclosureText) || other.disclosureText == disclosureText)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.isLoadingDisclosureText, isLoadingDisclosureText) || other.isLoadingDisclosureText == isLoadingDisclosureText)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,disclosureText,confirmedAt,isLoadingDisclosureText,error);

@override
String toString() {
  return 'MinorDisclosureState(disclosureText: $disclosureText, confirmedAt: $confirmedAt, isLoadingDisclosureText: $isLoadingDisclosureText, error: $error)';
}


}

/// @nodoc
abstract mixin class $MinorDisclosureStateCopyWith<$Res>  {
  factory $MinorDisclosureStateCopyWith(MinorDisclosureState value, $Res Function(MinorDisclosureState) _then) = _$MinorDisclosureStateCopyWithImpl;
@useResult
$Res call({
 ContractMinorDisclosureEntity? disclosureText, DateTime? confirmedAt, bool isLoadingDisclosureText, String? error
});


$ContractMinorDisclosureEntityCopyWith<$Res>? get disclosureText;

}
/// @nodoc
class _$MinorDisclosureStateCopyWithImpl<$Res>
    implements $MinorDisclosureStateCopyWith<$Res> {
  _$MinorDisclosureStateCopyWithImpl(this._self, this._then);

  final MinorDisclosureState _self;
  final $Res Function(MinorDisclosureState) _then;

/// Create a copy of MinorDisclosureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? disclosureText = freezed,Object? confirmedAt = freezed,Object? isLoadingDisclosureText = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
disclosureText: freezed == disclosureText ? _self.disclosureText : disclosureText // ignore: cast_nullable_to_non_nullable
as ContractMinorDisclosureEntity?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoadingDisclosureText: null == isLoadingDisclosureText ? _self.isLoadingDisclosureText : isLoadingDisclosureText // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MinorDisclosureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractMinorDisclosureEntityCopyWith<$Res>? get disclosureText {
    if (_self.disclosureText == null) {
    return null;
  }

  return $ContractMinorDisclosureEntityCopyWith<$Res>(_self.disclosureText!, (value) {
    return _then(_self.copyWith(disclosureText: value));
  });
}
}


/// Adds pattern-matching-related methods to [MinorDisclosureState].
extension MinorDisclosureStatePatterns on MinorDisclosureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinorDisclosureState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinorDisclosureState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinorDisclosureState value)  $default,){
final _that = this;
switch (_that) {
case _MinorDisclosureState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinorDisclosureState value)?  $default,){
final _that = this;
switch (_that) {
case _MinorDisclosureState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContractMinorDisclosureEntity? disclosureText,  DateTime? confirmedAt,  bool isLoadingDisclosureText,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinorDisclosureState() when $default != null:
return $default(_that.disclosureText,_that.confirmedAt,_that.isLoadingDisclosureText,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContractMinorDisclosureEntity? disclosureText,  DateTime? confirmedAt,  bool isLoadingDisclosureText,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MinorDisclosureState():
return $default(_that.disclosureText,_that.confirmedAt,_that.isLoadingDisclosureText,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContractMinorDisclosureEntity? disclosureText,  DateTime? confirmedAt,  bool isLoadingDisclosureText,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MinorDisclosureState() when $default != null:
return $default(_that.disclosureText,_that.confirmedAt,_that.isLoadingDisclosureText,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MinorDisclosureState implements MinorDisclosureState {
  const _MinorDisclosureState({this.disclosureText, this.confirmedAt, this.isLoadingDisclosureText = false, this.error});
  

@override final  ContractMinorDisclosureEntity? disclosureText;
// 위험 고지 문구
@override final  DateTime? confirmedAt;
// 확인 완료 시각
@override@JsonKey() final  bool isLoadingDisclosureText;
// 위험 고지 문구 조회 로딩중 여부
@override final  String? error;

/// Create a copy of MinorDisclosureState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinorDisclosureStateCopyWith<_MinorDisclosureState> get copyWith => __$MinorDisclosureStateCopyWithImpl<_MinorDisclosureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinorDisclosureState&&(identical(other.disclosureText, disclosureText) || other.disclosureText == disclosureText)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.isLoadingDisclosureText, isLoadingDisclosureText) || other.isLoadingDisclosureText == isLoadingDisclosureText)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,disclosureText,confirmedAt,isLoadingDisclosureText,error);

@override
String toString() {
  return 'MinorDisclosureState(disclosureText: $disclosureText, confirmedAt: $confirmedAt, isLoadingDisclosureText: $isLoadingDisclosureText, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MinorDisclosureStateCopyWith<$Res> implements $MinorDisclosureStateCopyWith<$Res> {
  factory _$MinorDisclosureStateCopyWith(_MinorDisclosureState value, $Res Function(_MinorDisclosureState) _then) = __$MinorDisclosureStateCopyWithImpl;
@override @useResult
$Res call({
 ContractMinorDisclosureEntity? disclosureText, DateTime? confirmedAt, bool isLoadingDisclosureText, String? error
});


@override $ContractMinorDisclosureEntityCopyWith<$Res>? get disclosureText;

}
/// @nodoc
class __$MinorDisclosureStateCopyWithImpl<$Res>
    implements _$MinorDisclosureStateCopyWith<$Res> {
  __$MinorDisclosureStateCopyWithImpl(this._self, this._then);

  final _MinorDisclosureState _self;
  final $Res Function(_MinorDisclosureState) _then;

/// Create a copy of MinorDisclosureState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? disclosureText = freezed,Object? confirmedAt = freezed,Object? isLoadingDisclosureText = null,Object? error = freezed,}) {
  return _then(_MinorDisclosureState(
disclosureText: freezed == disclosureText ? _self.disclosureText : disclosureText // ignore: cast_nullable_to_non_nullable
as ContractMinorDisclosureEntity?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoadingDisclosureText: null == isLoadingDisclosureText ? _self.isLoadingDisclosureText : isLoadingDisclosureText // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MinorDisclosureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractMinorDisclosureEntityCopyWith<$Res>? get disclosureText {
    if (_self.disclosureText == null) {
    return null;
  }

  return $ContractMinorDisclosureEntityCopyWith<$Res>(_self.disclosureText!, (value) {
    return _then(_self.copyWith(disclosureText: value));
  });
}
}

// dart format on
