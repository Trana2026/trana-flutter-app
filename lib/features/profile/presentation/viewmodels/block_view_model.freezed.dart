// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlockState {

 List<BlockedUserEntity> get blocks;// 내가 차단한 사용자 목록
 String? get error;
/// Create a copy of BlockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockStateCopyWith<BlockState> get copyWith => _$BlockStateCopyWithImpl<BlockState>(this as BlockState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockState&&const DeepCollectionEquality().equals(other.blocks, blocks)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(blocks),error);

@override
String toString() {
  return 'BlockState(blocks: $blocks, error: $error)';
}


}

/// @nodoc
abstract mixin class $BlockStateCopyWith<$Res>  {
  factory $BlockStateCopyWith(BlockState value, $Res Function(BlockState) _then) = _$BlockStateCopyWithImpl;
@useResult
$Res call({
 List<BlockedUserEntity> blocks, String? error
});




}
/// @nodoc
class _$BlockStateCopyWithImpl<$Res>
    implements $BlockStateCopyWith<$Res> {
  _$BlockStateCopyWithImpl(this._self, this._then);

  final BlockState _self;
  final $Res Function(BlockState) _then;

/// Create a copy of BlockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blocks = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
blocks: null == blocks ? _self.blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<BlockedUserEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockState].
extension BlockStatePatterns on BlockState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockState value)  $default,){
final _that = this;
switch (_that) {
case _BlockState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockState value)?  $default,){
final _that = this;
switch (_that) {
case _BlockState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BlockedUserEntity> blocks,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockState() when $default != null:
return $default(_that.blocks,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BlockedUserEntity> blocks,  String? error)  $default,) {final _that = this;
switch (_that) {
case _BlockState():
return $default(_that.blocks,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BlockedUserEntity> blocks,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _BlockState() when $default != null:
return $default(_that.blocks,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BlockState implements BlockState {
  const _BlockState({final  List<BlockedUserEntity> blocks = const [], this.error}): _blocks = blocks;
  

 final  List<BlockedUserEntity> _blocks;
@override@JsonKey() List<BlockedUserEntity> get blocks {
  if (_blocks is EqualUnmodifiableListView) return _blocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocks);
}

// 내가 차단한 사용자 목록
@override final  String? error;

/// Create a copy of BlockState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockStateCopyWith<_BlockState> get copyWith => __$BlockStateCopyWithImpl<_BlockState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockState&&const DeepCollectionEquality().equals(other._blocks, _blocks)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_blocks),error);

@override
String toString() {
  return 'BlockState(blocks: $blocks, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BlockStateCopyWith<$Res> implements $BlockStateCopyWith<$Res> {
  factory _$BlockStateCopyWith(_BlockState value, $Res Function(_BlockState) _then) = __$BlockStateCopyWithImpl;
@override @useResult
$Res call({
 List<BlockedUserEntity> blocks, String? error
});




}
/// @nodoc
class __$BlockStateCopyWithImpl<$Res>
    implements _$BlockStateCopyWith<$Res> {
  __$BlockStateCopyWithImpl(this._self, this._then);

  final _BlockState _self;
  final $Res Function(_BlockState) _then;

/// Create a copy of BlockState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blocks = null,Object? error = freezed,}) {
  return _then(_BlockState(
blocks: null == blocks ? _self._blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<BlockedUserEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
