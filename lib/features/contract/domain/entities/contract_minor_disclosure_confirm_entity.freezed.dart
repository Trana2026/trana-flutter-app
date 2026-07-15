// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_minor_disclosure_confirm_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractMinorDisclosureConfirmEntity {

 DateTime get confirmedAt; String get templateVersion;
/// Create a copy of ContractMinorDisclosureConfirmEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractMinorDisclosureConfirmEntityCopyWith<ContractMinorDisclosureConfirmEntity> get copyWith => _$ContractMinorDisclosureConfirmEntityCopyWithImpl<ContractMinorDisclosureConfirmEntity>(this as ContractMinorDisclosureConfirmEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractMinorDisclosureConfirmEntity&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.templateVersion, templateVersion) || other.templateVersion == templateVersion));
}


@override
int get hashCode => Object.hash(runtimeType,confirmedAt,templateVersion);

@override
String toString() {
  return 'ContractMinorDisclosureConfirmEntity(confirmedAt: $confirmedAt, templateVersion: $templateVersion)';
}


}

/// @nodoc
abstract mixin class $ContractMinorDisclosureConfirmEntityCopyWith<$Res>  {
  factory $ContractMinorDisclosureConfirmEntityCopyWith(ContractMinorDisclosureConfirmEntity value, $Res Function(ContractMinorDisclosureConfirmEntity) _then) = _$ContractMinorDisclosureConfirmEntityCopyWithImpl;
@useResult
$Res call({
 DateTime confirmedAt, String templateVersion
});




}
/// @nodoc
class _$ContractMinorDisclosureConfirmEntityCopyWithImpl<$Res>
    implements $ContractMinorDisclosureConfirmEntityCopyWith<$Res> {
  _$ContractMinorDisclosureConfirmEntityCopyWithImpl(this._self, this._then);

  final ContractMinorDisclosureConfirmEntity _self;
  final $Res Function(ContractMinorDisclosureConfirmEntity) _then;

/// Create a copy of ContractMinorDisclosureConfirmEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? confirmedAt = null,Object? templateVersion = null,}) {
  return _then(_self.copyWith(
confirmedAt: null == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime,templateVersion: null == templateVersion ? _self.templateVersion : templateVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractMinorDisclosureConfirmEntity].
extension ContractMinorDisclosureConfirmEntityPatterns on ContractMinorDisclosureConfirmEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractMinorDisclosureConfirmEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractMinorDisclosureConfirmEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractMinorDisclosureConfirmEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureConfirmEntity() when $default != null:
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
case _ContractMinorDisclosureConfirmEntity() when $default != null:
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
case _ContractMinorDisclosureConfirmEntity():
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
case _ContractMinorDisclosureConfirmEntity() when $default != null:
return $default(_that.confirmedAt,_that.templateVersion);case _:
  return null;

}
}

}

/// @nodoc


class _ContractMinorDisclosureConfirmEntity implements ContractMinorDisclosureConfirmEntity {
  const _ContractMinorDisclosureConfirmEntity({required this.confirmedAt, required this.templateVersion});
  

@override final  DateTime confirmedAt;
@override final  String templateVersion;

/// Create a copy of ContractMinorDisclosureConfirmEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractMinorDisclosureConfirmEntityCopyWith<_ContractMinorDisclosureConfirmEntity> get copyWith => __$ContractMinorDisclosureConfirmEntityCopyWithImpl<_ContractMinorDisclosureConfirmEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractMinorDisclosureConfirmEntity&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.templateVersion, templateVersion) || other.templateVersion == templateVersion));
}


@override
int get hashCode => Object.hash(runtimeType,confirmedAt,templateVersion);

@override
String toString() {
  return 'ContractMinorDisclosureConfirmEntity(confirmedAt: $confirmedAt, templateVersion: $templateVersion)';
}


}

/// @nodoc
abstract mixin class _$ContractMinorDisclosureConfirmEntityCopyWith<$Res> implements $ContractMinorDisclosureConfirmEntityCopyWith<$Res> {
  factory _$ContractMinorDisclosureConfirmEntityCopyWith(_ContractMinorDisclosureConfirmEntity value, $Res Function(_ContractMinorDisclosureConfirmEntity) _then) = __$ContractMinorDisclosureConfirmEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime confirmedAt, String templateVersion
});




}
/// @nodoc
class __$ContractMinorDisclosureConfirmEntityCopyWithImpl<$Res>
    implements _$ContractMinorDisclosureConfirmEntityCopyWith<$Res> {
  __$ContractMinorDisclosureConfirmEntityCopyWithImpl(this._self, this._then);

  final _ContractMinorDisclosureConfirmEntity _self;
  final $Res Function(_ContractMinorDisclosureConfirmEntity) _then;

/// Create a copy of ContractMinorDisclosureConfirmEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? confirmedAt = null,Object? templateVersion = null,}) {
  return _then(_ContractMinorDisclosureConfirmEntity(
confirmedAt: null == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime,templateVersion: null == templateVersion ? _self.templateVersion : templateVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
