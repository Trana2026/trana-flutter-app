// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_request_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractRequestState {

 List<ContractRequestsEntity> get requests;// 계약 요청 목록
 ContractsEntity? get receivedContract;// 수신된 계약 정보
 Uint8List? get pdfBytes;// 생성된 Pdf 바이트
 bool get isLoading; String? get error;
/// Create a copy of ContractRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractRequestStateCopyWith<ContractRequestState> get copyWith => _$ContractRequestStateCopyWithImpl<ContractRequestState>(this as ContractRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractRequestState&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.receivedContract, receivedContract) || other.receivedContract == receivedContract)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requests),receivedContract,const DeepCollectionEquality().hash(pdfBytes),isLoading,error);

@override
String toString() {
  return 'ContractRequestState(requests: $requests, receivedContract: $receivedContract, pdfBytes: $pdfBytes, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ContractRequestStateCopyWith<$Res>  {
  factory $ContractRequestStateCopyWith(ContractRequestState value, $Res Function(ContractRequestState) _then) = _$ContractRequestStateCopyWithImpl;
@useResult
$Res call({
 List<ContractRequestsEntity> requests, ContractsEntity? receivedContract, Uint8List? pdfBytes, bool isLoading, String? error
});


$ContractsEntityCopyWith<$Res>? get receivedContract;

}
/// @nodoc
class _$ContractRequestStateCopyWithImpl<$Res>
    implements $ContractRequestStateCopyWith<$Res> {
  _$ContractRequestStateCopyWithImpl(this._self, this._then);

  final ContractRequestState _self;
  final $Res Function(ContractRequestState) _then;

/// Create a copy of ContractRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requests = null,Object? receivedContract = freezed,Object? pdfBytes = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<ContractRequestsEntity>,receivedContract: freezed == receivedContract ? _self.receivedContract : receivedContract // ignore: cast_nullable_to_non_nullable
as ContractsEntity?,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ContractRequestState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsEntityCopyWith<$Res>? get receivedContract {
    if (_self.receivedContract == null) {
    return null;
  }

  return $ContractsEntityCopyWith<$Res>(_self.receivedContract!, (value) {
    return _then(_self.copyWith(receivedContract: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractRequestState].
extension ContractRequestStatePatterns on ContractRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractRequestState value)  $default,){
final _that = this;
switch (_that) {
case _ContractRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _ContractRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContractRequestsEntity> requests,  ContractsEntity? receivedContract,  Uint8List? pdfBytes,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractRequestState() when $default != null:
return $default(_that.requests,_that.receivedContract,_that.pdfBytes,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContractRequestsEntity> requests,  ContractsEntity? receivedContract,  Uint8List? pdfBytes,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ContractRequestState():
return $default(_that.requests,_that.receivedContract,_that.pdfBytes,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContractRequestsEntity> requests,  ContractsEntity? receivedContract,  Uint8List? pdfBytes,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ContractRequestState() when $default != null:
return $default(_that.requests,_that.receivedContract,_that.pdfBytes,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ContractRequestState implements ContractRequestState {
  const _ContractRequestState({final  List<ContractRequestsEntity> requests = const [], this.receivedContract, this.pdfBytes, this.isLoading = false, this.error}): _requests = requests;
  

 final  List<ContractRequestsEntity> _requests;
@override@JsonKey() List<ContractRequestsEntity> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

// 계약 요청 목록
@override final  ContractsEntity? receivedContract;
// 수신된 계약 정보
@override final  Uint8List? pdfBytes;
// 생성된 Pdf 바이트
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ContractRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractRequestStateCopyWith<_ContractRequestState> get copyWith => __$ContractRequestStateCopyWithImpl<_ContractRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractRequestState&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.receivedContract, receivedContract) || other.receivedContract == receivedContract)&&const DeepCollectionEquality().equals(other.pdfBytes, pdfBytes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),receivedContract,const DeepCollectionEquality().hash(pdfBytes),isLoading,error);

@override
String toString() {
  return 'ContractRequestState(requests: $requests, receivedContract: $receivedContract, pdfBytes: $pdfBytes, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ContractRequestStateCopyWith<$Res> implements $ContractRequestStateCopyWith<$Res> {
  factory _$ContractRequestStateCopyWith(_ContractRequestState value, $Res Function(_ContractRequestState) _then) = __$ContractRequestStateCopyWithImpl;
@override @useResult
$Res call({
 List<ContractRequestsEntity> requests, ContractsEntity? receivedContract, Uint8List? pdfBytes, bool isLoading, String? error
});


@override $ContractsEntityCopyWith<$Res>? get receivedContract;

}
/// @nodoc
class __$ContractRequestStateCopyWithImpl<$Res>
    implements _$ContractRequestStateCopyWith<$Res> {
  __$ContractRequestStateCopyWithImpl(this._self, this._then);

  final _ContractRequestState _self;
  final $Res Function(_ContractRequestState) _then;

/// Create a copy of ContractRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? receivedContract = freezed,Object? pdfBytes = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ContractRequestState(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ContractRequestsEntity>,receivedContract: freezed == receivedContract ? _self.receivedContract : receivedContract // ignore: cast_nullable_to_non_nullable
as ContractsEntity?,pdfBytes: freezed == pdfBytes ? _self.pdfBytes : pdfBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ContractRequestState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsEntityCopyWith<$Res>? get receivedContract {
    if (_self.receivedContract == null) {
    return null;
  }

  return $ContractsEntityCopyWith<$Res>(_self.receivedContract!, (value) {
    return _then(_self.copyWith(receivedContract: value));
  });
}
}

// dart format on
