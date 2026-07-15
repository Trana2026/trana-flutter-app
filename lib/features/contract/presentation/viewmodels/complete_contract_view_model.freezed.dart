// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompleteContractState {

 String? get error;
/// Create a copy of CompleteContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteContractStateCopyWith<CompleteContractState> get copyWith => _$CompleteContractStateCopyWithImpl<CompleteContractState>(this as CompleteContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteContractState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CompleteContractState(error: $error)';
}


}

/// @nodoc
abstract mixin class $CompleteContractStateCopyWith<$Res>  {
  factory $CompleteContractStateCopyWith(CompleteContractState value, $Res Function(CompleteContractState) _then) = _$CompleteContractStateCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class _$CompleteContractStateCopyWithImpl<$Res>
    implements $CompleteContractStateCopyWith<$Res> {
  _$CompleteContractStateCopyWithImpl(this._self, this._then);

  final CompleteContractState _self;
  final $Res Function(CompleteContractState) _then;

/// Create a copy of CompleteContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompleteContractState].
extension CompleteContractStatePatterns on CompleteContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompleteContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompleteContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompleteContractState value)  $default,){
final _that = this;
switch (_that) {
case _CompleteContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompleteContractState value)?  $default,){
final _that = this;
switch (_that) {
case _CompleteContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompleteContractState() when $default != null:
return $default(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? error)  $default,) {final _that = this;
switch (_that) {
case _CompleteContractState():
return $default(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? error)?  $default,) {final _that = this;
switch (_that) {
case _CompleteContractState() when $default != null:
return $default(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CompleteContractState implements CompleteContractState {
  const _CompleteContractState({this.error});
  

@override final  String? error;

/// Create a copy of CompleteContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteContractStateCopyWith<_CompleteContractState> get copyWith => __$CompleteContractStateCopyWithImpl<_CompleteContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteContractState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CompleteContractState(error: $error)';
}


}

/// @nodoc
abstract mixin class _$CompleteContractStateCopyWith<$Res> implements $CompleteContractStateCopyWith<$Res> {
  factory _$CompleteContractStateCopyWith(_CompleteContractState value, $Res Function(_CompleteContractState) _then) = __$CompleteContractStateCopyWithImpl;
@override @useResult
$Res call({
 String? error
});




}
/// @nodoc
class __$CompleteContractStateCopyWithImpl<$Res>
    implements _$CompleteContractStateCopyWith<$Res> {
  __$CompleteContractStateCopyWithImpl(this._self, this._then);

  final _CompleteContractState _self;
  final $Res Function(_CompleteContractState) _then;

/// Create a copy of CompleteContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_CompleteContractState(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
