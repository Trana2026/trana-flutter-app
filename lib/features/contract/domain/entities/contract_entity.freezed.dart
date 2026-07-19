// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractEntity {

 String get publicCode; ContractStatus get status; String? get title; int? get price; bool get isCreator; Role? get myRole; int get attachmentCount; String? get firstAttachmentUrl; DateTime get updatedAt; bool? get cancelIsMine;// 취소 요청건의 요청 당사자 여부
 bool? get reportIsMine;
/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractEntityCopyWith<ContractEntity> get copyWith => _$ContractEntityCopyWithImpl<ContractEntity>(this as ContractEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.isCreator, isCreator) || other.isCreator == isCreator)&&(identical(other.myRole, myRole) || other.myRole == myRole)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount)&&(identical(other.firstAttachmentUrl, firstAttachmentUrl) || other.firstAttachmentUrl == firstAttachmentUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.cancelIsMine, cancelIsMine) || other.cancelIsMine == cancelIsMine)&&(identical(other.reportIsMine, reportIsMine) || other.reportIsMine == reportIsMine));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,title,price,isCreator,myRole,attachmentCount,firstAttachmentUrl,updatedAt,cancelIsMine,reportIsMine);

@override
String toString() {
  return 'ContractEntity(publicCode: $publicCode, status: $status, title: $title, price: $price, isCreator: $isCreator, myRole: $myRole, attachmentCount: $attachmentCount, firstAttachmentUrl: $firstAttachmentUrl, updatedAt: $updatedAt, cancelIsMine: $cancelIsMine, reportIsMine: $reportIsMine)';
}


}

/// @nodoc
abstract mixin class $ContractEntityCopyWith<$Res>  {
  factory $ContractEntityCopyWith(ContractEntity value, $Res Function(ContractEntity) _then) = _$ContractEntityCopyWithImpl;
@useResult
$Res call({
 String publicCode, ContractStatus status, String? title, int? price, bool isCreator, Role? myRole, int attachmentCount, String? firstAttachmentUrl, DateTime updatedAt, bool? cancelIsMine, bool? reportIsMine
});




}
/// @nodoc
class _$ContractEntityCopyWithImpl<$Res>
    implements $ContractEntityCopyWith<$Res> {
  _$ContractEntityCopyWithImpl(this._self, this._then);

  final ContractEntity _self;
  final $Res Function(ContractEntity) _then;

/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,Object? status = null,Object? title = freezed,Object? price = freezed,Object? isCreator = null,Object? myRole = freezed,Object? attachmentCount = null,Object? firstAttachmentUrl = freezed,Object? updatedAt = null,Object? cancelIsMine = freezed,Object? reportIsMine = freezed,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,isCreator: null == isCreator ? _self.isCreator : isCreator // ignore: cast_nullable_to_non_nullable
as bool,myRole: freezed == myRole ? _self.myRole : myRole // ignore: cast_nullable_to_non_nullable
as Role?,attachmentCount: null == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int,firstAttachmentUrl: freezed == firstAttachmentUrl ? _self.firstAttachmentUrl : firstAttachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cancelIsMine: freezed == cancelIsMine ? _self.cancelIsMine : cancelIsMine // ignore: cast_nullable_to_non_nullable
as bool?,reportIsMine: freezed == reportIsMine ? _self.reportIsMine : reportIsMine // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractEntity].
extension ContractEntityPatterns on ContractEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  String? title,  int? price,  bool isCreator,  Role? myRole,  int attachmentCount,  String? firstAttachmentUrl,  DateTime updatedAt,  bool? cancelIsMine,  bool? reportIsMine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.title,_that.price,_that.isCreator,_that.myRole,_that.attachmentCount,_that.firstAttachmentUrl,_that.updatedAt,_that.cancelIsMine,_that.reportIsMine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode,  ContractStatus status,  String? title,  int? price,  bool isCreator,  Role? myRole,  int attachmentCount,  String? firstAttachmentUrl,  DateTime updatedAt,  bool? cancelIsMine,  bool? reportIsMine)  $default,) {final _that = this;
switch (_that) {
case _ContractEntity():
return $default(_that.publicCode,_that.status,_that.title,_that.price,_that.isCreator,_that.myRole,_that.attachmentCount,_that.firstAttachmentUrl,_that.updatedAt,_that.cancelIsMine,_that.reportIsMine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode,  ContractStatus status,  String? title,  int? price,  bool isCreator,  Role? myRole,  int attachmentCount,  String? firstAttachmentUrl,  DateTime updatedAt,  bool? cancelIsMine,  bool? reportIsMine)?  $default,) {final _that = this;
switch (_that) {
case _ContractEntity() when $default != null:
return $default(_that.publicCode,_that.status,_that.title,_that.price,_that.isCreator,_that.myRole,_that.attachmentCount,_that.firstAttachmentUrl,_that.updatedAt,_that.cancelIsMine,_that.reportIsMine);case _:
  return null;

}
}

}

