// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revision_request_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RevisionRequestState {

 Set<String> get selectedFields;// 선택한 영역 이름 목록
// 각 영역 수정 요청 내용
 String get deliveryTypeReason; String get tradingPlatformReason; String get titleReason; String get priceReason; String get conditionSummaryReason; String get conditionDetailsReason; bool get revisionDone;// 수정 완료 여부
 String? get error;
/// Create a copy of RevisionRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevisionRequestStateCopyWith<RevisionRequestState> get copyWith => _$RevisionRequestStateCopyWithImpl<RevisionRequestState>(this as RevisionRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevisionRequestState&&const DeepCollectionEquality().equals(other.selectedFields, selectedFields)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.tradingPlatformReason, tradingPlatformReason) || other.tradingPlatformReason == tradingPlatformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.revisionDone, revisionDone) || other.revisionDone == revisionDone)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedFields),deliveryTypeReason,tradingPlatformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,revisionDone,error);

@override
String toString() {
  return 'RevisionRequestState(selectedFields: $selectedFields, deliveryTypeReason: $deliveryTypeReason, tradingPlatformReason: $tradingPlatformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, revisionDone: $revisionDone, error: $error)';
}


}

/// @nodoc
abstract mixin class $RevisionRequestStateCopyWith<$Res>  {
  factory $RevisionRequestStateCopyWith(RevisionRequestState value, $Res Function(RevisionRequestState) _then) = _$RevisionRequestStateCopyWithImpl;
@useResult
$Res call({
 Set<String> selectedFields, String deliveryTypeReason, String tradingPlatformReason, String titleReason, String priceReason, String conditionSummaryReason, String conditionDetailsReason, bool revisionDone, String? error
});




}
/// @nodoc
class _$RevisionRequestStateCopyWithImpl<$Res>
    implements $RevisionRequestStateCopyWith<$Res> {
  _$RevisionRequestStateCopyWithImpl(this._self, this._then);

  final RevisionRequestState _self;
  final $Res Function(RevisionRequestState) _then;

/// Create a copy of RevisionRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFields = null,Object? deliveryTypeReason = null,Object? tradingPlatformReason = null,Object? titleReason = null,Object? priceReason = null,Object? conditionSummaryReason = null,Object? conditionDetailsReason = null,Object? revisionDone = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
selectedFields: null == selectedFields ? _self.selectedFields : selectedFields // ignore: cast_nullable_to_non_nullable
as Set<String>,deliveryTypeReason: null == deliveryTypeReason ? _self.deliveryTypeReason : deliveryTypeReason // ignore: cast_nullable_to_non_nullable
as String,tradingPlatformReason: null == tradingPlatformReason ? _self.tradingPlatformReason : tradingPlatformReason // ignore: cast_nullable_to_non_nullable
as String,titleReason: null == titleReason ? _self.titleReason : titleReason // ignore: cast_nullable_to_non_nullable
as String,priceReason: null == priceReason ? _self.priceReason : priceReason // ignore: cast_nullable_to_non_nullable
as String,conditionSummaryReason: null == conditionSummaryReason ? _self.conditionSummaryReason : conditionSummaryReason // ignore: cast_nullable_to_non_nullable
as String,conditionDetailsReason: null == conditionDetailsReason ? _self.conditionDetailsReason : conditionDetailsReason // ignore: cast_nullable_to_non_nullable
as String,revisionDone: null == revisionDone ? _self.revisionDone : revisionDone // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RevisionRequestState].
extension RevisionRequestStatePatterns on RevisionRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevisionRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevisionRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevisionRequestState value)  $default,){
final _that = this;
switch (_that) {
case _RevisionRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevisionRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _RevisionRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> selectedFields,  String deliveryTypeReason,  String tradingPlatformReason,  String titleReason,  String priceReason,  String conditionSummaryReason,  String conditionDetailsReason,  bool revisionDone,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevisionRequestState() when $default != null:
return $default(_that.selectedFields,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.revisionDone,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> selectedFields,  String deliveryTypeReason,  String tradingPlatformReason,  String titleReason,  String priceReason,  String conditionSummaryReason,  String conditionDetailsReason,  bool revisionDone,  String? error)  $default,) {final _that = this;
switch (_that) {
case _RevisionRequestState():
return $default(_that.selectedFields,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.revisionDone,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> selectedFields,  String deliveryTypeReason,  String tradingPlatformReason,  String titleReason,  String priceReason,  String conditionSummaryReason,  String conditionDetailsReason,  bool revisionDone,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _RevisionRequestState() when $default != null:
return $default(_that.selectedFields,_that.deliveryTypeReason,_that.tradingPlatformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.revisionDone,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RevisionRequestState implements RevisionRequestState {
  const _RevisionRequestState({final  Set<String> selectedFields = const <String>{}, this.deliveryTypeReason = '', this.tradingPlatformReason = '', this.titleReason = '', this.priceReason = '', this.conditionSummaryReason = '', this.conditionDetailsReason = '', this.revisionDone = false, this.error}): _selectedFields = selectedFields;
  

 final  Set<String> _selectedFields;
@override@JsonKey() Set<String> get selectedFields {
  if (_selectedFields is EqualUnmodifiableSetView) return _selectedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedFields);
}

// 선택한 영역 이름 목록
// 각 영역 수정 요청 내용
@override@JsonKey() final  String deliveryTypeReason;
@override@JsonKey() final  String tradingPlatformReason;
@override@JsonKey() final  String titleReason;
@override@JsonKey() final  String priceReason;
@override@JsonKey() final  String conditionSummaryReason;
@override@JsonKey() final  String conditionDetailsReason;
@override@JsonKey() final  bool revisionDone;
// 수정 완료 여부
@override final  String? error;

/// Create a copy of RevisionRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevisionRequestStateCopyWith<_RevisionRequestState> get copyWith => __$RevisionRequestStateCopyWithImpl<_RevisionRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevisionRequestState&&const DeepCollectionEquality().equals(other._selectedFields, _selectedFields)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.tradingPlatformReason, tradingPlatformReason) || other.tradingPlatformReason == tradingPlatformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.revisionDone, revisionDone) || other.revisionDone == revisionDone)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedFields),deliveryTypeReason,tradingPlatformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,revisionDone,error);

@override
String toString() {
  return 'RevisionRequestState(selectedFields: $selectedFields, deliveryTypeReason: $deliveryTypeReason, tradingPlatformReason: $tradingPlatformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, revisionDone: $revisionDone, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RevisionRequestStateCopyWith<$Res> implements $RevisionRequestStateCopyWith<$Res> {
  factory _$RevisionRequestStateCopyWith(_RevisionRequestState value, $Res Function(_RevisionRequestState) _then) = __$RevisionRequestStateCopyWithImpl;
@override @useResult
$Res call({
 Set<String> selectedFields, String deliveryTypeReason, String tradingPlatformReason, String titleReason, String priceReason, String conditionSummaryReason, String conditionDetailsReason, bool revisionDone, String? error
});




}
/// @nodoc
class __$RevisionRequestStateCopyWithImpl<$Res>
    implements _$RevisionRequestStateCopyWith<$Res> {
  __$RevisionRequestStateCopyWithImpl(this._self, this._then);

  final _RevisionRequestState _self;
  final $Res Function(_RevisionRequestState) _then;

/// Create a copy of RevisionRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFields = null,Object? deliveryTypeReason = null,Object? tradingPlatformReason = null,Object? titleReason = null,Object? priceReason = null,Object? conditionSummaryReason = null,Object? conditionDetailsReason = null,Object? revisionDone = null,Object? error = freezed,}) {
  return _then(_RevisionRequestState(
selectedFields: null == selectedFields ? _self._selectedFields : selectedFields // ignore: cast_nullable_to_non_nullable
as Set<String>,deliveryTypeReason: null == deliveryTypeReason ? _self.deliveryTypeReason : deliveryTypeReason // ignore: cast_nullable_to_non_nullable
as String,tradingPlatformReason: null == tradingPlatformReason ? _self.tradingPlatformReason : tradingPlatformReason // ignore: cast_nullable_to_non_nullable
as String,titleReason: null == titleReason ? _self.titleReason : titleReason // ignore: cast_nullable_to_non_nullable
as String,priceReason: null == priceReason ? _self.priceReason : priceReason // ignore: cast_nullable_to_non_nullable
as String,conditionSummaryReason: null == conditionSummaryReason ? _self.conditionSummaryReason : conditionSummaryReason // ignore: cast_nullable_to_non_nullable
as String,conditionDetailsReason: null == conditionDetailsReason ? _self.conditionDetailsReason : conditionDetailsReason // ignore: cast_nullable_to_non_nullable
as String,revisionDone: null == revisionDone ? _self.revisionDone : revisionDone // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
