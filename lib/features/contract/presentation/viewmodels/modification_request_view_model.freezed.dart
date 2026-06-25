// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modification_request_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModificationRequestState {

 Set<String> get selectedFields;// 선택한 영역 이름 목록
 String get deliveryTypeReason; String get platformReason; String get titleReason; String get priceReason; String get conditionSummaryReason; String get conditionDetailsReason; bool get isLoading; String? get error;
/// Create a copy of ModificationRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModificationRequestStateCopyWith<ModificationRequestState> get copyWith => _$ModificationRequestStateCopyWithImpl<ModificationRequestState>(this as ModificationRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModificationRequestState&&const DeepCollectionEquality().equals(other.selectedFields, selectedFields)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.platformReason, platformReason) || other.platformReason == platformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedFields),deliveryTypeReason,platformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,isLoading,error);

@override
String toString() {
  return 'ModificationRequestState(selectedFields: $selectedFields, deliveryTypeReason: $deliveryTypeReason, platformReason: $platformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ModificationRequestStateCopyWith<$Res>  {
  factory $ModificationRequestStateCopyWith(ModificationRequestState value, $Res Function(ModificationRequestState) _then) = _$ModificationRequestStateCopyWithImpl;
@useResult
$Res call({
 Set<String> selectedFields, String deliveryTypeReason, String platformReason, String titleReason, String priceReason, String conditionSummaryReason, String conditionDetailsReason, bool isLoading, String? error
});




}
/// @nodoc
class _$ModificationRequestStateCopyWithImpl<$Res>
    implements $ModificationRequestStateCopyWith<$Res> {
  _$ModificationRequestStateCopyWithImpl(this._self, this._then);

  final ModificationRequestState _self;
  final $Res Function(ModificationRequestState) _then;

/// Create a copy of ModificationRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFields = null,Object? deliveryTypeReason = null,Object? platformReason = null,Object? titleReason = null,Object? priceReason = null,Object? conditionSummaryReason = null,Object? conditionDetailsReason = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
selectedFields: null == selectedFields ? _self.selectedFields : selectedFields // ignore: cast_nullable_to_non_nullable
as Set<String>,deliveryTypeReason: null == deliveryTypeReason ? _self.deliveryTypeReason : deliveryTypeReason // ignore: cast_nullable_to_non_nullable
as String,platformReason: null == platformReason ? _self.platformReason : platformReason // ignore: cast_nullable_to_non_nullable
as String,titleReason: null == titleReason ? _self.titleReason : titleReason // ignore: cast_nullable_to_non_nullable
as String,priceReason: null == priceReason ? _self.priceReason : priceReason // ignore: cast_nullable_to_non_nullable
as String,conditionSummaryReason: null == conditionSummaryReason ? _self.conditionSummaryReason : conditionSummaryReason // ignore: cast_nullable_to_non_nullable
as String,conditionDetailsReason: null == conditionDetailsReason ? _self.conditionDetailsReason : conditionDetailsReason // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModificationRequestState].
extension ModificationRequestStatePatterns on ModificationRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModificationRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModificationRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModificationRequestState value)  $default,){
final _that = this;
switch (_that) {
case _ModificationRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModificationRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _ModificationRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> selectedFields,  String deliveryTypeReason,  String platformReason,  String titleReason,  String priceReason,  String conditionSummaryReason,  String conditionDetailsReason,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModificationRequestState() when $default != null:
return $default(_that.selectedFields,_that.deliveryTypeReason,_that.platformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> selectedFields,  String deliveryTypeReason,  String platformReason,  String titleReason,  String priceReason,  String conditionSummaryReason,  String conditionDetailsReason,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ModificationRequestState():
return $default(_that.selectedFields,_that.deliveryTypeReason,_that.platformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> selectedFields,  String deliveryTypeReason,  String platformReason,  String titleReason,  String priceReason,  String conditionSummaryReason,  String conditionDetailsReason,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ModificationRequestState() when $default != null:
return $default(_that.selectedFields,_that.deliveryTypeReason,_that.platformReason,_that.titleReason,_that.priceReason,_that.conditionSummaryReason,_that.conditionDetailsReason,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ModificationRequestState implements ModificationRequestState {
  const _ModificationRequestState({final  Set<String> selectedFields = const <String>{}, this.deliveryTypeReason = '', this.platformReason = '', this.titleReason = '', this.priceReason = '', this.conditionSummaryReason = '', this.conditionDetailsReason = '', this.isLoading = false, this.error}): _selectedFields = selectedFields;
  

 final  Set<String> _selectedFields;
@override@JsonKey() Set<String> get selectedFields {
  if (_selectedFields is EqualUnmodifiableSetView) return _selectedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedFields);
}

// 선택한 영역 이름 목록
@override@JsonKey() final  String deliveryTypeReason;
@override@JsonKey() final  String platformReason;
@override@JsonKey() final  String titleReason;
@override@JsonKey() final  String priceReason;
@override@JsonKey() final  String conditionSummaryReason;
@override@JsonKey() final  String conditionDetailsReason;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ModificationRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModificationRequestStateCopyWith<_ModificationRequestState> get copyWith => __$ModificationRequestStateCopyWithImpl<_ModificationRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModificationRequestState&&const DeepCollectionEquality().equals(other._selectedFields, _selectedFields)&&(identical(other.deliveryTypeReason, deliveryTypeReason) || other.deliveryTypeReason == deliveryTypeReason)&&(identical(other.platformReason, platformReason) || other.platformReason == platformReason)&&(identical(other.titleReason, titleReason) || other.titleReason == titleReason)&&(identical(other.priceReason, priceReason) || other.priceReason == priceReason)&&(identical(other.conditionSummaryReason, conditionSummaryReason) || other.conditionSummaryReason == conditionSummaryReason)&&(identical(other.conditionDetailsReason, conditionDetailsReason) || other.conditionDetailsReason == conditionDetailsReason)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedFields),deliveryTypeReason,platformReason,titleReason,priceReason,conditionSummaryReason,conditionDetailsReason,isLoading,error);

@override
String toString() {
  return 'ModificationRequestState(selectedFields: $selectedFields, deliveryTypeReason: $deliveryTypeReason, platformReason: $platformReason, titleReason: $titleReason, priceReason: $priceReason, conditionSummaryReason: $conditionSummaryReason, conditionDetailsReason: $conditionDetailsReason, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ModificationRequestStateCopyWith<$Res> implements $ModificationRequestStateCopyWith<$Res> {
  factory _$ModificationRequestStateCopyWith(_ModificationRequestState value, $Res Function(_ModificationRequestState) _then) = __$ModificationRequestStateCopyWithImpl;
@override @useResult
$Res call({
 Set<String> selectedFields, String deliveryTypeReason, String platformReason, String titleReason, String priceReason, String conditionSummaryReason, String conditionDetailsReason, bool isLoading, String? error
});




}
/// @nodoc
class __$ModificationRequestStateCopyWithImpl<$Res>
    implements _$ModificationRequestStateCopyWith<$Res> {
  __$ModificationRequestStateCopyWithImpl(this._self, this._then);

  final _ModificationRequestState _self;
  final $Res Function(_ModificationRequestState) _then;

/// Create a copy of ModificationRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFields = null,Object? deliveryTypeReason = null,Object? platformReason = null,Object? titleReason = null,Object? priceReason = null,Object? conditionSummaryReason = null,Object? conditionDetailsReason = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ModificationRequestState(
selectedFields: null == selectedFields ? _self._selectedFields : selectedFields // ignore: cast_nullable_to_non_nullable
as Set<String>,deliveryTypeReason: null == deliveryTypeReason ? _self.deliveryTypeReason : deliveryTypeReason // ignore: cast_nullable_to_non_nullable
as String,platformReason: null == platformReason ? _self.platformReason : platformReason // ignore: cast_nullable_to_non_nullable
as String,titleReason: null == titleReason ? _self.titleReason : titleReason // ignore: cast_nullable_to_non_nullable
as String,priceReason: null == priceReason ? _self.priceReason : priceReason // ignore: cast_nullable_to_non_nullable
as String,conditionSummaryReason: null == conditionSummaryReason ? _self.conditionSummaryReason : conditionSummaryReason // ignore: cast_nullable_to_non_nullable
as String,conditionDetailsReason: null == conditionDetailsReason ? _self.conditionDetailsReason : conditionDetailsReason // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
