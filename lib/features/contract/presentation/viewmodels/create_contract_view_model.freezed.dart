// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateContractState {

 Role? get role;// 선택된 역할
 DeliveryType get deliveryType;// 선택된 거래 방식
 String? get publicCode;// 생성된 Draft 의 publicCode
 List<AssetEntity> get selectedImages;// 등록한 거래 사진 목록
 List<String> get existingAttachmentUrls;// 기존에 등록된 거래 사진 url (기존값 불러오기)
 List<int> get attachmentIds;// 업로드된 첨부파일 id 목록
 String get tradingPlatform;// 입력된 거래 플랫폼
 String get title;// 입력된 거래 물품명
 int get price;// 입력된 거래 금액
 String get conditionSummary;// 입력된 상품 상태
 String get conditionDetails;// 입력된 상품 상세 설명
 int get warrantyPeriodDays;// 선택된 보증 제공 여부 (0: 미제공, 3: 제공)
 Uint8List? get pdfBytes;// 생성된 Pdf 바이트
 bool get revisionRequested;// 수정 요청 상태일 때
 bool get isLoading; bool get isLoadingUpload;// 사진 업로드 로딩중 여부
 String? get error;
/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateContractStateCopyWith<CreateContractState> get copyWith => _$CreateContractStateCopyWithImpl<CreateContractState>(this as CreateContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractState&&(identical(other.role, role) || other.role == role)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&const DeepCollectionEquality().equals(other.selectedImages, selectedImages)&&const DeepCollectionEquality().equals(other.existingAttachmentUrls, existingAttachmentUrls)&&const DeepCollectionEquality().equals(other.attachmentIds, attachmentIds)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.revisionRequested, revisionRequested) || other.revisionRequested == revisionRequested)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingUpload, isLoadingUpload) || other.isLoadingUpload == isLoadingUpload)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,role,deliveryType,publicCode,const DeepCollectionEquality().hash(selectedImages),const DeepCollectionEquality().hash(existingAttachmentUrls),const DeepCollectionEquality().hash(attachmentIds),tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,const DeepCollectionEquality().hash(pdfBytes),revisionRequested,isLoading,isLoadingUpload,error);

@override
String toString() {
  return 'CreateContractState(role: $role, deliveryType: $deliveryType, publicCode: $publicCode, selectedImages: $selectedImages, existingAttachmentUrls: $existingAttachmentUrls, attachmentIds: $attachmentIds, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, pdfBytes: $pdfBytes, revisionRequested: $revisionRequested, isLoading: $isLoading, isLoadingUpload: $isLoadingUpload, error: $error)';
}


}

