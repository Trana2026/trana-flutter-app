// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_ai_extraction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractAiExtractionEntity {

 int get extractionId; String get status; String get model; String get promptVersion; Map<String, dynamic>? get prefill; int? get latencyMs; Map<String, dynamic>? get usage; String? get errorMessage; DateTime get extractedAt;
/// Create a copy of ContractAiExtractionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractAiExtractionEntityCopyWith<ContractAiExtractionEntity> get copyWith => _$ContractAiExtractionEntityCopyWithImpl<ContractAiExtractionEntity>(this as ContractAiExtractionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractAiExtractionEntity&&(identical(other.extractionId, extractionId) || other.extractionId == extractionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.model, model) || other.model == model)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&const DeepCollectionEquality().equals(other.prefill, prefill)&&(identical(other.latencyMs, latencyMs) || other.latencyMs == latencyMs)&&const DeepCollectionEquality().equals(other.usage, usage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.extractedAt, extractedAt) || other.extractedAt == extractedAt));
}


@override
int get hashCode => Object.hash(runtimeType,extractionId,status,model,promptVersion,const DeepCollectionEquality().hash(prefill),latencyMs,const DeepCollectionEquality().hash(usage),errorMessage,extractedAt);

@override
String toString() {
  return 'ContractAiExtractionEntity(extractionId: $extractionId, status: $status, model: $model, promptVersion: $promptVersion, prefill: $prefill, latencyMs: $latencyMs, usage: $usage, errorMessage: $errorMessage, extractedAt: $extractedAt)';
}


}

