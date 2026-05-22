// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_contract_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeContractState {

 List<ContractSummary> get recentContracts;// 최근 계약 정보 + 사용자의 역할 목록
 bool get isLoading; String? get error;
/// Create a copy of HomeContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeContractStateCopyWith<HomeContractState> get copyWith => _$HomeContractStateCopyWithImpl<HomeContractState>(this as HomeContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeContractState&&const DeepCollectionEquality().equals(other.recentContracts, recentContracts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recentContracts),isLoading,error);

@override
String toString() {
  return 'HomeContractState(recentContracts: $recentContracts, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $HomeContractStateCopyWith<$Res>  {
  factory $HomeContractStateCopyWith(HomeContractState value, $Res Function(HomeContractState) _then) = _$HomeContractStateCopyWithImpl;
@useResult
$Res call({
 List<ContractSummary> recentContracts, bool isLoading, String? error
});




}
/// @nodoc
class _$HomeContractStateCopyWithImpl<$Res>
    implements $HomeContractStateCopyWith<$Res> {
  _$HomeContractStateCopyWithImpl(this._self, this._then);

  final HomeContractState _self;
  final $Res Function(HomeContractState) _then;

/// Create a copy of HomeContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recentContracts = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
recentContracts: null == recentContracts ? _self.recentContracts : recentContracts // ignore: cast_nullable_to_non_nullable
as List<ContractSummary>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeContractState].
extension HomeContractStatePatterns on HomeContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeContractState value)  $default,){
final _that = this;
switch (_that) {
case _HomeContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeContractState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContractSummary> recentContracts,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeContractState() when $default != null:
return $default(_that.recentContracts,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContractSummary> recentContracts,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _HomeContractState():
return $default(_that.recentContracts,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContractSummary> recentContracts,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _HomeContractState() when $default != null:
return $default(_that.recentContracts,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _HomeContractState implements HomeContractState {
  const _HomeContractState({final  List<ContractSummary> recentContracts = const [], this.isLoading = false, this.error}): _recentContracts = recentContracts;
  

 final  List<ContractSummary> _recentContracts;
@override@JsonKey() List<ContractSummary> get recentContracts {
  if (_recentContracts is EqualUnmodifiableListView) return _recentContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentContracts);
}

// 최근 계약 정보 + 사용자의 역할 목록
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of HomeContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeContractStateCopyWith<_HomeContractState> get copyWith => __$HomeContractStateCopyWithImpl<_HomeContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeContractState&&const DeepCollectionEquality().equals(other._recentContracts, _recentContracts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recentContracts),isLoading,error);

@override
String toString() {
  return 'HomeContractState(recentContracts: $recentContracts, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HomeContractStateCopyWith<$Res> implements $HomeContractStateCopyWith<$Res> {
  factory _$HomeContractStateCopyWith(_HomeContractState value, $Res Function(_HomeContractState) _then) = __$HomeContractStateCopyWithImpl;
@override @useResult
$Res call({
 List<ContractSummary> recentContracts, bool isLoading, String? error
});




}
/// @nodoc
class __$HomeContractStateCopyWithImpl<$Res>
    implements _$HomeContractStateCopyWith<$Res> {
  __$HomeContractStateCopyWithImpl(this._self, this._then);

  final _HomeContractState _self;
  final $Res Function(_HomeContractState) _then;

/// Create a copy of HomeContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recentContracts = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_HomeContractState(
recentContracts: null == recentContracts ? _self._recentContracts : recentContracts // ignore: cast_nullable_to_non_nullable
as List<ContractSummary>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
