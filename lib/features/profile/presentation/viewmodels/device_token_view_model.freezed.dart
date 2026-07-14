// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_token_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceTokenState {

 String get token;// fcm 토큰
 DevicePlatform? get platform;// 플랫폼
 String get deviceModel;// 모델명
 String get osVersion;// os 버전
 String get appVersion;// 앱 버전
 int get currentDeviceId;// 현재 사용중인 device id
 bool get isLoading; String? get error;
/// Create a copy of DeviceTokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceTokenStateCopyWith<DeviceTokenState> get copyWith => _$DeviceTokenStateCopyWithImpl<DeviceTokenState>(this as DeviceTokenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceTokenState&&(identical(other.token, token) || other.token == token)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.currentDeviceId, currentDeviceId) || other.currentDeviceId == currentDeviceId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,token,platform,deviceModel,osVersion,appVersion,currentDeviceId,isLoading,error);

@override
String toString() {
  return 'DeviceTokenState(token: $token, platform: $platform, deviceModel: $deviceModel, osVersion: $osVersion, appVersion: $appVersion, currentDeviceId: $currentDeviceId, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeviceTokenStateCopyWith<$Res>  {
  factory $DeviceTokenStateCopyWith(DeviceTokenState value, $Res Function(DeviceTokenState) _then) = _$DeviceTokenStateCopyWithImpl;
@useResult
$Res call({
 String token, DevicePlatform? platform, String deviceModel, String osVersion, String appVersion, int currentDeviceId, bool isLoading, String? error
});




}
/// @nodoc
class _$DeviceTokenStateCopyWithImpl<$Res>
    implements $DeviceTokenStateCopyWith<$Res> {
  _$DeviceTokenStateCopyWithImpl(this._self, this._then);

  final DeviceTokenState _self;
  final $Res Function(DeviceTokenState) _then;

/// Create a copy of DeviceTokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? platform = freezed,Object? deviceModel = null,Object? osVersion = null,Object? appVersion = null,Object? currentDeviceId = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as DevicePlatform?,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,currentDeviceId: null == currentDeviceId ? _self.currentDeviceId : currentDeviceId // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceTokenState].
extension DeviceTokenStatePatterns on DeviceTokenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceTokenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceTokenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceTokenState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceTokenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceTokenState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceTokenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  DevicePlatform? platform,  String deviceModel,  String osVersion,  String appVersion,  int currentDeviceId,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceTokenState() when $default != null:
return $default(_that.token,_that.platform,_that.deviceModel,_that.osVersion,_that.appVersion,_that.currentDeviceId,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  DevicePlatform? platform,  String deviceModel,  String osVersion,  String appVersion,  int currentDeviceId,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DeviceTokenState():
return $default(_that.token,_that.platform,_that.deviceModel,_that.osVersion,_that.appVersion,_that.currentDeviceId,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  DevicePlatform? platform,  String deviceModel,  String osVersion,  String appVersion,  int currentDeviceId,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DeviceTokenState() when $default != null:
return $default(_that.token,_that.platform,_that.deviceModel,_that.osVersion,_that.appVersion,_that.currentDeviceId,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceTokenState implements DeviceTokenState {
  const _DeviceTokenState({this.token = '', this.platform, this.deviceModel = '', this.osVersion = '', this.appVersion = '', this.currentDeviceId = -1, this.isLoading = false, this.error});
  

@override@JsonKey() final  String token;
// fcm 토큰
@override final  DevicePlatform? platform;
// 플랫폼
@override@JsonKey() final  String deviceModel;
// 모델명
@override@JsonKey() final  String osVersion;
// os 버전
@override@JsonKey() final  String appVersion;
// 앱 버전
@override@JsonKey() final  int currentDeviceId;
// 현재 사용중인 device id
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of DeviceTokenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceTokenStateCopyWith<_DeviceTokenState> get copyWith => __$DeviceTokenStateCopyWithImpl<_DeviceTokenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceTokenState&&(identical(other.token, token) || other.token == token)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.currentDeviceId, currentDeviceId) || other.currentDeviceId == currentDeviceId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,token,platform,deviceModel,osVersion,appVersion,currentDeviceId,isLoading,error);

@override
String toString() {
  return 'DeviceTokenState(token: $token, platform: $platform, deviceModel: $deviceModel, osVersion: $osVersion, appVersion: $appVersion, currentDeviceId: $currentDeviceId, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DeviceTokenStateCopyWith<$Res> implements $DeviceTokenStateCopyWith<$Res> {
  factory _$DeviceTokenStateCopyWith(_DeviceTokenState value, $Res Function(_DeviceTokenState) _then) = __$DeviceTokenStateCopyWithImpl;
@override @useResult
$Res call({
 String token, DevicePlatform? platform, String deviceModel, String osVersion, String appVersion, int currentDeviceId, bool isLoading, String? error
});




}
/// @nodoc
class __$DeviceTokenStateCopyWithImpl<$Res>
    implements _$DeviceTokenStateCopyWith<$Res> {
  __$DeviceTokenStateCopyWithImpl(this._self, this._then);

  final _DeviceTokenState _self;
  final $Res Function(_DeviceTokenState) _then;

/// Create a copy of DeviceTokenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? platform = freezed,Object? deviceModel = null,Object? osVersion = null,Object? appVersion = null,Object? currentDeviceId = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_DeviceTokenState(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as DevicePlatform?,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,currentDeviceId: null == currentDeviceId ? _self.currentDeviceId : currentDeviceId // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
