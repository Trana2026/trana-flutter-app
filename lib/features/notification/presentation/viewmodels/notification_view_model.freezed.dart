// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationState {

 List<NotificationEntity> get notifications;// 알림 목록
 int get page;// 마지막으로 불러온 페이지
 bool get hasNext;// 다음 페이지 존재 여부
 bool get isLoadingNotis;// 최초 목록 로드 중 여부
 bool get isLoadingMoreNotis;// 추가 목록 로드 중 여부
 String? get error;
/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationStateCopyWith<NotificationState> get copyWith => _$NotificationStateCopyWithImpl<NotificationState>(this as NotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationState&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.isLoadingNotis, isLoadingNotis) || other.isLoadingNotis == isLoadingNotis)&&(identical(other.isLoadingMoreNotis, isLoadingMoreNotis) || other.isLoadingMoreNotis == isLoadingMoreNotis)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),page,hasNext,isLoadingNotis,isLoadingMoreNotis,error);

@override
String toString() {
  return 'NotificationState(notifications: $notifications, page: $page, hasNext: $hasNext, isLoadingNotis: $isLoadingNotis, isLoadingMoreNotis: $isLoadingMoreNotis, error: $error)';
}


}

/// @nodoc
abstract mixin class $NotificationStateCopyWith<$Res>  {
  factory $NotificationStateCopyWith(NotificationState value, $Res Function(NotificationState) _then) = _$NotificationStateCopyWithImpl;
@useResult
$Res call({
 List<NotificationEntity> notifications, int page, bool hasNext, bool isLoadingNotis, bool isLoadingMoreNotis, String? error
});




}
/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._self, this._then);

  final NotificationState _self;
  final $Res Function(NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? page = null,Object? hasNext = null,Object? isLoadingNotis = null,Object? isLoadingMoreNotis = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNotis: null == isLoadingNotis ? _self.isLoadingNotis : isLoadingNotis // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMoreNotis: null == isLoadingMoreNotis ? _self.isLoadingMoreNotis : isLoadingMoreNotis // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationEntity> notifications,  int page,  bool hasNext,  bool isLoadingNotis,  bool isLoadingMoreNotis,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
return $default(_that.notifications,_that.page,_that.hasNext,_that.isLoadingNotis,_that.isLoadingMoreNotis,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationEntity> notifications,  int page,  bool hasNext,  bool isLoadingNotis,  bool isLoadingMoreNotis,  String? error)  $default,) {final _that = this;
switch (_that) {
case _NotificationState():
return $default(_that.notifications,_that.page,_that.hasNext,_that.isLoadingNotis,_that.isLoadingMoreNotis,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationEntity> notifications,  int page,  bool hasNext,  bool isLoadingNotis,  bool isLoadingMoreNotis,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
return $default(_that.notifications,_that.page,_that.hasNext,_that.isLoadingNotis,_that.isLoadingMoreNotis,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationState extends NotificationState {
  const _NotificationState({final  List<NotificationEntity> notifications = const [], this.page = 0, this.hasNext = false, this.isLoadingNotis = false, this.isLoadingMoreNotis = false, this.error}): _notifications = notifications,super._();
  

 final  List<NotificationEntity> _notifications;
@override@JsonKey() List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

// 알림 목록
@override@JsonKey() final  int page;
// 마지막으로 불러온 페이지
@override@JsonKey() final  bool hasNext;
// 다음 페이지 존재 여부
@override@JsonKey() final  bool isLoadingNotis;
// 최초 목록 로드 중 여부
@override@JsonKey() final  bool isLoadingMoreNotis;
// 추가 목록 로드 중 여부
@override final  String? error;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationStateCopyWith<_NotificationState> get copyWith => __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationState&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.isLoadingNotis, isLoadingNotis) || other.isLoadingNotis == isLoadingNotis)&&(identical(other.isLoadingMoreNotis, isLoadingMoreNotis) || other.isLoadingMoreNotis == isLoadingMoreNotis)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),page,hasNext,isLoadingNotis,isLoadingMoreNotis,error);

@override
String toString() {
  return 'NotificationState(notifications: $notifications, page: $page, hasNext: $hasNext, isLoadingNotis: $isLoadingNotis, isLoadingMoreNotis: $isLoadingMoreNotis, error: $error)';
}


}

/// @nodoc
abstract mixin class _$NotificationStateCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(_NotificationState value, $Res Function(_NotificationState) _then) = __$NotificationStateCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, int page, bool hasNext, bool isLoadingNotis, bool isLoadingMoreNotis, String? error
});




}
/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(this._self, this._then);

  final _NotificationState _self;
  final $Res Function(_NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? page = null,Object? hasNext = null,Object? isLoadingNotis = null,Object? isLoadingMoreNotis = null,Object? error = freezed,}) {
  return _then(_NotificationState(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNotis: null == isLoadingNotis ? _self.isLoadingNotis : isLoadingNotis // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMoreNotis: null == isLoadingMoreNotis ? _self.isLoadingMoreNotis : isLoadingMoreNotis // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