/// @nodoc
abstract mixin class $CreateContractStateCopyWith<$Res>  {
  factory $CreateContractStateCopyWith(CreateContractState value, $Res Function(CreateContractState) _then) = _$CreateContractStateCopyWithImpl;
@useResult
$Res call({
 Role? role, DeliveryType deliveryType, String? publicCode, List<AssetEntity> selectedImages, List<String> existingAttachmentUrls, List<int> attachmentIds, String tradingPlatform, String title, int price, String conditionSummary, String conditionDetails, int warrantyPeriodDays, Uint8List? pdfBytes, bool revisionRequested, bool isLoading, bool isLoadingUpload, String? error
});




}
/// @nodoc
class _$CreateContractStateCopyWithImpl<$Res>
    implements $CreateContractStateCopyWith<$Res> {
  _$CreateContractStateCopyWithImpl(this._self, this._then);

  final CreateContractState _self;
  final $Res Function(CreateContractState) _then;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = freezed,Object? deliveryType = null,Object? publicCode = freezed,Object? selectedImages = null,Object? existingAttachmentUrls = null,Object? attachmentIds = null,Object? tradingPlatform = null,Object? title = null,Object? price = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? warrantyPeriodDays = null,Object? pdfBytes = freezed,Object? revisionRequested = null,Object? isLoading = null,Object? isLoadingUpload = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,selectedImages: null == selectedImages ? _self.selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,existingAttachmentUrls: null == existingAttachmentUrls ? _self.existingAttachmentUrls : existingAttachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,attachmentIds: null == attachmentIds ? _self.attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<int>,tradingPlatform: null == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,revisionRequested: null == revisionRequested ? _self.revisionRequested : revisionRequested // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingUpload: null == isLoadingUpload ? _self.isLoadingUpload : isLoadingUpload // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateContractState].
extension CreateContractStatePatterns on CreateContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateContractState value)  $default,){
final _that = this;
switch (_that) {
case _CreateContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateContractState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Role? role,  DeliveryType deliveryType,  String? publicCode,  List<AssetEntity> selectedImages,  List<String> existingAttachmentUrls,  List<int> attachmentIds,  String tradingPlatform,  String title,  int price,  String conditionSummary,  String conditionDetails,  int warrantyPeriodDays,  Uint8List? pdfBytes,  bool revisionRequested,  bool isLoading,  bool isLoadingUpload,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.role,_that.deliveryType,_that.publicCode,_that.selectedImages,_that.existingAttachmentUrls,_that.attachmentIds,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.pdfBytes,_that.revisionRequested,_that.isLoading,_that.isLoadingUpload,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Role? role,  DeliveryType deliveryType,  String? publicCode,  List<AssetEntity> selectedImages,  List<String> existingAttachmentUrls,  List<int> attachmentIds,  String tradingPlatform,  String title,  int price,  String conditionSummary,  String conditionDetails,  int warrantyPeriodDays,  Uint8List? pdfBytes,  bool revisionRequested,  bool isLoading,  bool isLoadingUpload,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CreateContractState():
return $default(_that.role,_that.deliveryType,_that.publicCode,_that.selectedImages,_that.existingAttachmentUrls,_that.attachmentIds,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.pdfBytes,_that.revisionRequested,_that.isLoading,_that.isLoadingUpload,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Role? role,  DeliveryType deliveryType,  String? publicCode,  List<AssetEntity> selectedImages,  List<String> existingAttachmentUrls,  List<int> attachmentIds,  String tradingPlatform,  String title,  int price,  String conditionSummary,  String conditionDetails,  int warrantyPeriodDays,  Uint8List? pdfBytes,  bool revisionRequested,  bool isLoading,  bool isLoadingUpload,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.role,_that.deliveryType,_that.publicCode,_that.selectedImages,_that.existingAttachmentUrls,_that.attachmentIds,_that.tradingPlatform,_that.title,_that.price,_that.conditionSummary,_that.conditionDetails,_that.warrantyPeriodDays,_that.pdfBytes,_that.revisionRequested,_that.isLoading,_that.isLoadingUpload,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CreateContractState implements CreateContractState {
  const _CreateContractState({this.role, this.deliveryType = DeliveryType.shipping, this.publicCode, final  List<AssetEntity> selectedImages = const [], final  List<String> existingAttachmentUrls = const [], final  List<int> attachmentIds = const [], this.tradingPlatform = '', this.title = '', this.price = 0, this.conditionSummary = '', this.conditionDetails = '', this.warrantyPeriodDays = 0, this.pdfBytes, this.revisionRequested = false, this.isLoading = false, this.isLoadingUpload = false, this.error}): _selectedImages = selectedImages,_existingAttachmentUrls = existingAttachmentUrls,_attachmentIds = attachmentIds;
  

@override final  Role? role;
// 선택된 역할
@override@JsonKey() final  DeliveryType deliveryType;
// 선택된 거래 방식
@override final  String? publicCode;
// 생성된 Draft 의 publicCode
 final  List<AssetEntity> _selectedImages;
// 생성된 Draft 의 publicCode
@override@JsonKey() List<AssetEntity> get selectedImages {
  if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImages);
}

// 등록한 거래 사진 목록
 final  List<String> _existingAttachmentUrls;
// 등록한 거래 사진 목록
@override@JsonKey() List<String> get existingAttachmentUrls {
  if (_existingAttachmentUrls is EqualUnmodifiableListView) return _existingAttachmentUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_existingAttachmentUrls);
}

// 기존에 등록된 거래 사진 url (기존값 불러오기)
 final  List<int> _attachmentIds;
// 기존에 등록된 거래 사진 url (기존값 불러오기)
@override@JsonKey() List<int> get attachmentIds {
  if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentIds);
}

// 업로드된 첨부파일 id 목록
@override@JsonKey() final  String tradingPlatform;
// 입력된 거래 플랫폼
@override@JsonKey() final  String title;
// 입력된 거래 물품명
@override@JsonKey() final  int price;
// 입력된 거래 금액
@override@JsonKey() final  String conditionSummary;
// 입력된 상품 상태
@override@JsonKey() final  String conditionDetails;
// 입력된 상품 상세 설명
@override@JsonKey() final  int warrantyPeriodDays;
// 선택된 보증 제공 여부 (0: 미제공, 3: 제공)
@override final  Uint8List? pdfBytes;
// 생성된 Pdf 바이트
@override@JsonKey() final  bool revisionRequested;
// 수정 요청 상태일 때
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingUpload;
// 사진 업로드 로딩중 여부
@override final  String? error;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateContractStateCopyWith<_CreateContractState> get copyWith => __$CreateContractStateCopyWithImpl<_CreateContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateContractState&&(identical(other.role, role) || other.role == role)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&const DeepCollectionEquality().equals(other._selectedImages, _selectedImages)&&const DeepCollectionEquality().equals(other._existingAttachmentUrls, _existingAttachmentUrls)&&const DeepCollectionEquality().equals(other._attachmentIds, _attachmentIds)&&(identical(other.tradingPlatform, tradingPlatform) || other.tradingPlatform == tradingPlatform)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.conditionSummary, conditionSummary) || other.conditionSummary == conditionSummary)&&(identical(other.conditionDetails, conditionDetails) || other.conditionDetails == conditionDetails)&&(identical(other.warrantyPeriodDays, warrantyPeriodDays) || other.warrantyPeriodDays == warrantyPeriodDays)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.revisionRequested, revisionRequested) || other.revisionRequested == revisionRequested)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingUpload, isLoadingUpload) || other.isLoadingUpload == isLoadingUpload)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,role,deliveryType,publicCode,const DeepCollectionEquality().hash(_selectedImages),const DeepCollectionEquality().hash(_existingAttachmentUrls),const DeepCollectionEquality().hash(_attachmentIds),tradingPlatform,title,price,conditionSummary,conditionDetails,warrantyPeriodDays,const DeepCollectionEquality().hash(pdfBytes),revisionRequested,isLoading,isLoadingUpload,error);

