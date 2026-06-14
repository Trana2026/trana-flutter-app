// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_receiver_signed_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractReceiverSignedDto {

 String get publicCode; String get status; int get pdfVersion; DateTime get receiverSignedAt;
/// Create a copy of ContractReceiverSignedDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractReceiverSignedDtoCopyWith<ContractReceiverSignedDto> get copyWith => _$ContractReceiverSignedDtoCopyWithImpl<ContractReceiverSignedDto>(this as ContractReceiverSignedDto, _$identity);

  /// Serializes this ContractReceiverSignedDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractReceiverSignedDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfVersion, pdfVersion) || other.pdfVersion == pdfVersion)&&(identical(other.receiverSignedAt, receiverSignedAt) || other.receiverSignedAt == receiverSignedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,status,pdfVersion,receiverSignedAt);

@override
String toString() {
  return 'ContractReceiverSignedDto(publicCode: $publicCode, status: $status, pdfVersion: $pdfVersion, receiverSignedAt: $receiverSignedAt)';
}


}

/// @nodoc
abstract mixin class $ContractReceiverSignedDtoCopyWith<$Res>  {
  factory $ContractReceiverSignedDtoCopyWith(ContractReceiverSignedDto value, $Res Function(ContractReceiverSignedDto) _then) = _$ContractReceiverSignedDtoCopyWithImpl;
@useResult
$Res call({
 String publicCode, String status, int pdfVersion, DateTime receiverSignedAt
});




}
/// @nodoc
class _$ContractReceiverSignedDtoCopyWithImpl<$Res>
    implements $ContractReceiverSignedDtoCopyWith<$Res> {
  _$ContractReceiverSignedDtoCopyWithImpl(this._self, this._then);

  final ContractReceiverSignedDto _self;
  final $Res Function(ContractReceiverSignedDto) _then;

/// Create a copy of ContractReceiverSignedDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? pdfVersion = null,Object? receiverSignedAt = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pdfVersion: null == pdfVersion ? _self.pdfVersion : pdfVersion // ignore: cast_nullable_to_non_nullable
as int,receiverSignedAt: null == receiverSignedAt ? _self.receiverSignedAt : receiverSignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractReceiverSignedDto].
extension ContractReceiverSignedDtoPatterns on ContractReceiverSignedDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractReceiverSignedDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractReceiverSignedDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractReceiverSignedDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractReceiverSignedDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractReceiverSignedDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractReceiverSignedDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String status,  int pdfVersion,  DateTime receiverSignedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractReceiverSignedDto() when $default != null:
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.receiverSignedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String status,  int pdfVersion,  DateTime receiverSignedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractReceiverSignedDto():
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.receiverSignedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String status,  int pdfVersion,  DateTime receiverSignedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractReceiverSignedDto() when $default != null:
return $default(_that.publicCode,_that.status,_that.pdfVersion,_that.receiverSignedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractReceiverSignedDto implements ContractReceiverSignedDto {
  const _ContractReceiverSignedDto({required this.publicCode, required this.status, required this.pdfVersion, required this.receiverSignedAt});
  factory _ContractReceiverSignedDto.fromJson(Map<String, dynamic> json) => _$ContractReceiverSignedDtoFromJson(json);

@override final  String publicCode;
@override final  String status;
@override final  int pdfVersion;
@override final  DateTime receiverSignedAt;

/// Create a copy of ContractReceiverSignedDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractReceiverSignedDtoCopyWith<_ContractReceiverSignedDto> get copyWith => __$ContractReceiverSignedDtoCopyWithImpl<_ContractReceiverSignedDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractReceiverSignedDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractReceiverSignedDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.pdfVersion, pdfVersion) || other.pdfVersion == pdfVersion)&&(identical(other.receiverSignedAt, receiverSignedAt) || other.receiverSignedAt == receiverSignedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,status,pdfVersion,receiverSignedAt);

@override
String toString() {
  return 'ContractReceiverSignedDto(publicCode: $publicCode, status: $status, pdfVersion: $pdfVersion, receiverSignedAt: $receiverSignedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractReceiverSignedDtoCopyWith<$Res> implements $ContractReceiverSignedDtoCopyWith<$Res> {
  factory _$ContractReceiverSignedDtoCopyWith(_ContractReceiverSignedDto value, $Res Function(_ContractReceiverSignedDto) _then) = __$ContractReceiverSignedDtoCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String status, int pdfVersion, DateTime receiverSignedAt
});




}
/// @nodoc
class __$ContractReceiverSignedDtoCopyWithImpl<$Res>
    implements _$ContractReceiverSignedDtoCopyWith<$Res> {
  __$ContractReceiverSignedDtoCopyWithImpl(this._self, this._then);

  final _ContractReceiverSignedDto _self;
  final $Res Function(_ContractReceiverSignedDto) _then;

/// Create a copy of ContractReceiverSignedDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? pdfVersion = null,Object? receiverSignedAt = null,}) {
  return _then(_ContractReceiverSignedDto(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pdfVersion: null == pdfVersion ? _self.pdfVersion : pdfVersion // ignore: cast_nullable_to_non_nullable
as int,receiverSignedAt: null == receiverSignedAt ? _self.receiverSignedAt : receiverSignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