/// @nodoc


class _ContractEntity implements ContractEntity {
  const _ContractEntity({required this.publicCode, required this.status, this.title, this.price, required this.isCreator, this.myRole, required this.attachmentCount, this.firstAttachmentUrl, required this.updatedAt, this.cancelIsMine, this.reportIsMine});
  

@override final  String publicCode;
@override final  ContractStatus status;
@override final  String? title;
@override final  int? price;
@override final  bool isCreator;
@override final  Role? myRole;
@override final  int attachmentCount;
@override final  String? firstAttachmentUrl;
@override final  DateTime updatedAt;
@override final  bool? cancelIsMine;
// 취소 요청건의 요청 당사자 여부
@override final  bool? reportIsMine;

/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractEntityCopyWith<_ContractEntity> get copyWith => __$ContractEntityCopyWithImpl<_ContractEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractEntity&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.isCreator, isCreator) || other.isCreator == isCreator)&&(identical(other.myRole, myRole) || other.myRole == myRole)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount)&&(identical(other.firstAttachmentUrl, firstAttachmentUrl) || other.firstAttachmentUrl == firstAttachmentUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.cancelIsMine, cancelIsMine) || other.cancelIsMine == cancelIsMine)&&(identical(other.reportIsMine, reportIsMine) || other.reportIsMine == reportIsMine));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,status,title,price,isCreator,myRole,attachmentCount,firstAttachmentUrl,updatedAt,cancelIsMine,reportIsMine);

@override
String toString() {
  return 'ContractEntity(publicCode: $publicCode, status: $status, title: $title, price: $price, isCreator: $isCreator, myRole: $myRole, attachmentCount: $attachmentCount, firstAttachmentUrl: $firstAttachmentUrl, updatedAt: $updatedAt, cancelIsMine: $cancelIsMine, reportIsMine: $reportIsMine)';
}


}

/// @nodoc
abstract mixin class _$ContractEntityCopyWith<$Res> implements $ContractEntityCopyWith<$Res> {
  factory _$ContractEntityCopyWith(_ContractEntity value, $Res Function(_ContractEntity) _then) = __$ContractEntityCopyWithImpl;
@override @useResult
$Res call({
 String publicCode, ContractStatus status, String? title, int? price, bool isCreator, Role? myRole, int attachmentCount, String? firstAttachmentUrl, DateTime updatedAt, bool? cancelIsMine, bool? reportIsMine
});




}
/// @nodoc
class __$ContractEntityCopyWithImpl<$Res>
    implements _$ContractEntityCopyWith<$Res> {
  __$ContractEntityCopyWithImpl(this._self, this._then);

  final _ContractEntity _self;
  final $Res Function(_ContractEntity) _then;

/// Create a copy of ContractEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,Object? status = null,Object? title = freezed,Object? price = freezed,Object? isCreator = null,Object? myRole = freezed,Object? attachmentCount = null,Object? firstAttachmentUrl = freezed,Object? updatedAt = null,Object? cancelIsMine = freezed,Object? reportIsMine = freezed,}) {
  return _then(_ContractEntity(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,isCreator: null == isCreator ? _self.isCreator : isCreator // ignore: cast_nullable_to_non_nullable
as bool,myRole: freezed == myRole ? _self.myRole : myRole // ignore: cast_nullable_to_non_nullable
as Role?,attachmentCount: null == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int,firstAttachmentUrl: freezed == firstAttachmentUrl ? _self.firstAttachmentUrl : firstAttachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,cancelIsMine: freezed == cancelIsMine ? _self.cancelIsMine : cancelIsMine // ignore: cast_nullable_to_non_nullable
as bool?,reportIsMine: freezed == reportIsMine ? _self.reportIsMine : reportIsMine // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
