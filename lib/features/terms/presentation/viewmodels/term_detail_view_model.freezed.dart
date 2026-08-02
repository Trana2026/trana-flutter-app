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

 TermsContentEntity? get content;// 조회된 약관 전문
 bool get isLoading;// 약관 전문 조회 로딩중 여부
 String? get error;
/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermDetailStateCopyWith<TermDetailState> get copyWith => _$TermDetailStateCopyWithImpl<TermDetailState>(this as TermDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermDetailState&&(identical(other.content, content) || other.content == content)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,content,isLoading,error);

@override
String toString() {
  return 'TermDetailState(content: $content, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $TermDetailStateCopyWith<$Res>  {
  factory $TermDetailStateCopyWith(TermDetailState value, $Res Function(TermDetailState) _then) = _$TermDetailStateCopyWithImpl;
@useResult
$Res call({
 TermsContentEntity? content, bool isLoading, String? error
});


$TermsContentEntityCopyWith<$Res>? get content;

}
/// @nodoc
class _$TermDetailStateCopyWithImpl<$Res>
    implements $TermDetailStateCopyWith<$Res> {
  _$TermDetailStateCopyWithImpl(this._self, this._then);

  final TermDetailState _self;
  final $Res Function(TermDetailState) _then;

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TermsContentEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TermsContentEntityCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TermsContentEntityCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TermsContentEntity? content,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermDetailState() when $default != null:
return $default(_that.content,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TermsContentEntity? content,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TermDetailState():
return $default(_that.content,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TermsContentEntity? content,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TermDetailState() when $default != null:
return $default(_that.content,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TermDetailState implements TermDetailState {
  const _TermDetailState({this.content, this.isLoading = false, this.error});
  

@override final  TermsContentEntity? content;
// 조회된 약관 전문
@override@JsonKey() final  bool isLoading;
// 약관 전문 조회 로딩중 여부
@override final  String? error;

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermDetailStateCopyWith<_TermDetailState> get copyWith => __$TermDetailStateCopyWithImpl<_TermDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermDetailState&&(identical(other.content, content) || other.content == content)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,content,isLoading,error);

@override
String toString() {
  return 'TermDetailState(content: $content, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TermDetailStateCopyWith<$Res> implements $TermDetailStateCopyWith<$Res> {
  factory _$TermDetailStateCopyWith(_TermDetailState value, $Res Function(_TermDetailState) _then) = __$TermDetailStateCopyWithImpl;
@override @useResult
$Res call({
 TermsContentEntity? content, bool isLoading, String? error
});


@override $TermsContentEntityCopyWith<$Res>? get content;

}
/// @nodoc
class __$TermDetailStateCopyWithImpl<$Res>
    implements _$TermDetailStateCopyWith<$Res> {
  __$TermDetailStateCopyWithImpl(this._self, this._then);

  final _TermDetailState _self;
  final $Res Function(_TermDetailState) _then;

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_TermDetailState(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TermsContentEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TermDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TermsContentEntityCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TermsContentEntityCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on
