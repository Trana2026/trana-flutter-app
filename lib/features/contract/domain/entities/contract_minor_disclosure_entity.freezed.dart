// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_minor_disclosure_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractMinorDisclosureEntity {

 String get version; String get title; List<String> get items;
/// Create a copy of ContractMinorDisclosureEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractMinorDisclosureEntityCopyWith<ContractMinorDisclosureEntity> get copyWith => _$ContractMinorDisclosureEntityCopyWithImpl<ContractMinorDisclosureEntity>(this as ContractMinorDisclosureEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractMinorDisclosureEntity&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,version,title,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ContractMinorDisclosureEntity(version: $version, title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class $ContractMinorDisclosureEntityCopyWith<$Res>  {
  factory $ContractMinorDisclosureEntityCopyWith(ContractMinorDisclosureEntity value, $Res Function(ContractMinorDisclosureEntity) _then) = _$ContractMinorDisclosureEntityCopyWithImpl;
@useResult
$Res call({
 String version, String title, List<String> items
});




}
/// @nodoc
class _$ContractMinorDisclosureEntityCopyWithImpl<$Res>
    implements $ContractMinorDisclosureEntityCopyWith<$Res> {
  _$ContractMinorDisclosureEntityCopyWithImpl(this._self, this._then);

  final ContractMinorDisclosureEntity _self;
  final $Res Function(ContractMinorDisclosureEntity) _then;

/// Create a copy of ContractMinorDisclosureEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? title = null,Object? items = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContractMinorDisclosureEntity].
extension ContractMinorDisclosureEntityPatterns on ContractMinorDisclosureEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractMinorDisclosureEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractMinorDisclosureEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractMinorDisclosureEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  String title,  List<String> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractMinorDisclosureEntity() when $default != null:
return $default(_that.version,_that.title,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  String title,  List<String> items)  $default,) {final _that = this;
switch (_that) {
case _ContractMinorDisclosureEntity():
return $default(_that.version,_that.title,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  String title,  List<String> items)?  $default,) {final _that = this;
switch (_that) {
case _ContractMinorDisclosureEntity() when $default != null:
return $default(_that.version,_that.title,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ContractMinorDisclosureEntity implements ContractMinorDisclosureEntity {
  const _ContractMinorDisclosureEntity({required this.version, required this.title, required final  List<String> items}): _items = items;
  

@override final  String version;
@override final  String title;
 final  List<String> _items;
@override List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ContractMinorDisclosureEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractMinorDisclosureEntityCopyWith<_ContractMinorDisclosureEntity> get copyWith => __$ContractMinorDisclosureEntityCopyWithImpl<_ContractMinorDisclosureEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractMinorDisclosureEntity&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,version,title,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ContractMinorDisclosureEntity(version: $version, title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ContractMinorDisclosureEntityCopyWith<$Res> implements $ContractMinorDisclosureEntityCopyWith<$Res> {
  factory _$ContractMinorDisclosureEntityCopyWith(_ContractMinorDisclosureEntity value, $Res Function(_ContractMinorDisclosureEntity) _then) = __$ContractMinorDisclosureEntityCopyWithImpl;
@override @useResult
$Res call({
 String version, String title, List<String> items
});




}
/// @nodoc
class __$ContractMinorDisclosureEntityCopyWithImpl<$Res>
    implements _$ContractMinorDisclosureEntityCopyWith<$Res> {
  __$ContractMinorDisclosureEntityCopyWithImpl(this._self, this._then);

  final _ContractMinorDisclosureEntity _self;
  final $Res Function(_ContractMinorDisclosureEntity) _then;

/// Create a copy of ContractMinorDisclosureEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? title = null,Object? items = null,}) {
  return _then(_ContractMinorDisclosureEntity(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
