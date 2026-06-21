// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_auto_fill_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiAutoFillState {

 DateTime? get autoFillConsentedAt;// AI 자동기입 고지 동의 일자
 int? get extractionId;// 진행 중인 extraction id
 String get platform;// 플랫폼 (AI 분석 결과)
 String get name;// 상품명 (AI 분석 결과)
 int get amount;// 가격 (AI 분석 결과)
 String get condition;// 상품 상태 (AI 분석 결과)
 String get details;// 상품 상세 정보 (AI 분석 결과)
 bool get isLoading; bool get completed; String? get error;
/// Create a copy of AiAutoFillState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAutoFillStateCopyWith<AiAutoFillState> get copyWith => _$AiAutoFillStateCopyWithImpl<AiAutoFillState>(this as AiAutoFillState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAutoFillState&&(identical(other.autoFillConsentedAt, autoFillConsentedAt) || other.autoFillConsentedAt == autoFillConsentedAt)&&(identical(other.extractionId, extractionId) || other.extractionId == extractionId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.details, details) || other.details == details)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,autoFillConsentedAt,extractionId,platform,name,amount,condition,details,isLoading,completed,error);

@override
String toString() {
  return 'AiAutoFillState(autoFillConsentedAt: $autoFillConsentedAt, extractionId: $extractionId, platform: $platform, name: $name, amount: $amount, condition: $condition, details: $details, isLoading: $isLoading, completed: $completed, error: $error)';
}


}

/// @nodoc
abstract mixin class $AiAutoFillStateCopyWith<$Res>  {
  factory $AiAutoFillStateCopyWith(AiAutoFillState value, $Res Function(AiAutoFillState) _then) = _$AiAutoFillStateCopyWithImpl;
@useResult
$Res call({
 DateTime? autoFillConsentedAt, int? extractionId, String platform, String name, int amount, String condition, String details, bool isLoading, bool completed, String? error
});




}
/// @nodoc
class _$AiAutoFillStateCopyWithImpl<$Res>
    implements $AiAutoFillStateCopyWith<$Res> {
  _$AiAutoFillStateCopyWithImpl(this._self, this._then);

  final AiAutoFillState _self;
  final $Res Function(AiAutoFillState) _then;

/// Create a copy of AiAutoFillState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? autoFillConsentedAt = freezed,Object? extractionId = freezed,Object? platform = null,Object? name = null,Object? amount = null,Object? condition = null,Object? details = null,Object? isLoading = null,Object? completed = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
autoFillConsentedAt: freezed == autoFillConsentedAt ? _self.autoFillConsentedAt : autoFillConsentedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,extractionId: freezed == extractionId ? _self.extractionId : extractionId // ignore: cast_nullable_to_non_nullable
as int?,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AiAutoFillState].
extension AiAutoFillStatePatterns on AiAutoFillState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiAutoFillState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiAutoFillState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiAutoFillState value)  $default,){
final _that = this;
switch (_that) {
case _AiAutoFillState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiAutoFillState value)?  $default,){
final _that = this;
switch (_that) {
case _AiAutoFillState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? autoFillConsentedAt,  int? extractionId,  String platform,  String name,  int amount,  String condition,  String details,  bool isLoading,  bool completed,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiAutoFillState() when $default != null:
return $default(_that.autoFillConsentedAt,_that.extractionId,_that.platform,_that.name,_that.amount,_that.condition,_that.details,_that.isLoading,_that.completed,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? autoFillConsentedAt,  int? extractionId,  String platform,  String name,  int amount,  String condition,  String details,  bool isLoading,  bool completed,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AiAutoFillState():
return $default(_that.autoFillConsentedAt,_that.extractionId,_that.platform,_that.name,_that.amount,_that.condition,_that.details,_that.isLoading,_that.completed,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? autoFillConsentedAt,  int? extractionId,  String platform,  String name,  int amount,  String condition,  String details,  bool isLoading,  bool completed,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AiAutoFillState() when $default != null:
return $default(_that.autoFillConsentedAt,_that.extractionId,_that.platform,_that.name,_that.amount,_that.condition,_that.details,_that.isLoading,_that.completed,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AiAutoFillState implements AiAutoFillState {
  const _AiAutoFillState({this.autoFillConsentedAt, this.extractionId, this.platform = '', this.name = '', this.amount = 0, this.condition = '', this.details = '', this.isLoading = false, this.completed = false, this.error});
  

@override final  DateTime? autoFillConsentedAt;
// AI 자동기입 고지 동의 일자
@override final  int? extractionId;
// 진행 중인 extraction id
@override@JsonKey() final  String platform;
// 플랫폼 (AI 분석 결과)
@override@JsonKey() final  String name;
// 상품명 (AI 분석 결과)
@override@JsonKey() final  int amount;
// 가격 (AI 분석 결과)
@override@JsonKey() final  String condition;
// 상품 상태 (AI 분석 결과)
@override@JsonKey() final  String details;
// 상품 상세 정보 (AI 분석 결과)
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool completed;
@override final  String? error;

/// Create a copy of AiAutoFillState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiAutoFillStateCopyWith<_AiAutoFillState> get copyWith => __$AiAutoFillStateCopyWithImpl<_AiAutoFillState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiAutoFillState&&(identical(other.autoFillConsentedAt, autoFillConsentedAt) || other.autoFillConsentedAt == autoFillConsentedAt)&&(identical(other.extractionId, extractionId) || other.extractionId == extractionId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.details, details) || other.details == details)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,autoFillConsentedAt,extractionId,platform,name,amount,condition,details,isLoading,completed,error);

@override
String toString() {
  return 'AiAutoFillState(autoFillConsentedAt: $autoFillConsentedAt, extractionId: $extractionId, platform: $platform, name: $name, amount: $amount, condition: $condition, details: $details, isLoading: $isLoading, completed: $completed, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AiAutoFillStateCopyWith<$Res> implements $AiAutoFillStateCopyWith<$Res> {
  factory _$AiAutoFillStateCopyWith(_AiAutoFillState value, $Res Function(_AiAutoFillState) _then) = __$AiAutoFillStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? autoFillConsentedAt, int? extractionId, String platform, String name, int amount, String condition, String details, bool isLoading, bool completed, String? error
});




}
/// @nodoc
class __$AiAutoFillStateCopyWithImpl<$Res>
    implements _$AiAutoFillStateCopyWith<$Res> {
  __$AiAutoFillStateCopyWithImpl(this._self, this._then);

  final _AiAutoFillState _self;
  final $Res Function(_AiAutoFillState) _then;

/// Create a copy of AiAutoFillState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? autoFillConsentedAt = freezed,Object? extractionId = freezed,Object? platform = null,Object? name = null,Object? amount = null,Object? condition = null,Object? details = null,Object? isLoading = null,Object? completed = null,Object? error = freezed,}) {
  return _then(_AiAutoFillState(
autoFillConsentedAt: freezed == autoFillConsentedAt ? _self.autoFillConsentedAt : autoFillConsentedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,extractionId: freezed == extractionId ? _self.extractionId : extractionId // ignore: cast_nullable_to_non_nullable
as int?,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
