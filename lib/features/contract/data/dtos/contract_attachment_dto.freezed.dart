// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractAttachmentDto {

 int get id; String get s3Key; String get originalFilename; String get contentType; int get sizeBytes; String get sha256; int get sortOrder; DateTime get uploadedAt; String? get viewUrl;
/// Create a copy of ContractAttachmentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractAttachmentDtoCopyWith<ContractAttachmentDto> get copyWith => _$ContractAttachmentDtoCopyWithImpl<ContractAttachmentDto>(this as ContractAttachmentDto, _$identity);

  /// Serializes this ContractAttachmentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractAttachmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.originalFilename, originalFilename) || other.originalFilename == originalFilename)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.viewUrl, viewUrl) || other.viewUrl == viewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,s3Key,originalFilename,contentType,sizeBytes,sha256,sortOrder,uploadedAt,viewUrl);

@override
String toString() {
  return 'ContractAttachmentDto(id: $id, s3Key: $s3Key, originalFilename: $originalFilename, contentType: $contentType, sizeBytes: $sizeBytes, sha256: $sha256, sortOrder: $sortOrder, uploadedAt: $uploadedAt, viewUrl: $viewUrl)';
}


}

/// @nodoc
abstract mixin class $ContractAttachmentDtoCopyWith<$Res>  {
  factory $ContractAttachmentDtoCopyWith(ContractAttachmentDto value, $Res Function(ContractAttachmentDto) _then) = _$ContractAttachmentDtoCopyWithImpl;
@useResult
$Res call({
 int id, String s3Key, String originalFilename, String contentType, int sizeBytes, String sha256, int sortOrder, DateTime uploadedAt, String? viewUrl
});




}
/// @nodoc
class _$ContractAttachmentDtoCopyWithImpl<$Res>
    implements $ContractAttachmentDtoCopyWith<$Res> {
  _$ContractAttachmentDtoCopyWithImpl(this._self, this._then);

  final ContractAttachmentDto _self;
  final $Res Function(ContractAttachmentDto) _then;

/// Create a copy of ContractAttachmentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? s3Key = null,Object? originalFilename = null,Object? contentType = null,Object? sizeBytes = null,Object? sha256 = null,Object? sortOrder = null,Object? uploadedAt = null,Object? viewUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,originalFilename: null == originalFilename ? _self.originalFilename : originalFilename // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,viewUrl: freezed == viewUrl ? _self.viewUrl : viewUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractAttachmentDto].
extension ContractAttachmentDtoPatterns on ContractAttachmentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractAttachmentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractAttachmentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractAttachmentDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractAttachmentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractAttachmentDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractAttachmentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String s3Key,  String originalFilename,  String contentType,  int sizeBytes,  String sha256,  int sortOrder,  DateTime uploadedAt,  String? viewUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractAttachmentDto() when $default != null:
return $default(_that.id,_that.s3Key,_that.originalFilename,_that.contentType,_that.sizeBytes,_that.sha256,_that.sortOrder,_that.uploadedAt,_that.viewUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String s3Key,  String originalFilename,  String contentType,  int sizeBytes,  String sha256,  int sortOrder,  DateTime uploadedAt,  String? viewUrl)  $default,) {final _that = this;
switch (_that) {
case _ContractAttachmentDto():
return $default(_that.id,_that.s3Key,_that.originalFilename,_that.contentType,_that.sizeBytes,_that.sha256,_that.sortOrder,_that.uploadedAt,_that.viewUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String s3Key,  String originalFilename,  String contentType,  int sizeBytes,  String sha256,  int sortOrder,  DateTime uploadedAt,  String? viewUrl)?  $default,) {final _that = this;
switch (_that) {
case _ContractAttachmentDto() when $default != null:
return $default(_that.id,_that.s3Key,_that.originalFilename,_that.contentType,_that.sizeBytes,_that.sha256,_that.sortOrder,_that.uploadedAt,_that.viewUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractAttachmentDto implements ContractAttachmentDto {
  const _ContractAttachmentDto({required this.id, required this.s3Key, required this.originalFilename, required this.contentType, required this.sizeBytes, required this.sha256, required this.sortOrder, required this.uploadedAt, this.viewUrl});
  factory _ContractAttachmentDto.fromJson(Map<String, dynamic> json) => _$ContractAttachmentDtoFromJson(json);

@override final  int id;
@override final  String s3Key;
@override final  String originalFilename;
@override final  String contentType;
@override final  int sizeBytes;
@override final  String sha256;
@override final  int sortOrder;
@override final  DateTime uploadedAt;
@override final  String? viewUrl;

/// Create a copy of ContractAttachmentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractAttachmentDtoCopyWith<_ContractAttachmentDto> get copyWith => __$ContractAttachmentDtoCopyWithImpl<_ContractAttachmentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractAttachmentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractAttachmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.s3Key, s3Key) || other.s3Key == s3Key)&&(identical(other.originalFilename, originalFilename) || other.originalFilename == originalFilename)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.viewUrl, viewUrl) || other.viewUrl == viewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,s3Key,originalFilename,contentType,sizeBytes,sha256,sortOrder,uploadedAt,viewUrl);

@override
String toString() {
  return 'ContractAttachmentDto(id: $id, s3Key: $s3Key, originalFilename: $originalFilename, contentType: $contentType, sizeBytes: $sizeBytes, sha256: $sha256, sortOrder: $sortOrder, uploadedAt: $uploadedAt, viewUrl: $viewUrl)';
}


}

/// @nodoc
abstract mixin class _$ContractAttachmentDtoCopyWith<$Res> implements $ContractAttachmentDtoCopyWith<$Res> {
  factory _$ContractAttachmentDtoCopyWith(_ContractAttachmentDto value, $Res Function(_ContractAttachmentDto) _then) = __$ContractAttachmentDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String s3Key, String originalFilename, String contentType, int sizeBytes, String sha256, int sortOrder, DateTime uploadedAt, String? viewUrl
});




}
/// @nodoc
class __$ContractAttachmentDtoCopyWithImpl<$Res>
    implements _$ContractAttachmentDtoCopyWith<$Res> {
  __$ContractAttachmentDtoCopyWithImpl(this._self, this._then);

  final _ContractAttachmentDto _self;
  final $Res Function(_ContractAttachmentDto) _then;

/// Create a copy of ContractAttachmentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? s3Key = null,Object? originalFilename = null,Object? contentType = null,Object? sizeBytes = null,Object? sha256 = null,Object? sortOrder = null,Object? uploadedAt = null,Object? viewUrl = freezed,}) {
  return _then(_ContractAttachmentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,s3Key: null == s3Key ? _self.s3Key : s3Key // ignore: cast_nullable_to_non_nullable
as String,originalFilename: null == originalFilename ? _self.originalFilename : originalFilename // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,viewUrl: freezed == viewUrl ? _self.viewUrl : viewUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
