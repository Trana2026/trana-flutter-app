// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_minor_disclosure_confirm_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractMinorDisclosureConfirmDto {

 DateTime get confirmedAt; String get templateVersion;
/// Create a copy of ContractMinorDisclosureConfirmDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractMinorDisclosureConfirmDtoCopyWith<ContractMinorDisclosureConfirmDto> get copyWith => _$ContractMinorDisclosureConfirmDtoCopyWithImpl<ContractMinorDisclosureConfirmDto>(this as ContractMinorDisclosureConfirmDto, _$identity);

  /// Serializes this ContractMinorDisclosureConfirmDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractMinorDisclosureConfirmDto&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.templateVersion, templateVersion) || other.templateVersion == templateVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,confirmedAt,templateVersion);

@override
String toString() {
  return 'ContractMinorDisclosureConfirmDto(confirmedAt: $confirmedAt, templateVersion: $templateVersion)';
}


}

/// @nodoc
abstract mixin class $ContractMinorDisclosureConfirmDtoCopyWith<$Res>  {
  factory $ContractMinorDisclosureConfirmDtoCopyWith(ContractMinorDisclosureConfirmDto value, $Res Function(ContractMinorDisclosureConfirmDto) _then) = _$ContractMinorDisclosureConfirmDtoCopyWithImpl;
@useResult
$Res call({
 DateTime confirmedAt, String templateVersion
});




}
/// @nodoc
class _$ContractMinorDisclosureConfirmDtoCopyWithImpl<$Res>
    implements $ContractMinorDisclosureConfirmDtoCopyWith<$Res> {
  _$ContractMinorDisclosureConfirmDtoCopyWithImpl(this._self, this._then);

  final ContractMinorDisclosureConfirmDto _self;
  final $Res Function(ContractMinorDisclosureConfirmDto) _then;

/// Create a copy of ContractMinorDisclosureConfirmDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? confirmedAt = null,Object? templateVersion = null,}) {
  return _then(_self.copyWith(
confirmedAt: null == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime,templateVersion: null == templateVersion ? _self.templateVersion : templateVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractMinorDisclosureConfirmDto].
extension ContractMinorDisclosureConfirmDtoPatterns on ContractMinorDisclosureConfirmDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractMinorDisclosureConfirmDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractMinorDisclosureConfirmDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractMinorDisclosureConfirmDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime confirmedAt,  String templateVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmDto() when $default != null:
return $default(_that.confirmedAt,_that.templateVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime confirmedAt,  String templateVersion)  $default,) {final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmDto():
return $default(_that.confirmedAt,_that.templateVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime confirmedAt,  String templateVersion)?  $default,) {final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmDto() when $default != null:
return $default(_that.confirmedAt,_that.templateVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractMinorDisclosureConfirmDto implements ContractMinorDisclosureConfirmDto {
  const _ContractMinorDisclosureConfirmDto({required this.confirmedAt, required this.templateVersion});
  factory _ContractMinorDisclosureConfirmDto.fromJson(Map<String, dynamic> json) => _$ContractMinorDisclosureConfirmDtoFromJson(json);

@override final  DateTime confirmedAt;
@override final  String templateVersion;

/// Create a copy of ContractMinorDisclosureConfirmDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractMinorDisclosureConfirmDtoCopyWith<_ContractMinorDisclosureConfirmDto> get copyWith => __$ContractMinorDisclosureConfirmDtoCopyWithImpl<_ContractMinorDisclosureConfirmDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractMinorDisclosureConfirmDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractMinorDisclosureConfirmDto&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.templateVersion, templateVersion) || other.templateVersion == templateVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,confirmedAt,templateVersion);

@override
String toString() {
  return 'ContractMinorDisclosureConfirmDto(confirmedAt: $confirmedAt, templateVersion: $templateVersion)';
}


}

/// @nodoc
abstract mixin class _$ContractMinorDisclosureConfirmDtoCopyWith<$Res> implements $ContractMinorDisclosureConfirmDtoCopyWith<$Res> {
  factory _$ContractMinorDisclosureConfirmDtoCopyWith(_ContractMinorDisclosureConfirmDto value, $Res Function(_ContractMinorDisclosureConfirmDto) _then) = __$ContractMinorDisclosureConfirmDtoCopyWithImpl;
@override @useResult
$Res call({
 DateTime confirmedAt, String templateVersion
});




}
/// @nodoc
class __$ContractMinorDisclosureConfirmDtoCopyWithImpl<$Res>
    implements _$ContractMinorDisclosureConfirmDtoCopyWith<$Res> {
  __$ContractMinorDisclosureConfirmDtoCopyWithImpl(this._self, this._then);

  final _ContractMinorDisclosureConfirmDto _self;
  final $Res Function(_ContractMinorDisclosureConfirmDto) _then;

/// Create a copy of ContractMinorDisclosureConfirmDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? confirmedAt = null,Object? templateVersion = null,}) {
  return _then(_ContractMinorDisclosureConfirmDto(
confirmedAt: null == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime,templateVersion: null == templateVersion ? _self.templateVersion : templateVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