@override
String toString() {
  return 'CreateContractState(role: $role, deliveryType: $deliveryType, publicCode: $publicCode, selectedImages: $selectedImages, existingAttachmentUrls: $existingAttachmentUrls, attachmentIds: $attachmentIds, tradingPlatform: $tradingPlatform, title: $title, price: $price, conditionSummary: $conditionSummary, conditionDetails: $conditionDetails, warrantyPeriodDays: $warrantyPeriodDays, pdfBytes: $pdfBytes, revisionRequested: $revisionRequested, isLoading: $isLoading, isLoadingUpload: $isLoadingUpload, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CreateContractStateCopyWith<$Res> implements $CreateContractStateCopyWith<$Res> {
  factory _$CreateContractStateCopyWith(_CreateContractState value, $Res Function(_CreateContractState) _then) = __$CreateContractStateCopyWithImpl;
@override @useResult
$Res call({
 Role? role, DeliveryType deliveryType, String? publicCode, List<AssetEntity> selectedImages, List<String> existingAttachmentUrls, List<int> attachmentIds, String tradingPlatform, String title, int price, String conditionSummary, String conditionDetails, int warrantyPeriodDays, Uint8List? pdfBytes, bool revisionRequested, bool isLoading, bool isLoadingUpload, String? error
});




}
/// @nodoc
class __$CreateContractStateCopyWithImpl<$Res>
    implements _$CreateContractStateCopyWith<$Res> {
  __$CreateContractStateCopyWithImpl(this._self, this._then);

  final _CreateContractState _self;
  final $Res Function(_CreateContractState) _then;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = freezed,Object? deliveryType = null,Object? publicCode = freezed,Object? selectedImages = null,Object? existingAttachmentUrls = null,Object? attachmentIds = null,Object? tradingPlatform = null,Object? title = null,Object? price = null,Object? conditionSummary = null,Object? conditionDetails = null,Object? warrantyPeriodDays = null,Object? pdfBytes = freezed,Object? revisionRequested = null,Object? isLoading = null,Object? isLoadingUpload = null,Object? error = freezed,}) {
  return _then(_CreateContractState(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as DeliveryType,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,selectedImages: null == selectedImages ? _self._selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,existingAttachmentUrls: null == existingAttachmentUrls ? _self._existingAttachmentUrls : existingAttachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,attachmentIds: null == attachmentIds ? _self._attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<int>,tradingPlatform: null == tradingPlatform ? _self.tradingPlatform : tradingPlatform // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,conditionSummary: null == conditionSummary ? _self.conditionSummary : conditionSummary // ignore: cast_nullable_to_non_nullable
as String,conditionDetails: null == conditionDetails ? _self.conditionDetails : conditionDetails // ignore: cast_nullable_to_non_nullable
as String,warrantyPeriodDays: null == warrantyPeriodDays ? _self.warrantyPeriodDays : warrantyPeriodDays // ignore: cast_nullable_to_non_nullable
as int,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,revisionRequested: null == revisionRequested ? _self.revisionRequested : revisionRequested // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingUpload: null == isLoadingUpload ? _self.isLoadingUpload : isLoadingUpload // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
