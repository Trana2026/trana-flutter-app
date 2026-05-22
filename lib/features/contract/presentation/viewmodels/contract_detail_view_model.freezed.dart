// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractDetailState {

 ContractsEntity? get selectedContract;// 현재 선택된 계약 정보
 ContractPartiesEntity? get myParty;// 사용자의 계약 당사자 정보
 bool get isLoading; String? get error;
/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDetailStateCopyWith<ContractDetailState> get copyWith => _$ContractDetailStateCopyWithImpl<ContractDetailState>(this as ContractDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailState&&(identical(other.selectedContract, selectedContract) || other.selectedContract == selectedContract)&&(identical(other.myParty, myParty) || other.myParty == myParty)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,selectedContract,myParty,isLoading,error);

@override
String toString() {
  return 'ContractDetailState(selectedContract: $selectedContract, myParty: $myParty, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ContractDetailStateCopyWith<$Res>  {
  factory $ContractDetailStateCopyWith(ContractDetailState value, $Res Function(ContractDetailState) _then) = _$ContractDetailStateCopyWithImpl;
@useResult
$Res call({
 ContractsEntity? selectedContract, ContractPartiesEntity? myParty, bool isLoading, String? error
});


$ContractsEntityCopyWith<$Res>? get selectedContract;$ContractPartiesEntityCopyWith<$Res>? get myParty;

}
/// @nodoc
class _$ContractDetailStateCopyWithImpl<$Res>
    implements $ContractDetailStateCopyWith<$Res> {
  _$ContractDetailStateCopyWithImpl(this._self, this._then);

  final ContractDetailState _self;
  final $Res Function(ContractDetailState) _then;

/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedContract = freezed,Object? myParty = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
selectedContract: freezed == selectedContract ? _self.selectedContract : selectedContract // ignore: cast_nullable_to_non_nullable
as ContractsEntity?,myParty: freezed == myParty ? _self.myParty : myParty // ignore: cast_nullable_to_non_nullable
as ContractPartiesEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsEntityCopyWith<$Res>? get selectedContract {
    if (_self.selectedContract == null) {
    return null;
  }

  return $ContractsEntityCopyWith<$Res>(_self.selectedContract!, (value) {
    return _then(_self.copyWith(selectedContract: value));
  });
}/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractPartiesEntityCopyWith<$Res>? get myParty {
    if (_self.myParty == null) {
    return null;
  }

  return $ContractPartiesEntityCopyWith<$Res>(_self.myParty!, (value) {
    return _then(_self.copyWith(myParty: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractDetailState].
extension ContractDetailStatePatterns on ContractDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ContractDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContractsEntity? selectedContract,  ContractPartiesEntity? myParty,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDetailState() when $default != null:
return $default(_that.selectedContract,_that.myParty,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContractsEntity? selectedContract,  ContractPartiesEntity? myParty,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ContractDetailState():
return $default(_that.selectedContract,_that.myParty,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContractsEntity? selectedContract,  ContractPartiesEntity? myParty,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ContractDetailState() when $default != null:
return $default(_that.selectedContract,_that.myParty,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ContractDetailState implements ContractDetailState {
  const _ContractDetailState({this.selectedContract, this.myParty, this.isLoading = false, this.error});
  

@override final  ContractsEntity? selectedContract;
// 현재 선택된 계약 정보
@override final  ContractPartiesEntity? myParty;
// 사용자의 계약 당사자 정보
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDetailStateCopyWith<_ContractDetailState> get copyWith => __$ContractDetailStateCopyWithImpl<_ContractDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDetailState&&(identical(other.selectedContract, selectedContract) || other.selectedContract == selectedContract)&&(identical(other.myParty, myParty) || other.myParty == myParty)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,selectedContract,myParty,isLoading,error);

@override
String toString() {
  return 'ContractDetailState(selectedContract: $selectedContract, myParty: $myParty, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ContractDetailStateCopyWith<$Res> implements $ContractDetailStateCopyWith<$Res> {
  factory _$ContractDetailStateCopyWith(_ContractDetailState value, $Res Function(_ContractDetailState) _then) = __$ContractDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ContractsEntity? selectedContract, ContractPartiesEntity? myParty, bool isLoading, String? error
});


@override $ContractsEntityCopyWith<$Res>? get selectedContract;@override $ContractPartiesEntityCopyWith<$Res>? get myParty;

}
/// @nodoc
class __$ContractDetailStateCopyWithImpl<$Res>
    implements _$ContractDetailStateCopyWith<$Res> {
  __$ContractDetailStateCopyWithImpl(this._self, this._then);

  final _ContractDetailState _self;
  final $Res Function(_ContractDetailState) _then;

/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedContract = freezed,Object? myParty = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ContractDetailState(
selectedContract: freezed == selectedContract ? _self.selectedContract : selectedContract // ignore: cast_nullable_to_non_nullable
as ContractsEntity?,myParty: freezed == myParty ? _self.myParty : myParty // ignore: cast_nullable_to_non_nullable
as ContractPartiesEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsEntityCopyWith<$Res>? get selectedContract {
    if (_self.selectedContract == null) {
    return null;
  }

  return $ContractsEntityCopyWith<$Res>(_self.selectedContract!, (value) {
    return _then(_self.copyWith(selectedContract: value));
  });
}/// Create a copy of ContractDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractPartiesEntityCopyWith<$Res>? get myParty {
    if (_self.myParty == null) {
    return null;
  }

  return $ContractPartiesEntityCopyWith<$Res>(_self.myParty!, (value) {
    return _then(_self.copyWith(myParty: value));
  });
}
}

// dart format on
