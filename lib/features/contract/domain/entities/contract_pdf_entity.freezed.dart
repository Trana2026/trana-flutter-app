// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_pdf_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractPdfEntity {

 String get downloadUrl; int get expiresInSeconds; String get sha256;
/// Create a copy of ContractPdfEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractPdfEntityCopyWith<ContractPdfEntity> get copyWith => _$ContractPdfEntityCopyWithImpl<ContractPdfEntity>(this as ContractPdfEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractPdfEntity&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.sha256, sha256) || other.sha256 == sha256));
}


@override
int get hashCode => Object.hash(runtimeType,downloadUrl,expiresInSeconds,sha256);

@override
String toString() {
  return 'ContractPdfEntity(downloadUrl: $downloadUrl, expiresInSeconds: $expiresInSeconds, sha256: $sha256)';
}


}

/// @nodoc
abstract mixin class $ContractPdfEntityCopyWith<$Res>  {
  factory $ContractPdfEntityCopyWith(ContractPdfEntity value, $Res Function(ContractPdfEntity) _then) = _$ContractPdfEntityCopyWithImpl;
@useResult
$Res call({
 String downloadUrl, int expiresInSeconds, String sha256
});




}
/// @nodoc
class _$ContractPdfEntityCopyWithImpl<$Res>
    implements $ContractPdfEntityCopyWith<$Res> {
  _$ContractPdfEntityCopyWithImpl(this._self, this._then);

  final ContractPdfEntity _self;
  final $Res Function(ContractPdfEntity) _then;

/// Create a copy of ContractPdfEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downloadUrl = null,Object? expiresInSeconds = null,Object? sha256 = null,}) {
  return _then(_self.copyWith(
downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractPdfEntity].
extension ContractPdfEntityPatterns on ContractPdfEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractPdfEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractPdfEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractPdfEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractPdfEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractPdfEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractPdfEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String downloadUrl,  int expiresInSeconds,  String sha256)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractPdfEntity() when $default != null:
return $default(_that.downloadUrl,_that.expiresInSeconds,_that.sha256);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String downloadUrl,  int expiresInSeconds,  String sha256)  $default,) {final _that = this;
switch (_that) {
case _ContractPdfEntity():
return $default(_that.downloadUrl,_that.expiresInSeconds,_that.sha256);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String downloadUrl,  int expiresInSeconds,  String sha256)?  $default,) {final _that = this;
switch (_that) {
case _ContractPdfEntity() when $default != null:
return $default(_that.downloadUrl,_that.expiresInSeconds,_that.sha256);case _:
  return null;

}
}

}

/// @nodoc


class _ContractPdfEntity implements ContractPdfEntity {
  const _ContractPdfEntity({required this.downloadUrl, required this.expiresInSeconds, required this.sha256});
  

@override final  String downloadUrl;
@override final  int expiresInSeconds;
@override final  String sha256;

/// Create a copy of ContractPdfEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractPdfEntityCopyWith<_ContractPdfEntity> get copyWith => __$ContractPdfEntityCopyWithImpl<_ContractPdfEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractPdfEntity&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.sha256, sha256) || other.sha256 == sha256));
}


@override
int get hashCode => Object.hash(runtimeType,downloadUrl,expiresInSeconds,sha256);

@override
String toString() {
  return 'ContractPdfEntity(downloadUrl: $downloadUrl, expiresInSeconds: $expiresInSeconds, sha256: $sha256)';
}


}

/// @nodoc
abstract mixin class _$ContractPdfEntityCopyWith<$Res> implements $ContractPdfEntityCopyWith<$Res> {
  factory _$ContractPdfEntityCopyWith(_ContractPdfEntity value, $Res Function(_ContractPdfEntity) _then) = __$ContractPdfEntityCopyWithImpl;
@override @useResult
$Res call({
 String downloadUrl, int expiresInSeconds, String sha256
});




}
/// @nodoc
class __$ContractPdfEntityCopyWithImpl<$Res>
    implements _$ContractPdfEntityCopyWith<$Res> {
  __$ContractPdfEntityCopyWithImpl(this._self, this._then);

  final _ContractPdfEntity _self;
  final $Res Function(_ContractPdfEntity) _then;

/// Create a copy of ContractPdfEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downloadUrl = null,Object? expiresInSeconds = null,Object? sha256 = null,}) {
  return _then(_ContractPdfEntity(
downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
