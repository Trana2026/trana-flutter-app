// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockDto {

 String get blockedShareCode; DateTime get blockedAt;
/// Create a copy of BlockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockDtoCopyWith<BlockDto> get copyWith => _$BlockDtoCopyWithImpl<BlockDto>(this as BlockDto, _$identity);

  /// Serializes this BlockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockDto&&(identical(other.blockedShareCode, blockedShareCode) || other.blockedShareCode == blockedShareCode)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blockedShareCode,blockedAt);

@override
String toString() {
  return 'BlockDto(blockedShareCode: $blockedShareCode, blockedAt: $blockedAt)';
}


}

/// @nodoc
abstract mixin class $BlockDtoCopyWith<$Res>  {
  factory $BlockDtoCopyWith(BlockDto value, $Res Function(BlockDto) _then) = _$BlockDtoCopyWithImpl;
@useResult
$Res call({
 String blockedShareCode, DateTime blockedAt
});




}
/// @nodoc
class _$BlockDtoCopyWithImpl<$Res>
    implements $BlockDtoCopyWith<$Res> {
  _$BlockDtoCopyWithImpl(this._self, this._then);

  final BlockDto _self;
  final $Res Function(BlockDto) _then;

/// Create a copy of BlockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blockedShareCode = null,Object? blockedAt = null,}) {
  return _then(_self.copyWith(
blockedShareCode: null == blockedShareCode ? _self.blockedShareCode : blockedShareCode // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockDto].
extension BlockDtoPatterns on BlockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockDto value)  $default,){
final _that = this;
switch (_that) {
case _BlockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockDto value)?  $default,){
final _that = this;
switch (_that) {
case _BlockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String blockedShareCode,  DateTime blockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockDto() when $default != null:
return $default(_that.blockedShareCode,_that.blockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String blockedShareCode,  DateTime blockedAt)  $default,) {final _that = this;
switch (_that) {
case _BlockDto():
return $default(_that.blockedShareCode,_that.blockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String blockedShareCode,  DateTime blockedAt)?  $default,) {final _that = this;
switch (_that) {
case _BlockDto() when $default != null:
return $default(_that.blockedShareCode,_that.blockedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlockDto implements BlockDto {
  const _BlockDto({required this.blockedShareCode, required this.blockedAt});
  factory _BlockDto.fromJson(Map<String, dynamic> json) => _$BlockDtoFromJson(json);

@override final  String blockedShareCode;
@override final  DateTime blockedAt;

/// Create a copy of BlockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockDtoCopyWith<_BlockDto> get copyWith => __$BlockDtoCopyWithImpl<_BlockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockDto&&(identical(other.blockedShareCode, blockedShareCode) || other.blockedShareCode == blockedShareCode)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blockedShareCode,blockedAt);

@override
String toString() {
  return 'BlockDto(blockedShareCode: $blockedShareCode, blockedAt: $blockedAt)';
}


}

/// @nodoc
abstract mixin class _$BlockDtoCopyWith<$Res> implements $BlockDtoCopyWith<$Res> {
  factory _$BlockDtoCopyWith(_BlockDto value, $Res Function(_BlockDto) _then) = __$BlockDtoCopyWithImpl;
@override @useResult
$Res call({
 String blockedShareCode, DateTime blockedAt
});




}
/// @nodoc
class __$BlockDtoCopyWithImpl<$Res>
    implements _$BlockDtoCopyWith<$Res> {
  __$BlockDtoCopyWithImpl(this._self, this._then);

  final _BlockDto _self;
  final $Res Function(_BlockDto) _then;

/// Create a copy of BlockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blockedShareCode = null,Object? blockedAt = null,}) {
  return _then(_BlockDto(
blockedShareCode: null == blockedShareCode ? _self.blockedShareCode : blockedShareCode // ignore: cast_nullable_to_non_nullable
as String,blockedAt: null == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
