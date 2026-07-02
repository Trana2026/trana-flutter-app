// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_dispute_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractDisputeDto {

 int get disputeId; String get reason; String get detail; String get status; DateTime get reportedAt; DateTime? get cancelledAt; bool get isMine;
/// Create a copy of ContractDisputeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDisputeDtoCopyWith<ContractDisputeDto> get copyWith => _$ContractDisputeDtoCopyWithImpl<ContractDisputeDto>(this as ContractDisputeDto, _$identity);

  /// Serializes this ContractDisputeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDisputeDto&&(identical(other.disputeId, disputeId) || other.disputeId == disputeId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,disputeId,reason,detail,status,reportedAt,cancelledAt,isMine);

@override
String toString() {
  return 'ContractDisputeDto(disputeId: $disputeId, reason: $reason, detail: $detail, status: $status, reportedAt: $reportedAt, cancelledAt: $cancelledAt, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class $ContractDisputeDtoCopyWith<$Res>  {
  factory $ContractDisputeDtoCopyWith(ContractDisputeDto value, $Res Function(ContractDisputeDto) _then) = _$ContractDisputeDtoCopyWithImpl;
@useResult
$Res call({
 int disputeId, String reason, String detail, String status, DateTime reportedAt, DateTime? cancelledAt, bool isMine
});




}
/// @nodoc
class _$ContractDisputeDtoCopyWithImpl<$Res>
    implements $ContractDisputeDtoCopyWith<$Res> {
  _$ContractDisputeDtoCopyWithImpl(this._self, this._then);

  final ContractDisputeDto _self;
  final $Res Function(ContractDisputeDto) _then;

/// Create a copy of ContractDisputeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? disputeId = null,Object? reason = null,Object? detail = null,Object? status = null,Object? reportedAt = null,Object? cancelledAt = freezed,Object? isMine = null,}) {
  return _then(_self.copyWith(
disputeId: null == disputeId ? _self.disputeId : disputeId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractDisputeDto].
extension ContractDisputeDtoPatterns on ContractDisputeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDisputeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDisputeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDisputeDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractDisputeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDisputeDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDisputeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int disputeId,  String reason,  String detail,  String status,  DateTime reportedAt,  DateTime? cancelledAt,  bool isMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDisputeDto() when $default != null:
return $default(_that.disputeId,_that.reason,_that.detail,_that.status,_that.reportedAt,_that.cancelledAt,_that.isMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int disputeId,  String reason,  String detail,  String status,  DateTime reportedAt,  DateTime? cancelledAt,  bool isMine)  $default,) {final _that = this;
switch (_that) {
case _ContractDisputeDto():
return $default(_that.disputeId,_that.reason,_that.detail,_that.status,_that.reportedAt,_that.cancelledAt,_that.isMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int disputeId,  String reason,  String detail,  String status,  DateTime reportedAt,  DateTime? cancelledAt,  bool isMine)?  $default,) {final _that = this;
switch (_that) {
case _ContractDisputeDto() when $default != null:
return $default(_that.disputeId,_that.reason,_that.detail,_that.status,_that.reportedAt,_that.cancelledAt,_that.isMine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractDisputeDto implements ContractDisputeDto {
  const _ContractDisputeDto({required this.disputeId, required this.reason, required this.detail, required this.status, required this.reportedAt, this.cancelledAt, required this.isMine});
  factory _ContractDisputeDto.fromJson(Map<String, dynamic> json) => _$ContractDisputeDtoFromJson(json);

@override final  int disputeId;
@override final  String reason;
@override final  String detail;
@override final  String status;
@override final  DateTime reportedAt;
@override final  DateTime? cancelledAt;
@override final  bool isMine;

/// Create a copy of ContractDisputeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDisputeDtoCopyWith<_ContractDisputeDto> get copyWith => __$ContractDisputeDtoCopyWithImpl<_ContractDisputeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractDisputeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDisputeDto&&(identical(other.disputeId, disputeId) || other.disputeId == disputeId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.isMine, isMine) || other.isMine == isMine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,disputeId,reason,detail,status,reportedAt,cancelledAt,isMine);

@override
String toString() {
  return 'ContractDisputeDto(disputeId: $disputeId, reason: $reason, detail: $detail, status: $status, reportedAt: $reportedAt, cancelledAt: $cancelledAt, isMine: $isMine)';
}


}

/// @nodoc
abstract mixin class _$ContractDisputeDtoCopyWith<$Res> implements $ContractDisputeDtoCopyWith<$Res> {
  factory _$ContractDisputeDtoCopyWith(_ContractDisputeDto value, $Res Function(_ContractDisputeDto) _then) = __$ContractDisputeDtoCopyWithImpl;
@override @useResult
$Res call({
 int disputeId, String reason, String detail, String status, DateTime reportedAt, DateTime? cancelledAt, bool isMine
});




}
/// @nodoc
class __$ContractDisputeDtoCopyWithImpl<$Res>
    implements _$ContractDisputeDtoCopyWith<$Res> {
  __$ContractDisputeDtoCopyWithImpl(this._self, this._then);

  final _ContractDisputeDto _self;
  final $Res Function(_ContractDisputeDto) _then;

/// Create a copy of ContractDisputeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? disputeId = null,Object? reason = null,Object? detail = null,Object? status = null,Object? reportedAt = null,Object? cancelledAt = freezed,Object? isMine = null,}) {
  return _then(_ContractDisputeDto(
disputeId: null == disputeId ? _self.disputeId : disputeId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ContractDisputeListDto {

 List<ContractDisputeDto> get disputes;
/// Create a copy of ContractDisputeListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDisputeListDtoCopyWith<ContractDisputeListDto> get copyWith => _$ContractDisputeListDtoCopyWithImpl<ContractDisputeListDto>(this as ContractDisputeListDto, _$identity);

  /// Serializes this ContractDisputeListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDisputeListDto&&const DeepCollectionEquality().equals(other.disputes, disputes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(disputes));

@override
String toString() {
  return 'ContractDisputeListDto(disputes: $disputes)';
}


}

/// @nodoc
abstract mixin class $ContractDisputeListDtoCopyWith<$Res>  {
  factory $ContractDisputeListDtoCopyWith(ContractDisputeListDto value, $Res Function(ContractDisputeListDto) _then) = _$ContractDisputeListDtoCopyWithImpl;
@useResult
$Res call({
 List<ContractDisputeDto> disputes
});




}
/// @nodoc
class _$ContractDisputeListDtoCopyWithImpl<$Res>
    implements $ContractDisputeListDtoCopyWith<$Res> {
  _$ContractDisputeListDtoCopyWithImpl(this._self, this._then);

  final ContractDisputeListDto _self;
  final $Res Function(ContractDisputeListDto) _then;

/// Create a copy of ContractDisputeListDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? disputes = null,}) {
  return _then(_self.copyWith(
disputes: null == disputes ? _self.disputes : disputes // ignore: cast_nullable_to_non_nullable
as List<ContractDisputeDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractDisputeListDto].
extension ContractDisputeListDtoPatterns on ContractDisputeListDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDisputeListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDisputeListDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDisputeListDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractDisputeListDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDisputeListDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDisputeListDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContractDisputeDto> disputes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDisputeListDto() when $default != null:
return $default(_that.disputes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContractDisputeDto> disputes)  $default,) {final _that = this;
switch (_that) {
case _ContractDisputeListDto():
return $default(_that.disputes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContractDisputeDto> disputes)?  $default,) {final _that = this;
switch (_that) {
case _ContractDisputeListDto() when $default != null:
return $default(_that.disputes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractDisputeListDto implements ContractDisputeListDto {
  const _ContractDisputeListDto({required final  List<ContractDisputeDto> disputes}): _disputes = disputes;
  factory _ContractDisputeListDto.fromJson(Map<String, dynamic> json) => _$ContractDisputeListDtoFromJson(json);

 final  List<ContractDisputeDto> _disputes;
@override List<ContractDisputeDto> get disputes {
  if (_disputes is EqualUnmodifiableListView) return _disputes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disputes);
}


/// Create a copy of ContractDisputeListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDisputeListDtoCopyWith<_ContractDisputeListDto> get copyWith => __$ContractDisputeListDtoCopyWithImpl<_ContractDisputeListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractDisputeListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDisputeListDto&&const DeepCollectionEquality().equals(other._disputes, _disputes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_disputes));

@override
String toString() {
  return 'ContractDisputeListDto(disputes: $disputes)';
}


}

/// @nodoc
abstract mixin class _$ContractDisputeListDtoCopyWith<$Res> implements $ContractDisputeListDtoCopyWith<$Res> {
  factory _$ContractDisputeListDtoCopyWith(_ContractDisputeListDto value, $Res Function(_ContractDisputeListDto) _then) = __$ContractDisputeListDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ContractDisputeDto> disputes
});




}
/// @nodoc
class __$ContractDisputeListDtoCopyWithImpl<$Res>
    implements _$ContractDisputeListDtoCopyWith<$Res> {
  __$ContractDisputeListDtoCopyWithImpl(this._self, this._then);

  final _ContractDisputeListDto _self;
  final $Res Function(_ContractDisputeListDto) _then;

/// Create a copy of ContractDisputeListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? disputes = null,}) {
  return _then(_ContractDisputeListDto(
disputes: null == disputes ? _self._disputes : disputes // ignore: cast_nullable_to_non_nullable
as List<ContractDisputeDto>,
  ));
}


}

// dart format on
