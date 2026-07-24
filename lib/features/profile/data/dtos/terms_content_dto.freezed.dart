// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TermsContentDto {

 int get id; String get type; String get version; String get title; String get contentHash; String get content; String get effectiveAt;
/// Create a copy of TermsContentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsContentDtoCopyWith<TermsContentDto> get copyWith => _$TermsContentDtoCopyWithImpl<TermsContentDto>(this as TermsContentDto, _$identity);

  /// Serializes this TermsContentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsContentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentHash, contentHash) || other.contentHash == contentHash)&&(identical(other.content, content) || other.content == content)&&(identical(other.effectiveAt, effectiveAt) || other.effectiveAt == effectiveAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,version,title,contentHash,content,effectiveAt);

@override
String toString() {
  return 'TermsContentDto(id: $id, type: $type, version: $version, title: $title, contentHash: $contentHash, content: $content, effectiveAt: $effectiveAt)';
}


}

/// @nodoc
abstract mixin class $TermsContentDtoCopyWith<$Res>  {
  factory $TermsContentDtoCopyWith(TermsContentDto value, $Res Function(TermsContentDto) _then) = _$TermsContentDtoCopyWithImpl;
@useResult
$Res call({
 int id, String type, String version, String title, String contentHash, String content, String effectiveAt
});




}
/// @nodoc
class _$TermsContentDtoCopyWithImpl<$Res>
    implements $TermsContentDtoCopyWith<$Res> {
  _$TermsContentDtoCopyWithImpl(this._self, this._then);

  final TermsContentDto _self;
  final $Res Function(TermsContentDto) _then;

/// Create a copy of TermsContentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? version = null,Object? title = null,Object? contentHash = null,Object? content = null,Object? effectiveAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentHash: null == contentHash ? _self.contentHash : contentHash // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,effectiveAt: null == effectiveAt ? _self.effectiveAt : effectiveAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsContentDto].
extension TermsContentDtoPatterns on TermsContentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsContentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsContentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsContentDto value)  $default,){
final _that = this;
switch (_that) {
case _TermsContentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsContentDto value)?  $default,){
final _that = this;
switch (_that) {
case _TermsContentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String type,  String version,  String title,  String contentHash,  String content,  String effectiveAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsContentDto() when $default != null:
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentHash,_that.content,_that.effectiveAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String type,  String version,  String title,  String contentHash,  String content,  String effectiveAt)  $default,) {final _that = this;
switch (_that) {
case _TermsContentDto():
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentHash,_that.content,_that.effectiveAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String type,  String version,  String title,  String contentHash,  String content,  String effectiveAt)?  $default,) {final _that = this;
switch (_that) {
case _TermsContentDto() when $default != null:
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentHash,_that.content,_that.effectiveAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TermsContentDto implements TermsContentDto {
  const _TermsContentDto({required this.id, required this.type, required this.version, required this.title, required this.contentHash, required this.content, required this.effectiveAt});
  factory _TermsContentDto.fromJson(Map<String, dynamic> json) => _$TermsContentDtoFromJson(json);

@override final  int id;
@override final  String type;
@override final  String version;
@override final  String title;
@override final  String contentHash;
@override final  String content;
@override final  String effectiveAt;

/// Create a copy of TermsContentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsContentDtoCopyWith<_TermsContentDto> get copyWith => __$TermsContentDtoCopyWithImpl<_TermsContentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TermsContentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsContentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentHash, contentHash) || other.contentHash == contentHash)&&(identical(other.content, content) || other.content == content)&&(identical(other.effectiveAt, effectiveAt) || other.effectiveAt == effectiveAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,version,title,contentHash,content,effectiveAt);

@override
String toString() {
  return 'TermsContentDto(id: $id, type: $type, version: $version, title: $title, contentHash: $contentHash, content: $content, effectiveAt: $effectiveAt)';
}


}

/// @nodoc
abstract mixin class _$TermsContentDtoCopyWith<$Res> implements $TermsContentDtoCopyWith<$Res> {
  factory _$TermsContentDtoCopyWith(_TermsContentDto value, $Res Function(_TermsContentDto) _then) = __$TermsContentDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String type, String version, String title, String contentHash, String content, String effectiveAt
});




}
/// @nodoc
class __$TermsContentDtoCopyWithImpl<$Res>
    implements _$TermsContentDtoCopyWith<$Res> {
  __$TermsContentDtoCopyWithImpl(this._self, this._then);

  final _TermsContentDto _self;
  final $Res Function(_TermsContentDto) _then;

/// Create a copy of TermsContentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? version = null,Object? title = null,Object? contentHash = null,Object? content = null,Object? effectiveAt = null,}) {
  return _then(_TermsContentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentHash: null == contentHash ? _self.contentHash : contentHash // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,effectiveAt: null == effectiveAt ? _self.effectiveAt : effectiveAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
