// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modify_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModifyContractState {

 String? get publicCode; ConsentType? get consentType; DeliveryType get deliveryType; Role? get role; List<int> get attachmentIds; List<String> get existingAttachmentUrls; List<AssetEntity> get selectedImages; String get tradingPlatform; String get title; int get price; String get conditionSummary; String get conditionDetails; bool get warranted; Uint8List? get pdfBytes; bool get isLoading; String? get error;
/// Create a copy of ModifyContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModifyContractStateCopyWith<ModifyContractState> get copyWith => _$ModifyContractStateCopyWithImpl<ModifyContractState>(this as ModifyContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModifyContractState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.attachmentIds, attachmentIds)&&const DeepCollectionEquality().equals(other.existingAttachmentUrls, existingAttachmentUrls)&&const DeepCollectionEquality().equals(other.selectedImages, selectedImages)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warranted, warranted) || other.warranted == warranted)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,consentType,deliveryType,role,const DeepCollectionEquality().hash(attachmentIds),const DeepCollectionEquality().hash(existingAttachmentUrls),const DeepCollectionEquality().hash(selectedImages),tradingPlatform,title,price,conditionSummary,conditionDetails,warranted,const DeepCollectionEquality().hash(pdfBytes),isLoading,error);

@override
String toString() {
  return 'ModifyContractState(publicCode: $publicCode, consentType: $consentType, deliveryType: $deliveryType, role: $role, attachmentIds: $attachmentIds, existingAttachmentUrls: $existingAttachmentUrls, selectedImages: $selectedImages, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warranted: $warranted, pdfBytes: $pdfBytes, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ModifyContractStateCopyWith<$Res>  {
  factory $ModifyContractStateCopyWith(ModifyContractState value, $Res Function(ModifyContractState) _then) = _$ModifyContractStateCopyWithImpl;
@useResult
$Res call({
 String? publicCode, ConsentType? consentType, DeliveryType deliveryType, Role? role, List<int> attachmentIds, List<String> existingAttachmentUrls, List<AssetEntity> selectedImages, String tradingPlatform, String title, int price, String conditionSummary, String conditionDetails, bool warranted, Uint8List? pdfBytes, bool isLoading, String? error
});




}
/// @nodoc
class _$ModifyContractStateCopyWithImpl<$Res>
    implements $ModifyContractStateCopyWith<$Res> {
  _$ModifyContractStateCopyWithImpl(this._self, this._then);

  final ModifyContractState _self;
  final $Res Function(ModifyContractState) _then;

/// Create a copy of ModifyContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = freezed,Object? consentType = freezed,Object? deliveryType = null,Object? role = freezed,Object? attachmentIds = null,Object? existingAttachmentUrls = null,Object? selectedImages = null,Object? tradingPlatform = null,Object? title = null,Object? price = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? warranted = null,Object? pdfBytes = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as ConsentType?,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,attachmentIds: null == attachmentIds ? _self.attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<int>,existingAttachmentUrls: null == existingAttachmentUrls ? _self.existingAttachmentUrls : existingAttachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,selectedImages: null == selectedImages ? _self.selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,tradingPlatform: null == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,warranted: null == warranted ? _self.warranted : warranted // ignore: cast_nullable_to_non_nullable
as bool,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModifyContractState].
extension ModifyContractStatePatterns on ModifyContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModifyContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModifyContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModifyContractState value)  $default,){
final _that = this;
switch (_that) {
case _ModifyContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModifyContractState value)?  $default,){
final _that = this;
switch (_that) {
case _ModifyContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? publicCode,  ConsentType? consentType,  DeliveryType deliveryType,  Role? role,  List<int> attachmentIds,  List<String> existingAttachmentUrls,  List<AssetEntity> selectedImages,  String tradingPlatform,  String title,  int price,  String conditionSummary,  String conditionDetails,  bool warranted,  Uint8List? pdfBytes,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModifyContractState() when $default != null:
return $default(_that.publicCode,_that.consentType,_that.deliveryType,_that.role,_that.attachmentIds,_that.existingAttachmentUrls,_that.selectedImages,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warranted,_that.pdfBytes,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? publicCode,  ConsentType? consentType,  DeliveryType deliveryType,  Role? role,  List<int> attachmentIds,  List<String> existingAttachmentUrls,  List<AssetEntity> selectedImages,  String tradingPlatform,  String title,  int price,  String conditionSummary,  String conditionDetails,  bool warranted,  Uint8List? pdfBytes,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ModifyContractState():
return $default(_that.publicCode,_that.consentType,_that.deliveryType,_that.role,_that.attachmentIds,_that.existingAttachmentUrls,_that.selectedImages,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warranted,_that.pdfBytes,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? publicCode,  ConsentType? consentType,  DeliveryType deliveryType,  Role? role,  List<int> attachmentIds,  List<String> existingAttachmentUrls,  List<AssetEntity> selectedImages,  String tradingPlatform,  String title,  int price,  String conditionSummary,  String conditionDetails,  bool warranted,  Uint8List? pdfBytes,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ModifyContractState() when $default != null:
return $default(_that.publicCode,_that.consentType,_that.deliveryType,_that.role,_that.attachmentIds,_that.existingAttachmentUrls,_that.selectedImages,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warranted,_that.pdfBytes,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ModifyContractState implements ModifyContractState {
  const _ModifyContractState({this.publicCode, this.consentType, this.deliveryType = DeliveryType.shipping, this.role, final  List<int> attachmentIds = const [], final  List<String> existingAttachmentUrls = const [], final  List<AssetEntity> selectedImages = const [], this.tradingPlatform = '', this.title = '', this.price = 0, this.conditionSummary = '', this.conditionDetails = '', this.warranted = false, this.pdfBytes, this.isLoading = false, this.error}): _attachmentIds = attachmentIds,_existingAttachmentUrls = existingAttachmentUrls,_selectedImages = selectedImages;
  

@override final  String? publicCode;
@override final  ConsentType? consentType;
@override@JsonKey() final  DeliveryType deliveryType;
@override final  Role? role;
 final  List<int> _attachmentIds;
@override@JsonKey() List<int> get attachmentIds {
  if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentIds);
}

 final  List<String> _existingAttachmentUrls;
@override@JsonKey() List<String> get existingAttachmentUrls {
  if (_existingAttachmentUrls is EqualUnmodifiableListView) return _existingAttachmentUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_existingAttachmentUrls);
}

 final  List<AssetEntity> _selectedImages;
@override@JsonKey() List<AssetEntity> get selectedImages {
  if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImages);
}

@override@JsonKey() final  String tradingPlatform;
@override@JsonKey() final  String title;
@override@JsonKey() final  int price;
@override@JsonKey() final  String conditionSummary;
@override@JsonKey() final  String conditionDetails;
@override@JsonKey() final  bool warranted;
@override final  Uint8List? pdfBytes;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ModifyContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModifyContractStateCopyWith<_ModifyContractState> get copyWith => __$ModifyContractStateCopyWithImpl<_ModifyContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModifyContractState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.consentType, consentType) || other.consentType == consentType)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._attachmentIds, _attachmentIds)&&const DeepCollectionEquality().equals(other._existingAttachmentUrls, _existingAttachmentUrls)&&const DeepCollectionEquality().equals(other._selectedImages, _selectedImages)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warranted, warranted) || other.warranted == warranted)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,consentType,deliveryType,role,const DeepCollectionEquality().hash(_attachmentIds),const DeepCollectionEquality().hash(_existingAttachmentUrls),const DeepCollectionEquality().hash(_selectedImages),tradingPlatform,title,price,conditionSummary,conditionDetails,warranted,const DeepCollectionEquality().hash(pdfBytes),isLoading,error);

