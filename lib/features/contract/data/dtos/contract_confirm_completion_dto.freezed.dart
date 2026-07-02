// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_confirm_completion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractConfirmCompletionDto {

 String get publicCode; String get status; DateTime? get sellerCompletedAt; DateTime? get buyerCompletedAt; DateTime? get completedAt;
/// Create a copy of ContractConfirmCompletionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractConfirmCompletionDtoCopyWith<ContractConfirmCompletionDto> get copyWith => _$ContractConfirmCompletionDtoCopyWithImpl<ContractConfirmCompletionDto>(this as ContractConfirmCompletionDto, _$identity);

  /// Serializes this ContractConfirmCompletionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractConfirmCompletionDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.sellerCompletedAt, sellerCompletedAt) || other.sellerCompletedAt == sellerCompletedAt)&&(identical(other.buyerCompletedAt, buyerCompletedAt) || other.buyerCompletedAt == buyerCompletedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,status,sellerCompletedAt,buyerCompletedAt,completedAt);

@override
String toString() {
  return 'ContractConfirmCompletionDto(publicCode: $publicCode, status: $status, sellerCompletedAt: $sellerCompletedAt, buyerCompletedAt: $buyerCompletedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $ContractConfirmCompletionDtoCopyWith<$Res>  {
  factory $ContractConfirmCompletionDtoCopyWith(ContractConfirmCompletionDto value, $Res Function(ContractConfirmCompletionDto) _then) = _$ContractConfirmCompletionDtoCopyWithImpl;
@useResult
$Res call({
 String publicCode, String status, DateTime? sellerCompletedAt, DateTime? buyerCompletedAt, DateTime? completedAt
});




}
/// @nodoc
class _$ContractConfirmCompletionDtoCopyWithImpl<$Res>
    implements $ContractConfirmCompletionDtoCopyWith<$Res> {
  _$ContractConfirmCompletionDtoCopyWithImpl(this._self, this._then);

  final ContractConfirmCompletionDto _self;
  final $Res Function(ContractConfirmCompletionDto) _then;

/// Create a copy of ContractConfirmCompletionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? sellerCompletedAt = freezed,Object? buyerCompletedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sellerCompletedAt: freezed == sellerCompletedAt ? _self.sellerCompletedAt : sellerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,buyerCompletedAt: freezed == buyerCompletedAt ? _self.buyerCompletedAt : buyerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractConfirmCompletionDto].
extension ContractConfirmCompletionDtoPatterns on ContractConfirmCompletionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractConfirmCompletionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractConfirmCompletionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractConfirmCompletionDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractConfirmCompletionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractConfirmCompletionDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractConfirmCompletionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  String status,  DateTime? sellerCompletedAt,  DateTime? buyerCompletedAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractConfirmCompletionDto() when $default != null:
return $default(_that.publicCode,_that.status,_that.sellerCompletedAt,_that.buyerCompletedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  String status,  DateTime? sellerCompletedAt,  DateTime? buyerCompletedAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractConfirmCompletionDto():
return $default(_that.publicCode,_that.status,_that.sellerCompletedAt,_that.buyerCompletedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  String status,  DateTime? sellerCompletedAt,  DateTime? buyerCompletedAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractConfirmCompletionDto() when $default != null:
return $default(_that.publicCode,_that.status,_that.sellerCompletedAt,_that.buyerCompletedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractConfirmCompletionDto implements ContractConfirmCompletionDto {
  const _ContractConfirmCompletionDto({required this.publicCode, required this.status, this.sellerCompletedAt, this.buyerCompletedAt, this.completedAt});
  factory _ContractConfirmCompletionDto.fromJson(Map<String, dynamic> json) => _$ContractConfirmCompletionDtoFromJson(json);

@override final  String publicCode;
@override final  String status;
@override final  DateTime? sellerCompletedAt;
@override final  DateTime? buyerCompletedAt;
@override final  DateTime? completedAt;

/// Create a copy of ContractConfirmCompletionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractConfirmCompletionDtoCopyWith<_ContractConfirmCompletionDto> get copyWith => __$ContractConfirmCompletionDtoCopyWithImpl<_ContractConfirmCompletionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractConfirmCompletionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractConfirmCompletionDto&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.sellerCompletedAt, sellerCompletedAt) || other.sellerCompletedAt == sellerCompletedAt)&&(identical(other.buyerCompletedAt, buyerCompletedAt) || other.buyerCompletedAt == buyerCompletedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode,status,sellerCompletedAt,buyerCompletedAt,completedAt);

@override
String toString() {
  return 'ContractConfirmCompletionDto(publicCode: $publicCode, status: $status, sellerCompletedAt: $sellerCompletedAt, buyerCompletedAt: $buyerCompletedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractConfirmCompletionDtoCopyWith<$Res> implements $ContractConfirmCompletionDtoCopyWith<$Res> {
  factory _$ContractConfirmCompletionDtoCopyWith(_ContractConfirmCompletionDto value, $Res Function(_ContractConfirmCompletionDto) _then) = __$ContractConfirmCompletionDtoCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, String status, DateTime? sellerCompletedAt, DateTime? buyerCompletedAt, DateTime? completedAt
});




}
/// @nodoc
class __$ContractConfirmCompletionDtoCopyWithImpl<$Res>
    implements _$ContractConfirmCompletionDtoCopyWith<$Res> {
  __$ContractConfirmCompletionDtoCopyWithImpl(this._self, this._then);

  final _ContractConfirmCompletionDto _self;
  final $Res Function(_ContractConfirmCompletionDto) _then;

/// Create a copy of ContractConfirmCompletionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? sellerCompletedAt = freezed,Object? buyerCompletedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_ContractConfirmCompletionDto(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sellerCompletedAt: freezed == sellerCompletedAt ? _self.sellerCompletedAt : sellerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,buyerCompletedAt: freezed == buyerCompletedAt ? _self.buyerCompletedAt : buyerCompletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
