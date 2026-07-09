// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trust_score_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrustScoreDto {

 int get trustScore; String get trustGrade; String get trustGradeLabel; int get completedContractCount; int get warrantyProvidedCount; int get fraudReportReceivedCount;
/// Create a copy of TrustScoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrustScoreDtoCopyWith<TrustScoreDto> get copyWith => _$TrustScoreDtoCopyWithImpl<TrustScoreDto>(this as TrustScoreDto, _$identity);

  /// Serializes this TrustScoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrustScoreDto&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.trustGrade, trustGrade) || other.trustGrade == trustGrade)&&(identical(other.trustGradeLabel, trustGradeLabel) || other.trustGradeLabel == trustGradeLabel)&&(identical(other.completedContractCount, completedContractCount) || other.completedContractCount == completedContractCount)&&(identical(other.warrantyProvidedCount, warrantyProvidedCount) || other.warrantyProvidedCount == warrantyProvidedCount)&&(identical(other.fraudReportReceivedCount, fraudReportReceivedCount) || other.fraudReportReceivedCount == fraudReportReceivedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trustScore,trustGrade,trustGradeLabel,completedContractCount,warrantyProvidedCount,fraudReportReceivedCount);

@override
String toString() {
  return 'TrustScoreDto(trustScore: $trustScore, trustGrade: $trustGrade, trustGradeLabel: $trustGradeLabel, completedContractCount: $completedContractCount, warrantyProvidedCount: $warrantyProvidedCount, fraudReportReceivedCount: $fraudReportReceivedCount)';
}


}

