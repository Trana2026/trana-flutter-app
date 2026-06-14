// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareContractState {

 String? get publicCode; String get receiverName; String get receiverPhone; bool get isLoading; String? get error;
/// Create a copy of ShareContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareContractStateCopyWith<ShareContractState> get copyWith => _$ShareContractStateCopyWithImpl<ShareContractState>(this as ShareContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareContractState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.receiverPhone, receiverPhone) || other.receiverPhone == receiverPhone)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,receiverName,receiverPhone,isLoading,error);

@override
String toString() {
  return 'ShareContractState(publicCode: $publicCode, receiverName: $receiverName, receiverPhone: $receiverPhone, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ShareContractStateCopyWith<$Res>  {
  factory $ShareContractStateCopyWith(ShareContractState value, $Res Function(ShareContractState) _then) = _$ShareContractStateCopyWithImpl;
@useResult
$Res call({
 String? publicCode, String receiverName, String receiverPhone, bool isLoading, String? error
});




}
/// @nodoc
class _$ShareContractStateCopyWithImpl<$Res>
    implements $ShareContractStateCopyWith<$Res> {
  _$ShareContractStateCopyWithImpl(this._self, this._then);

  final ShareContractState _self;
  final $Res Function(ShareContractState) _then;

/// Create a copy of ShareContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = freezed,Object? receiverName = null,Object? receiverPhone = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,receiverPhone: null == receiverPhone ? _self.receiverPhone : receiverPhone // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareContractState].
extension ShareContractStatePatterns on ShareContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareContractState value)  $default,){
final _that = this;
switch (_that) {
case _ShareContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareContractState value)?  $default,){
final _that = this;
switch (_that) {
case _ShareContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? publicCode,  String receiverName,  String receiverPhone,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareContractState() when $default != null:
return $default(_that.publicCode,_that.receiverName,_that.receiverPhone,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? publicCode,  String receiverName,  String receiverPhone,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ShareContractState():
return $default(_that.publicCode,_that.receiverName,_that.receiverPhone,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? publicCode,  String receiverName,  String receiverPhone,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ShareContractState() when $default != null:
return $default(_that.publicCode,_that.receiverName,_that.receiverPhone,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ShareContractState implements ShareContractState {
  const _ShareContractState({this.publicCode, this.receiverName = '', this.receiverPhone = '', this.isLoading = false, this.error});
  

@override final  String? publicCode;
@override@JsonKey() final  String receiverName;
@override@JsonKey() final  String receiverPhone;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ShareContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareContractStateCopyWith<_ShareContractState> get copyWith => __$ShareContractStateCopyWithImpl<_ShareContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareContractState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.receiverPhone, receiverPhone) || other.receiverPhone == receiverPhone)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,receiverName,receiverPhone,isLoading,error);

@override
String toString() {
  return 'ShareContractState(publicCode: $publicCode, receiverName: $receiverName, receiverPhone: $receiverPhone, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ShareContractStateCopyWith<$Res> implements $ShareContractStateCopyWith<$Res> {
  factory _$ShareContractStateCopyWith(_ShareContractState value, $Res Function(_ShareContractState) _then) = __$ShareContractStateCopyWithImpl;
@override @useResult
$Res call({
 String? publicCode, String receiverName, String receiverPhone, bool isLoading, String? error
});




}
/// @nodoc
class __$ShareContractStateCopyWithImpl<$Res>
    implements _$ShareContractStateCopyWith<$Res> {
  __$ShareContractStateCopyWithImpl(this._self, this._then);

  final _ShareContractState _self;
  final $Res Function(_ShareContractState) _then;

/// Create a copy of ShareContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = freezed,Object? receiverName = null,Object? receiverPhone = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ShareContractState(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,receiverPhone: null == receiverPhone ? _self.receiverPhone : receiverPhone // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