/// @nodoc
abstract mixin class $ContractAiExtractionEntityCopyWith<$Res>  {
  factory $ContractAiExtractionEntityCopyWith(ContractAiExtractionEntity value, $Res Function(ContractAiExtractionEntity) _then) = _$ContractAiExtractionEntityCopyWithImpl;
@useResult
$Res call({
 int extractionId, String status, String model, String promptVersion, Map<String, dynamic>? prefill, int? latencyMs, Map<String, dynamic>? usage, String? errorMessage, DateTime extractedAt
});




}
/// @nodoc
class _$ContractAiExtractionEntityCopyWithImpl<$Res>
    implements $ContractAiExtractionEntityCopyWith<$Res> {
  _$ContractAiExtractionEntityCopyWithImpl(this._self, this._then);

  final ContractAiExtractionEntity _self;
  final $Res Function(ContractAiExtractionEntity) _then;

/// Create a copy of ContractAiExtractionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? extractionId = null,Object? status = null,Object? model = null,Object? promptVersion = null,Object? prefill = freezed,Object? latencyMs = freezed,Object? usage = freezed,Object? errorMessage = freezed,Object? extractedAt = null,}) {
  return _then(_self.copyWith(
extractionId: null == extractionId ? _self.extractionId : extractionId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as String,prefill: freezed == prefill ? _self.prefill : prefill // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,latencyMs: freezed == latencyMs ? _self.latencyMs : latencyMs // ignore: cast_nullable_to_non_nullable
as int?,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,extractedAt: null == extractedAt ? _self.extractedAt : extractedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractAiExtractionEntity].
extension ContractAiExtractionEntityPatterns on ContractAiExtractionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractAiExtractionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractAiExtractionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractAiExtractionEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractAiExtractionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractAiExtractionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractAiExtractionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int extractionId,  String status,  String model,  String promptVersion,  Map<String, dynamic>? prefill,  int? latencyMs,  Map<String, dynamic>? usage,  String? errorMessage,  DateTime extractedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractAiExtractionEntity() when $default != null:
return $default(_that.extractionId,_that.status,_that.model,_that.promptVersion,_that.prefill,_that.latencyMs,_that.usage,_that.errorMessage,_that.extractedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int extractionId,  String status,  String model,  String promptVersion,  Map<String, dynamic>? prefill,  int? latencyMs,  Map<String, dynamic>? usage,  String? errorMessage,  DateTime extractedAt)  $default,) {final _that = this;
switch (_that) {
case _ContractAiExtractionEntity():
return $default(_that.extractionId,_that.status,_that.model,_that.promptVersion,_that.prefill,_that.latencyMs,_that.usage,_that.errorMessage,_that.extractedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int extractionId,  String status,  String model,  String promptVersion,  Map<String, dynamic>? prefill,  int? latencyMs,  Map<String, dynamic>? usage,  String? errorMessage,  DateTime extractedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContractAiExtractionEntity() when $default != null:
return $default(_that.extractionId,_that.status,_that.model,_that.promptVersion,_that.prefill,_that.latencyMs,_that.usage,_that.errorMessage,_that.extractedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ContractAiExtractionEntity implements ContractAiExtractionEntity {
  const _ContractAiExtractionEntity({required this.extractionId, required this.status, required this.model, required this.promptVersion, final  Map<String, dynamic>? prefill, this.latencyMs, final  Map<String, dynamic>? usage, this.errorMessage, required this.extractedAt}): _prefill = prefill,_usage = usage;
  

@override final  int extractionId;
@override final  String status;
@override final  String model;
@override final  String promptVersion;
 final  Map<String, dynamic>? _prefill;
@override Map<String, dynamic>? get prefill {
  final value = _prefill;
  if (value == null) return null;
  if (_prefill is EqualUnmodifiableMapView) return _prefill;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  int? latencyMs;
 final  Map<String, dynamic>? _usage;
@override Map<String, dynamic>? get usage {
  final value = _usage;
  if (value == null) return null;
  if (_usage is EqualUnmodifiableMapView) return _usage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? errorMessage;
@override final  DateTime extractedAt;

/// Create a copy of ContractAiExtractionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractAiExtractionEntityCopyWith<_ContractAiExtractionEntity> get copyWith => __$ContractAiExtractionEntityCopyWithImpl<_ContractAiExtractionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractAiExtractionEntity&&(identical(other.extractionId, extractionId) || other.extractionId == extractionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.model, model) || other.model == model)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&const DeepCollectionEquality().equals(other._prefill, _prefill)&&(identical(other.latencyMs, latencyMs) || other.latencyMs == latencyMs)&&const DeepCollectionEquality().equals(other._usage, _usage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.extractedAt, extractedAt) || other.extractedAt == extractedAt));
}


@override
int get hashCode => Object.hash(runtimeType,extractionId,status,model,promptVersion,const DeepCollectionEquality().hash(_prefill),latencyMs,const DeepCollectionEquality().hash(_usage),errorMessage,extractedAt);

@override
String toString() {
  return 'ContractAiExtractionEntity(extractionId: $extractionId, status: $status, model: $model, promptVersion: $promptVersion, prefill: $prefill, latencyMs: $latencyMs, usage: $usage, errorMessage: $errorMessage, extractedAt: $extractedAt)';
}


}

/// @nodoc
abstract mixin class _$ContractAiExtractionEntityCopyWith<$Res> implements $ContractAiExtractionEntityCopyWith<$Res> {
  factory _$ContractAiExtractionEntityCopyWith(_ContractAiExtractionEntity value, $Res Function(_ContractAiExtractionEntity) _then) = __$ContractAiExtractionEntityCopyWithImpl;
@override @useResult
$Res call({
 int extractionId, String status, String model, String promptVersion, Map<String, dynamic>? prefill, int? latencyMs, Map<String, dynamic>? usage, String? errorMessage, DateTime extractedAt
});




}
/// @nodoc
class __$ContractAiExtractionEntityCopyWithImpl<$Res>
    implements _$ContractAiExtractionEntityCopyWith<$Res> {
  __$ContractAiExtractionEntityCopyWithImpl(this._self, this._then);

  final _ContractAiExtractionEntity _self;
  final $Res Function(_ContractAiExtractionEntity) _then;

/// Create a copy of ContractAiExtractionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? extractionId = null,Object? status = null,Object? model = null,Object? promptVersion = null,Object? prefill = freezed,Object? latencyMs = freezed,Object? usage = freezed,Object? errorMessage = freezed,Object? extractedAt = null,}) {
  return _then(_ContractAiExtractionEntity(
extractionId: null == extractionId ? _self.extractionId : extractionId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as String,prefill: freezed == prefill ? _self._prefill : prefill // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,latencyMs: freezed == latencyMs ? _self.latencyMs : latencyMs // ignore: cast_nullable_to_non_nullable
as int?,usage: freezed == usage ? _self._usage : usage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,extractedAt: null == extractedAt ? _self.extractedAt : extractedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
