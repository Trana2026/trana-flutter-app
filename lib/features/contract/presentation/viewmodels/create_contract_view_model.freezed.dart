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
 TransactionMethod get method;// 선택된 거래 방식
 List<AssetEntity> get selectedImages;// 등록한 거래 사진 목록
 String get name;// 입력된 거래 물품명
 int get amount;// 입력된 거래 금액
 String get condition;// 입력된 상품 상태
 String get details;// 입력된 상품 상세 설명
 bool get warranted;// 선택된 보증 제공 여부
 Uint8List? get pdfBytes;// 생성된 Pdf 바이트
 int? get contractId;// 생성된 계약서 초안 id
 bool get isLoading; String? get error;
/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateContractStateCopyWith<CreateContractState> get copyWith => _$CreateContractStateCopyWithImpl<CreateContractState>(this as CreateContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractState&&(identical(other.role, role) || other.role == role)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.selectedImages, selectedImages)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.details, details) || other.details == details)&&(identical(other.warranted, warranted) || other.warranted == warranted)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,role,method,const DeepCollectionEquality().hash(selectedImages),name,amount,condition,details,warranted,const DeepCollectionEquality().hash(pdfBytes),contractId,isLoading,error);

@override
String toString() {
  return 'CreateContractState(role: $role, method: $method, selectedImages: $selectedImages, name: $name, amount: $amount, condition: $condition, details: $details, warranted: $warranted, pdfBytes: $pdfBytes, contractId: $contractId, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $CreateContractStateCopyWith<$Res>  {
  factory $CreateContractStateCopyWith(CreateContractState value, $Res Function(CreateContractState) _then) = _$CreateContractStateCopyWithImpl;
@useResult
$Res call({
 Role? role, TransactionMethod method, List<AssetEntity> selectedImages, String name, int amount, String condition, String details, bool warranted, Uint8List? pdfBytes, int? contractId, bool isLoading, String? error
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
@pragma('vm:prefer-inline') @override $Res call({Object? role = freezed,Object? method = null,Object? selectedImages = null,Object? name = null,Object? amount = null,Object? condition = null,Object? details = null,Object? warranted = null,Object? pdfBytes = freezed,Object? contractId = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as TransactionMethod,selectedImages: null == selectedImages ? _self.selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,warranted: null == warranted ? _self.warranted : warranted // ignore: cast_nullable_to_non_nullable
as bool,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,contractId: freezed == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Role? role,  TransactionMethod method,  List<AssetEntity> selectedImages,  String name,  int amount,  String condition,  String details,  bool warranted,  Uint8List? pdfBytes,  int? contractId,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.role,_that.method,_that.selectedImages,_that.name,_that.amount,_that.condition,_that.details,_that.warranted,_that.pdfBytes,_that.contractId,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Role? role,  TransactionMethod method,  List<AssetEntity> selectedImages,  String name,  int amount,  String condition,  String details,  bool warranted,  Uint8List? pdfBytes,  int? contractId,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CreateContractState():
return $default(_that.role,_that.method,_that.selectedImages,_that.name,_that.amount,_that.condition,_that.details,_that.warranted,_that.pdfBytes,_that.contractId,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Role? role,  TransactionMethod method,  List<AssetEntity> selectedImages,  String name,  int amount,  String condition,  String details,  bool warranted,  Uint8List? pdfBytes,  int? contractId,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.role,_that.method,_that.selectedImages,_that.name,_that.amount,_that.condition,_that.details,_that.warranted,_that.pdfBytes,_that.contractId,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CreateContractState implements CreateContractState {
  const _CreateContractState({this.role, this.method = TransactionMethod.delivery, final  List<AssetEntity> selectedImages = const [], this.name = '', this.amount = 0, this.condition = '', this.details = '', this.warranted = false, this.pdfBytes, this.contractId, this.isLoading = false, this.error}): _selectedImages = selectedImages;
  

@override final  Role? role;
// 선택된 역할
@override@JsonKey() final  TransactionMethod method;
// 선택된 거래 방식
 final  List<AssetEntity> _selectedImages;
// 선택된 거래 방식
@override@JsonKey() List<AssetEntity> get selectedImages {
  if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImages);
}

// 등록한 거래 사진 목록
@override@JsonKey() final  String name;
// 입력된 거래 물품명
@override@JsonKey() final  int amount;
// 입력된 거래 금액
@override@JsonKey() final  String condition;
// 입력된 상품 상태
@override@JsonKey() final  String details;
// 입력된 상품 상세 설명
@override@JsonKey() final  bool warranted;
// 선택된 보증 제공 여부
@override final  Uint8List? pdfBytes;
// 생성된 Pdf 바이트
@override final  int? contractId;
// 생성된 계약서 초안 id
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateContractStateCopyWith<_CreateContractState> get copyWith => __$CreateContractStateCopyWithImpl<_CreateContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateContractState&&(identical(other.role, role) || other.role == role)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other._selectedImages, _selectedImages)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.details, details) || other.details == details)&&(identical(other.warranted, warranted) || other.warranted == warranted)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.contractId, contractId) || other.contractId == contractId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,role,method,const DeepCollectionEquality().hash(_selectedImages),name,amount,condition,details,warranted,const DeepCollectionEquality().hash(pdfBytes),contractId,isLoading,error);

@override
String toString() {
  return 'CreateContractState(role: $role, method: $method, selectedImages: $selectedImages, name: $name, amount: $amount, condition: $condition, details: $details, warranted: $warranted, pdfBytes: $pdfBytes, contractId: $contractId, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CreateContractStateCopyWith<$Res> implements $CreateContractStateCopyWith<$Res> {
  factory _$CreateContractStateCopyWith(_CreateContractState value, $Res Function(_CreateContractState) _then) = __$CreateContractStateCopyWithImpl;
@override @useResult
$Res call({
 Role? role, TransactionMethod method, List<AssetEntity> selectedImages, String name, int amount, String condition, String details, bool warranted, Uint8List? pdfBytes, int? contractId, bool isLoading, String? error
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
@override @pragma('vm:prefer-inline') $Res call({Object? role = freezed,Object? method = null,Object? selectedImages = null,Object? name = null,Object? amount = null,Object? condition = null,Object? details = null,Object? warranted = null,Object? pdfBytes = freezed,Object? contractId = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_CreateContractState(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role?,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as TransactionMethod,selectedImages: null == selectedImages ? _self._selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,warranted: null == warranted ? _self.warranted : warranted // ignore: cast_nullable_to_non_nullable
as bool,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,contractId: freezed == contractId ? _self.contractId : contractId // ignore: cast_nullable_to_non_nullable
as int?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