@override
String toString() {
  return 'ModifyContractState(publicCode: $publicCode, consentType: $consentType, deliveryType: $deliveryType, role: $role, attachmentIds: $attachmentIds, existingAttachmentUrls: $existingAttachmentUrls, selectedImages: $selectedImages, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warranted: $warranted, pdfBytes: $pdfBytes, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ModifyContractStateCopyWith<$Res> implements $ModifyContractStateCopyWith<$Res> {
  factory _$ModifyContractStateCopyWith(_ModifyContractState value, $Res Function(_ModifyContractState) _then) = __$ModifyContractStateCopyWithImpl;
@override @useResult
$Res call({
 String? publicCode, ConsentType? consentType, DeliveryType deliveryType, Role? role, List<int> attachmentIds, List<String> existingAttachmentUrls, List<AssetEntity> selectedImages, String tradingPlatform, String title, int price, String conditionSummary, String conditionDetails, bool warranted, Uint8List? pdfBytes, bool isLoading, String? error
});




}
/// @nodoc
class __$ModifyContractStateCopyWithImpl<$Res>
    implements _$ModifyContractStateCopyWith<$Res> {
  __$ModifyContractStateCopyWithImpl(this._self, this._then);

  final _ModifyContractState _self;
  final $Res Function(_ModifyContractState) _then;

/// Create a copy of ModifyContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = freezed,Object? consentType = freezed,Object? deliveryType = null,Object? role = freezed,Object? attachmentIds = null,Object? existingAttachmentUrls = null,Object? selectedImages = null,Object? tradingPlatform = null,Object? title = null,Object? price = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? warranted = null,Object? pdfBytes = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ModifyContractState(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,consentType: freezed == consentType ? _self.consentType : consentType // ignore: cast_nullable_to_non_nullable
as ConsentType?,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,attachmentIds: null == attachmentIds ? _self._attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<int>,existingAttachmentUrls: null == existingAttachmentUrls ? _self._existingAttachmentUrls : existingAttachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,selectedImages: null == selectedImages ? _self._selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,tradingPlatform: null == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,warranted: null == warranted ? _self.warranted : warranted // ignore: cast_nullable_to_non_nullable
as bool,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
