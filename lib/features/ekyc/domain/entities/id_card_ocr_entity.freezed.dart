// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_card_ocr_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdCardOcrEntity {

 String get requestId;// 이후 요청에 계속 전달, 절대 새로 생성 금지
 String get idType;// ID_CARD | DRIVER_LICENSE | ALIEN_REGISTRATION
 String get name; String get birthDate;// "1990-01-01"
 String get gender;
/// Create a copy of IdCardOcrEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdCardOcrEntityCopyWith<IdCardOcrEntity> get copyWith => _$IdCardOcrEntityCopyWithImpl<IdCardOcrEntity>(this as IdCardOcrEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdCardOcrEntity&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.name, name) || other.name == name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,idType,name,birthDate,gender);

@override
String toString() {
  return 'IdCardOcrEntity(requestId: $requestId, idType: $idType, name: $name, birthDate: $birthDate, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $IdCardOcrEntityCopyWith<$Res>  {
  factory $IdCardOcrEntityCopyWith(IdCardOcrEntity value, $Res Function(IdCardOcrEntity) _then) = _$IdCardOcrEntityCopyWithImpl;
@useResult
$Res call({
 String requestId, String idType, String name, String birthDate, String gender
});




}
/// @nodoc
class _$IdCardOcrEntityCopyWithImpl<$Res>
    implements $IdCardOcrEntityCopyWith<$Res> {
  _$IdCardOcrEntityCopyWithImpl(this._self, this._then);

  final IdCardOcrEntity _self;
  final $Res Function(IdCardOcrEntity) _then;

/// Create a copy of IdCardOcrEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? idType = null,Object? name = null,Object? birthDate = null,Object? gender = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IdCardOcrEntity].
extension IdCardOcrEntityPatterns on IdCardOcrEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdCardOcrEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdCardOcrEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdCardOcrEntity value)  $default,){
final _that = this;
switch (_that) {
case _IdCardOcrEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdCardOcrEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IdCardOcrEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String idType,  String name,  String birthDate,  String gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdCardOcrEntity() when $default != null:
return $default(_that.requestId,_that.idType,_that.name,_that.birthDate,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String idType,  String name,  String birthDate,  String gender)  $default,) {final _that = this;
switch (_that) {
case _IdCardOcrEntity():
return $default(_that.requestId,_that.idType,_that.name,_that.birthDate,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String idType,  String name,  String birthDate,  String gender)?  $default,) {final _that = this;
switch (_that) {
case _IdCardOcrEntity() when $default != null:
return $default(_that.requestId,_that.idType,_that.name,_that.birthDate,_that.gender);case _:
  return null;

}
}

}

/// @nodoc


class _IdCardOcrEntity implements IdCardOcrEntity {
  const _IdCardOcrEntity({required this.requestId, required this.idType, required this.name, required this.birthDate, required this.gender});
  

@override final  String requestId;
// 이후 요청에 계속 전달, 절대 새로 생성 금지
@override final  String idType;
// ID_CARD | DRIVER_LICENSE | ALIEN_REGISTRATION
@override final  String name;
@override final  String birthDate;
// "1990-01-01"
@override final  String gender;

/// Create a copy of IdCardOcrEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdCardOcrEntityCopyWith<_IdCardOcrEntity> get copyWith => __$IdCardOcrEntityCopyWithImpl<_IdCardOcrEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdCardOcrEntity&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.name, name) || other.name == name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,idType,name,birthDate,gender);

@override
String toString() {
  return 'IdCardOcrEntity(requestId: $requestId, idType: $idType, name: $name, birthDate: $birthDate, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$IdCardOcrEntityCopyWith<$Res> implements $IdCardOcrEntityCopyWith<$Res> {
  factory _$IdCardOcrEntityCopyWith(_IdCardOcrEntity value, $Res Function(_IdCardOcrEntity) _then) = __$IdCardOcrEntityCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String idType, String name, String birthDate, String gender
});




}
/// @nodoc
class __$IdCardOcrEntityCopyWithImpl<$Res>
    implements _$IdCardOcrEntityCopyWith<$Res> {
  __$IdCardOcrEntityCopyWithImpl(this._self, this._then);

  final _IdCardOcrEntity _self;
  final $Res Function(_IdCardOcrEntity) _then;

/// Create a copy of IdCardOcrEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? idType = null,Object? name = null,Object? birthDate = null,Object? gender = null,}) {
  return _then(_IdCardOcrEntity(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
