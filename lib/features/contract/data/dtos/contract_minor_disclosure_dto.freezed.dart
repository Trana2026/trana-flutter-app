// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_minor_disclosure_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractMinorDisclosureDto {

 String get version; String get title; List<String> get items;
/// Create a copy of ContractMinorDisclosureDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractMinorDisclosureDtoCopyWith<ContractMinorDisclosureDto> get copyWith => _$ContractMinorDisclosureDtoCopyWithImpl<ContractMinorDisclosureDto>(this as ContractMinorDisclosureDto, _$identity);

  /// Serializes this ContractMinorDisclosureDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractMinorDisclosureDto&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,title,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ContractMinorDisclosureDto(version: $version, title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class $ContractMinorDisclosureDtoCopyWith<$Res>  {
  factory $ContractMinorDisclosureDtoCopyWith(ContractMinorDisclosureDto value, $Res Function(ContractMinorDisclosureDto) _then) = _$ContractMinorDisclosureDtoCopyWithImpl;
@useResult
$Res call({
 String version, String title, List<String> items
});




}
/// @nodoc
class _$ContractMinorDisclosureDtoCopyWithImpl<$Res>
    implements $ContractMinorDisclosureDtoCopyWith<$Res> {
  _$ContractMinorDisclosureDtoCopyWithImpl(this._self, this._then);

  final ContractMinorDisclosureDto _self;
  final $Res Function(ContractMinorDisclosureDto) _then;

/// Create a copy of ContractMinorDisclosureDto
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


/// Adds pattern-matching-related methods to [ContractMinorDisclosureDto].
extension ContractMinorDisclosureDtoPatterns on ContractMinorDisclosureDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractMinorDisclosureDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractMinorDisclosureDto value)  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractMinorDisclosureDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContractMinorDisclosureDto() when $default != null:
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
case _ContractMinorDisclosureDto() when $default != null:
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
case _ContractMinorDisclosureDto():
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
case _ContractMinorDisclosureDto() when $default != null:
return $default(_that.version,_that.title,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractMinorDisclosureDto implements ContractMinorDisclosureDto {
  const _ContractMinorDisclosureDto({required this.version, required this.title, required final  List<String> items}): _items = items;
  factory _ContractMinorDisclosureDto.fromJson(Map<String, dynamic> json) => _$ContractMinorDisclosureDtoFromJson(json);

@override final  String version;
@override final  String title;
 final  List<String> _items;
@override List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ContractMinorDisclosureDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractMinorDisclosureDtoCopyWith<_ContractMinorDisclosureDto> get copyWith => __$ContractMinorDisclosureDtoCopyWithImpl<_ContractMinorDisclosureDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractMinorDisclosureDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractMinorDisclosureDto&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,title,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ContractMinorDisclosureDto(version: $version, title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ContractMinorDisclosureDtoCopyWith<$Res> implements $ContractMinorDisclosureDtoCopyWith<$Res> {
  factory _$ContractMinorDisclosureDtoCopyWith(_ContractMinorDisclosureDto value, $Res Function(_ContractMinorDisclosureDto) _then) = __$ContractMinorDisclosureDtoCopyWithImpl;
@override @useResult
$Res call({
 String version, String title, List<String> items
});




}
/// @nodoc
class __$ContractMinorDisclosureDtoCopyWithImpl<$Res>
    implements _$ContractMinorDisclosureDtoCopyWith<$Res> {
  __$ContractMinorDisclosureDtoCopyWithImpl(this._self, this._then);

  final _ContractMinorDisclosureDto _self;
  final $Res Function(_ContractMinorDisclosureDto) _then;

/// Create a copy of ContractMinorDisclosureDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? title = null,Object? items = null,}) {
  return _then(_ContractMinorDisclosureDto(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
