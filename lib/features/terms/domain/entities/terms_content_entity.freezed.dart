// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_content_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsContentEntity {

 int get id; TermsType get type; String get version; String get title; String get contentHash; String get content; DateTime get effectiveAt;
/// Create a copy of TermsContentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsContentEntityCopyWith<TermsContentEntity> get copyWith => _$TermsContentEntityCopyWithImpl<TermsContentEntity>(this as TermsContentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsContentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentHash, contentHash) || other.contentHash == contentHash)&&(identical(other.content, content) || other.content == content)&&(identical(other.effectiveAt, effectiveAt) || other.effectiveAt == effectiveAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,version,title,contentHash,content,effectiveAt);

@override
String toString() {
  return 'TermsContentEntity(id: $id, type: $type, version: $version, title: $title, contentHash: $contentHash, content: $content, effectiveAt: $effectiveAt)';
}


}

/// @nodoc
abstract mixin class $TermsContentEntityCopyWith<$Res>  {
  factory $TermsContentEntityCopyWith(TermsContentEntity value, $Res Function(TermsContentEntity) _then) = _$TermsContentEntityCopyWithImpl;
@useResult
$Res call({
 int id, TermsType type, String version, String title, String contentHash, String content, DateTime effectiveAt
});




}
/// @nodoc
class _$TermsContentEntityCopyWithImpl<$Res>
    implements $TermsContentEntityCopyWith<$Res> {
  _$TermsContentEntityCopyWithImpl(this._self, this._then);

  final TermsContentEntity _self;
  final $Res Function(TermsContentEntity) _then;

/// Create a copy of TermsContentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? version = null,Object? title = null,Object? contentHash = null,Object? content = null,Object? effectiveAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TermsType,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentHash: null == contentHash ? _self.contentHash : contentHash // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,effectiveAt: null == effectiveAt ? _self.effectiveAt : effectiveAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsContentEntity].
extension TermsContentEntityPatterns on TermsContentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsContentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsContentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsContentEntity value)  $default,){
final _that = this;
switch (_that) {
case _TermsContentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsContentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TermsContentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TermsType type,  String version,  String title,  String contentHash,  String content,  DateTime effectiveAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsContentEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TermsType type,  String version,  String title,  String contentHash,  String content,  DateTime effectiveAt)  $default,) {final _that = this;
switch (_that) {
case _TermsContentEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TermsType type,  String version,  String title,  String contentHash,  String content,  DateTime effectiveAt)?  $default,) {final _that = this;
switch (_that) {
case _TermsContentEntity() when $default != null:
return $default(_that.id,_that.type,_that.version,_that.title,_that.contentHash,_that.content,_that.effectiveAt);case _:
  return null;

}
}

}

/// @nodoc


class _TermsContentEntity implements TermsContentEntity {
  const _TermsContentEntity({required this.id, required this.type, required this.version, required this.title, required this.contentHash, required this.content, required this.effectiveAt});
  

@override final  int id;
@override final  TermsType type;
@override final  String version;
@override final  String title;
@override final  String contentHash;
@override final  String content;
@override final  DateTime effectiveAt;

/// Create a copy of TermsContentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsContentEntityCopyWith<_TermsContentEntity> get copyWith => __$TermsContentEntityCopyWithImpl<_TermsContentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsContentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.contentHash, contentHash) || other.contentHash == contentHash)&&(identical(other.content, content) || other.content == content)&&(identical(other.effectiveAt, effectiveAt) || other.effectiveAt == effectiveAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,version,title,contentHash,content,effectiveAt);

@override
String toString() {
  return 'TermsContentEntity(id: $id, type: $type, version: $version, title: $title, contentHash: $contentHash, content: $content, effectiveAt: $effectiveAt)';
}


}

/// @nodoc
abstract mixin class _$TermsContentEntityCopyWith<$Res> implements $TermsContentEntityCopyWith<$Res> {
  factory _$TermsContentEntityCopyWith(_TermsContentEntity value, $Res Function(_TermsContentEntity) _then) = __$TermsContentEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, TermsType type, String version, String title, String contentHash, String content, DateTime effectiveAt
});




}
/// @nodoc
class __$TermsContentEntityCopyWithImpl<$Res>
    implements _$TermsContentEntityCopyWith<$Res> {
  __$TermsContentEntityCopyWithImpl(this._self, this._then);

  final _TermsContentEntity _self;
  final $Res Function(_TermsContentEntity) _then;

/// Create a copy of TermsContentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? version = null,Object? title = null,Object? contentHash = null,Object? content = null,Object? effectiveAt = null,}) {
  return _then(_TermsContentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TermsType,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contentHash: null == contentHash ? _self.contentHash : contentHash // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,effectiveAt: null == effectiveAt ? _self.effectiveAt : effectiveAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
