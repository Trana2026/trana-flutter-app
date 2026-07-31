// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inquiry_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InquiryState {

 List<UserInquiryEntity> get inquiries;// 문의 전체 목록
 String? get selectedTitle;// 선택된 문의의 제목
 String? get selectedContent;// 선택된 문의의 상세 내용
 String get email;// 이메일 입력값
 String get title;// 문의 제목 입력값
 String get content;// 문의 내용 입력값
 String? get error;
/// Create a copy of InquiryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InquiryStateCopyWith<InquiryState> get copyWith => _$InquiryStateCopyWithImpl<InquiryState>(this as InquiryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InquiryState&&const DeepCollectionEquality().equals(other.inquiries, inquiries)&&(identical(other.selectedTitle, selectedTitle) || other.selectedTitle == selectedTitle)&&(identical(other.selectedContent, selectedContent) || other.selectedContent == selectedContent)&&(identical(other.email, email) || other.email == email)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(inquiries),selectedTitle,selectedContent,email,title,content,error);

@override
String toString() {
  return 'InquiryState(inquiries: $inquiries, selectedTitle: $selectedTitle, selectedContent: $selectedContent, email: $email, title: $title, content: $content, error: $error)';
}


}

/// @nodoc
abstract mixin class $InquiryStateCopyWith<$Res>  {
  factory $InquiryStateCopyWith(InquiryState value, $Res Function(InquiryState) _then) = _$InquiryStateCopyWithImpl;
@useResult
$Res call({
 List<UserInquiryEntity> inquiries, String? selectedTitle, String? selectedContent, String email, String title, String content, String? error
});




}
/// @nodoc
class _$InquiryStateCopyWithImpl<$Res>
    implements $InquiryStateCopyWith<$Res> {
  _$InquiryStateCopyWithImpl(this._self, this._then);

  final InquiryState _self;
  final $Res Function(InquiryState) _then;

/// Create a copy of InquiryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inquiries = null,Object? selectedTitle = freezed,Object? selectedContent = freezed,Object? email = null,Object? title = null,Object? content = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
inquiries: null == inquiries ? _self.inquiries : inquiries // ignore: cast_nullable_to_non_nullable
as List<UserInquiryEntity>,selectedTitle: freezed == selectedTitle ? _self.selectedTitle : selectedTitle // ignore: cast_nullable_to_non_nullable
as String?,selectedContent: freezed == selectedContent ? _self.selectedContent : selectedContent // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InquiryState].
extension InquiryStatePatterns on InquiryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InquiryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InquiryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InquiryState value)  $default,){
final _that = this;
switch (_that) {
case _InquiryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InquiryState value)?  $default,){
final _that = this;
switch (_that) {
case _InquiryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserInquiryEntity> inquiries,  String? selectedTitle,  String? selectedContent,  String email,  String title,  String content,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InquiryState() when $default != null:
return $default(_that.inquiries,_that.selectedTitle,_that.selectedContent,_that.email,_that.title,_that.content,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserInquiryEntity> inquiries,  String? selectedTitle,  String? selectedContent,  String email,  String title,  String content,  String? error)  $default,) {final _that = this;
switch (_that) {
case _InquiryState():
return $default(_that.inquiries,_that.selectedTitle,_that.selectedContent,_that.email,_that.title,_that.content,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserInquiryEntity> inquiries,  String? selectedTitle,  String? selectedContent,  String email,  String title,  String content,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _InquiryState() when $default != null:
return $default(_that.inquiries,_that.selectedTitle,_that.selectedContent,_that.email,_that.title,_that.content,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _InquiryState implements InquiryState {
  const _InquiryState({final  List<UserInquiryEntity> inquiries = const [], this.selectedTitle, this.selectedContent, this.email = '', this.title = '', this.content = '', this.error}): _inquiries = inquiries;
  

 final  List<UserInquiryEntity> _inquiries;
@override@JsonKey() List<UserInquiryEntity> get inquiries {
  if (_inquiries is EqualUnmodifiableListView) return _inquiries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inquiries);
}

// 문의 전체 목록
@override final  String? selectedTitle;
// 선택된 문의의 제목
@override final  String? selectedContent;
// 선택된 문의의 상세 내용
@override@JsonKey() final  String email;
// 이메일 입력값
@override@JsonKey() final  String title;
// 문의 제목 입력값
@override@JsonKey() final  String content;
// 문의 내용 입력값
@override final  String? error;

/// Create a copy of InquiryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InquiryStateCopyWith<_InquiryState> get copyWith => __$InquiryStateCopyWithImpl<_InquiryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InquiryState&&const DeepCollectionEquality().equals(other._inquiries, _inquiries)&&(identical(other.selectedTitle, selectedTitle) || other.selectedTitle == selectedTitle)&&(identical(other.selectedContent, selectedContent) || other.selectedContent == selectedContent)&&(identical(other.email, email) || other.email == email)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inquiries),selectedTitle,selectedContent,email,title,content,error);

@override
String toString() {
  return 'InquiryState(inquiries: $inquiries, selectedTitle: $selectedTitle, selectedContent: $selectedContent, email: $email, title: $title, content: $content, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InquiryStateCopyWith<$Res> implements $InquiryStateCopyWith<$Res> {
  factory _$InquiryStateCopyWith(_InquiryState value, $Res Function(_InquiryState) _then) = __$InquiryStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserInquiryEntity> inquiries, String? selectedTitle, String? selectedContent, String email, String title, String content, String? error
});




}
/// @nodoc
class __$InquiryStateCopyWithImpl<$Res>
    implements _$InquiryStateCopyWith<$Res> {
  __$InquiryStateCopyWithImpl(this._self, this._then);

  final _InquiryState _self;
  final $Res Function(_InquiryState) _then;

/// Create a copy of InquiryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inquiries = null,Object? selectedTitle = freezed,Object? selectedContent = freezed,Object? email = null,Object? title = null,Object? content = null,Object? error = freezed,}) {
  return _then(_InquiryState(
inquiries: null == inquiries ? _self._inquiries : inquiries // ignore: cast_nullable_to_non_nullable
as List<UserInquiryEntity>,selectedTitle: freezed == selectedTitle ? _self.selectedTitle : selectedTitle // ignore: cast_nullable_to_non_nullable
as String?,selectedContent: freezed == selectedContent ? _self.selectedContent : selectedContent // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