/// @nodoc
abstract mixin class $TrustScoreDtoCopyWith<$Res>  {
  factory $TrustScoreDtoCopyWith(TrustScoreDto value, $Res Function(TrustScoreDto) _then) = _$TrustScoreDtoCopyWithImpl;
@useResult
$Res call({
 int trustScore, String trustGrade, String trustGradeLabel, int completedContractCount, int warrantyProvidedCount, int fraudReportReceivedCount
});




}
/// @nodoc
class _$TrustScoreDtoCopyWithImpl<$Res>
    implements $TrustScoreDtoCopyWith<$Res> {
  _$TrustScoreDtoCopyWithImpl(this._self, this._then);

  final TrustScoreDto _self;
  final $Res Function(TrustScoreDto) _then;

/// Create a copy of TrustScoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trustScore = null,Object? trustGrade = null,Object? trustGradeLabel = null,Object? completedContractCount = null,Object? warrantyProvidedCount = null,Object? fraudReportReceivedCount = null,}) {
  return _then(_self.copyWith(
trustScore: null == trustScore ? _self.trustScore : trustScore // ignore: cast_nullable_to_non_nullable
as int,trustGrade: null == trustGrade ? _self.trustGrade : trustGrade // ignore: cast_nullable_to_non_nullable
as String,trustGradeLabel: null == trustGradeLabel ? _self.trustGradeLabel : trustGradeLabel // ignore: cast_nullable_to_non_nullable
as String,completedContractCount: null == completedContractCount ? _self.completedContractCount : completedContractCount // ignore: cast_nullable_to_non_nullable
as int,warrantyProvidedCount: null == warrantyProvidedCount ? _self.warrantyProvidedCount : warrantyProvidedCount // ignore: cast_nullable_to_non_nullable
as int,fraudReportReceivedCount: null == fraudReportReceivedCount ? _self.fraudReportReceivedCount : fraudReportReceivedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrustScoreDto].
extension TrustScoreDtoPatterns on TrustScoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrustScoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrustScoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrustScoreDto value)  $default,){
final _that = this;
switch (_that) {
case _TrustScoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrustScoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrustScoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int trustScore,  String trustGrade,  String trustGradeLabel,  int completedContractCount,  int warrantyProvidedCount,  int fraudReportReceivedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrustScoreDto() when $default != null:
return $default(_that.trustScore,_that.trustGrade,_that.trustGradeLabel,_that.completedContractCount,_that.warrantyProvidedCount,_that.fraudReportReceivedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int trustScore,  String trustGrade,  String trustGradeLabel,  int completedContractCount,  int warrantyProvidedCount,  int fraudReportReceivedCount)  $default,) {final _that = this;
switch (_that) {
case _TrustScoreDto():
return $default(_that.trustScore,_that.trustGrade,_that.trustGradeLabel,_that.completedContractCount,_that.warrantyProvidedCount,_that.fraudReportReceivedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int trustScore,  String trustGrade,  String trustGradeLabel,  int completedContractCount,  int warrantyProvidedCount,  int fraudReportReceivedCount)?  $default,) {final _that = this;
switch (_that) {
case _TrustScoreDto() when $default != null:
return $default(_that.trustScore,_that.trustGrade,_that.trustGradeLabel,_that.completedContractCount,_that.warrantyProvidedCount,_that.fraudReportReceivedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrustScoreDto implements TrustScoreDto {
  const _TrustScoreDto({required this.trustScore, required this.trustGrade, required this.trustGradeLabel, required this.completedContractCount, required this.warrantyProvidedCount, required this.fraudReportReceivedCount});
  factory _TrustScoreDto.fromJson(Map<String, dynamic> json) => _$TrustScoreDtoFromJson(json);

@override final  int trustScore;
@override final  String trustGrade;
@override final  String trustGradeLabel;
@override final  int completedContractCount;
@override final  int warrantyProvidedCount;
@override final  int fraudReportReceivedCount;

/// Create a copy of TrustScoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrustScoreDtoCopyWith<_TrustScoreDto> get copyWith => __$TrustScoreDtoCopyWithImpl<_TrustScoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrustScoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrustScoreDto&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.trustGrade, trustGrade) || other.trustGrade == trustGrade)&&(identical(other.trustGradeLabel, trustGradeLabel) || other.trustGradeLabel == trustGradeLabel)&&(identical(other.completedContractCount, completedContractCount) || other.completedContractCount == completedContractCount)&&(identical(other.warrantyProvidedCount, warrantyProvidedCount) || other.warrantyProvidedCount == warrantyProvidedCount)&&(identical(other.fraudReportReceivedCount, fraudReportReceivedCount) || other.fraudReportReceivedCount == fraudReportReceivedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trustScore,trustGrade,trustGradeLabel,completedContractCount,warrantyProvidedCount,fraudReportReceivedCount);

@override
String toString() {
  return 'TrustScoreDto(trustScore: $trustScore, trustGrade: $trustGrade, trustGradeLabel: $trustGradeLabel, completedContractCount: $completedContractCount, warrantyProvidedCount: $warrantyProvidedCount, fraudReportReceivedCount: $fraudReportReceivedCount)';
}


}

/// @nodoc
abstract mixin class _$TrustScoreDtoCopyWith<$Res> implements $TrustScoreDtoCopyWith<$Res> {
  factory _$TrustScoreDtoCopyWith(_TrustScoreDto value, $Res Function(_TrustScoreDto) _then) = __$TrustScoreDtoCopyWithImpl;
@override @useResult
$Res call({
 int trustScore, String trustGrade, String trustGradeLabel, int completedContractCount, int warrantyProvidedCount, int fraudReportReceivedCount
});




}
/// @nodoc
class __$TrustScoreDtoCopyWithImpl<$Res>
    implements _$TrustScoreDtoCopyWith<$Res> {
  __$TrustScoreDtoCopyWithImpl(this._self, this._then);

  final _TrustScoreDto _self;
  final $Res Function(_TrustScoreDto) _then;

/// Create a copy of TrustScoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trustScore = null,Object? trustGrade = null,Object? trustGradeLabel = null,Object? completedContractCount = null,Object? warrantyProvidedCount = null,Object? fraudReportReceivedCount = null,}) {
  return _then(_TrustScoreDto(
trustScore: null == trustScore ? _self.trustScore : trustScore // ignore: cast_nullable_to_non_nullable
as int,trustGrade: null == trustGrade ? _self.trustGrade : trustGrade // ignore: cast_nullable_to_non_nullable
as String,trustGradeLabel: null == trustGradeLabel ? _self.trustGradeLabel : trustGradeLabel // ignore: cast_nullable_to_non_nullable
as String,completedContractCount: null == completedContractCount ? _self.completedContractCount : completedContractCount // ignore: cast_nullable_to_non_nullable
as int,warrantyProvidedCount: null == warrantyProvidedCount ? _self.warrantyProvidedCount : warrantyProvidedCount // ignore: cast_nullable_to_non_nullable
as int,fraudReportReceivedCount: null == fraudReportReceivedCount ? _self.fraudReportReceivedCount : fraudReportReceivedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
