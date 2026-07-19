// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'term_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermDetailState {

// 선택된 약관 정보
 int get id; TermsType? get type; String get version; String get title; String get contentUrl; DateTime? get effectiveAt; bool get isLoadingTerm;// 약관 단일 조회 로딩중 여부
 String? get error;
/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermDetailStateCopyWith<TermDetailState> get copyWith => _$TermDetailStateCopyWithImpl<TermDetailState>(this as TermDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermDetailState&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.effectiveAt, effectiveAt) || other.effectiveAt == effectiveAt)&&(identical(other.isLoadingTerm, isLoadingTerm) || other.isLoadingTerm == isLoadingTerm)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,version,title,contentUrl,effectiveAt,isLoadingTerm,error);

@override
String toString() {
  return 'TermDetailState(id: $id, type: $type, version: $version, title: $title, contentUrl: $contentUrl, effectiveAt: $effectiveAt, isLoadingTerm: $isLoadingTerm, error: $error)';
}


}

/// @nodoc
abstract mixin class $TermDetailStateCopyWith<$Res>  {
  factory $TermDetailStateCopyWith(TermDetailState value, $Res Function(TermDetailState) _then) = _$TermDetailStateCopyWithImpl;
@useResult
$Res call({
 int id, TermsType? type, String version, String title, String contentUrl, DateTime? effectiveAt, bool isLoadingTerm, String? error
});




}
/// @nodoc
class _$TermDetailStateCopyWithImpl<$Res>
    implements $TermDetailStateCopyWith<$Res> {
  _$TermDetailStateCopyWithImpl(this._self, this._then);

  final TermDetailState _self;
  final $Res Function(TermDetailState) _then;

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? version = null,Object? title = null,Object? contentUrl = null,Object? effectiveAt = freezed,Object? isLoadingTerm = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TermsType?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,effectiveAt: freezed == effectiveAt ? _self.effectiveAt : effectiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoadingTerm: null == isLoadingTerm ? _self.isLoadingTerm : isLoadingTerm // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TermDetailState].
extension TermDetailStatePatterns on TermDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TermDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TermDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TermsType? type,  String version,  String title,  String contentUrl,  DateTime? effectiveAt,  bool isLoadingTerm,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermDetailState() when $default != null:
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentUrl,_that.effectiveAt,_that.isLoadingTerm,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TermsType? type,  String version,  String title,  String contentUrl,  DateTime? effectiveAt,  bool isLoadingTerm,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TermDetailState():
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentUrl,_that.effectiveAt,_that.isLoadingTerm,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TermsType? type,  String version,  String title,  String contentUrl,  DateTime? effectiveAt,  bool isLoadingTerm,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TermDetailState() when $default != null:
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentUrl,_that.effectiveAt,_that.isLoadingTerm,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TermDetailState implements TermDetailState {
  const _TermDetailState({this.id = -1, this.type, this.version = '', this.title = '', this.contentUrl = '', this.effectiveAt, this.isLoadingTerm = false, this.error});
  

// 선택된 약관 정보
@override@JsonKey() final  int id;
@override final  TermsType? type;
@override@JsonKey() final  String version;
@override@JsonKey() final  String title;
@override@JsonKey() final  String contentUrl;
@override final  DateTime? effectiveAt;
@override@JsonKey() final  bool isLoadingTerm;
// 약관 단일 조회 로딩중 여부
@override final  String? error;

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermDetailStateCopyWith<_TermDetailState> get copyWith => __$TermDetailStateCopyWithImpl<_TermDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermDetailState&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.effectiveAt, effectiveAt) || other.effectiveAt == effectiveAt)&&(identical(other.isLoadingTerm, isLoadingTerm) || other.isLoadingTerm == isLoadingTerm)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,version,title,contentUrl,effectiveAt,isLoadingTerm,error);

@override
String toString() {
  return 'TermDetailState(id: $id, type: $type, version: $version, title: $title, contentUrl: $contentUrl, effectiveAt: $effectiveAt, isLoadingTerm: $isLoadingTerm, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TermDetailStateCopyWith<$Res> implements $TermDetailStateCopyWith<$Res> {
  factory _$TermDetailStateCopyWith(_TermDetailState value, $Res Function(_TermDetailState) _then) = __$TermDetailStateCopyWithImpl;
@override @useResult
$Res call({
 int id, TermsType? type, String version, String title, String contentUrl, DateTime? effectiveAt, bool isLoadingTerm, String? error
});




}
/// @nodoc
class __$TermDetailStateCopyWithImpl<$Res>
    implements _$TermDetailStateCopyWith<$Res> {
  __$TermDetailStateCopyWithImpl(this._self, this._then);

  final _TermDetailState _self;
  final $Res Function(_TermDetailState) _then;

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = freezed,Object? version = null,Object? title = null,Object? contentUrl = null,Object? effectiveAt = freezed,Object? isLoadingTerm = null,Object? error = freezed,}) {
  return _then(_TermDetailState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TermsType?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,effectiveAt: freezed == effectiveAt ? _self.effectiveAt : effectiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoadingTerm: null == isLoadingTerm ? _self.isLoadingTerm : isLoadingTerm // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
