// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyPageState {

 String? get publicCode;// 사용자 publicCode
 String? get email;// 이메일
 UserStatus? get status;// 사용자 상태 (활성 / 탈퇴)
 AgeGroup? get ageGroup;// 연령 그룹 (성인 / 미성년자)
 DateTime? get guardianVerifiedAt;// 보호자 동의 일자 (미성년)
 dynamic get name;// 이름
 String? get birthDate;// 생년월일
 Gender? get gender;// 성별
 String? get phone;// 휴대폰 번호
 bool get pushEnabled;// 푸시 알림 활성화 여부
 int get trustScore;// 신뢰 점수
 TrustGrade get trustGrade;// 등급
 String get trustGradeLabel;// 등급 한글 라벨
 int get completedContractCount;// 누적 계약 건수 (양측 서명 완료)
 int get warrantyProvidedCount;// 보증 횟수 (판매자 보증 제공 + SIGNED 누적)
 int get fraudReportReceivedCount;// 분쟁 횟수 (본인이 신고 당한 건 중 사기 확인 누적)
 List<DeviceTokenEntity> get devices;// 기기 목록
 String? get error;
/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPageStateCopyWith<MyPageState> get copyWith => _$MyPageStateCopyWithImpl<MyPageState>(this as MyPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPageState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.trustGrade, trustGrade) || other.trustGrade == trustGrade)&&(identical(other.trustGradeLabel, trustGradeLabel) || other.trustGradeLabel == trustGradeLabel)&&(identical(other.completedContractCount, completedContractCount) || other.completedContractCount == completedContractCount)&&(identical(other.warrantyProvidedCount, warrantyProvidedCount) || other.warrantyProvidedCount == warrantyProvidedCount)&&(identical(other.fraudReportReceivedCount, fraudReportReceivedCount) || other.fraudReportReceivedCount == fraudReportReceivedCount)&&const DeepCollectionEquality().equals(other.devices, devices)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,status,ageGroup,guardianVerifiedAt,const DeepCollectionEquality().hash(name),birthDate,gender,phone,pushEnabled,trustScore,trustGrade,trustGradeLabel,completedContractCount,warrantyProvidedCount,fraudReportReceivedCount,const DeepCollectionEquality().hash(devices),error);

@override
String toString() {
  return 'MyPageState(publicCode: $publicCode, email: $email, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, name: $name, birthDate: $birthDate, gender: $gender, phone: $phone, pushEnabled: $pushEnabled, trustScore: $trustScore, trustGrade: $trustGrade, trustGradeLabel: $trustGradeLabel, completedContractCount: $completedContractCount, warrantyProvidedCount: $warrantyProvidedCount, fraudReportReceivedCount: $fraudReportReceivedCount, devices: $devices, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyPageStateCopyWith<$Res>  {
  factory $MyPageStateCopyWith(MyPageState value, $Res Function(MyPageState) _then) = _$MyPageStateCopyWithImpl;
@useResult
$Res call({
 String? publicCode, String? email, UserStatus? status, AgeGroup? ageGroup, DateTime? guardianVerifiedAt, dynamic name, String? birthDate, Gender? gender, String? phone, bool pushEnabled, int trustScore, TrustGrade trustGrade, String trustGradeLabel, int completedContractCount, int warrantyProvidedCount, int fraudReportReceivedCount, List<DeviceTokenEntity> devices, String? error
});




}
/// @nodoc
class _$MyPageStateCopyWithImpl<$Res>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._self, this._then);

  final MyPageState _self;
  final $Res Function(MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = freezed,Object? email = freezed,Object? status = freezed,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,Object? name = freezed,Object? birthDate = freezed,Object? gender = freezed,Object? phone = freezed,Object? pushEnabled = null,Object? trustScore = null,Object? trustGrade = null,Object? trustGradeLabel = null,Object? completedContractCount = null,Object? warrantyProvidedCount = null,Object? fraudReportReceivedCount = null,Object? devices = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserStatus?,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as dynamic,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,trustScore: null == trustScore ? _self.trustScore : trustScore // ignore: cast_nullable_to_non_nullable
as int,trustGrade: null == trustGrade ? _self.trustGrade : trustGrade // ignore: cast_nullable_to_non_nullable
as TrustGrade,trustGradeLabel: null == trustGradeLabel ? _self.trustGradeLabel : trustGradeLabel // ignore: cast_nullable_to_non_nullable
as String,completedContractCount: null == completedContractCount ? _self.completedContractCount : completedContractCount // ignore: cast_nullable_to_non_nullable
as int,warrantyProvidedCount: null == warrantyProvidedCount ? _self.warrantyProvidedCount : warrantyProvidedCount // ignore: cast_nullable_to_non_nullable
as int,fraudReportReceivedCount: null == fraudReportReceivedCount ? _self.fraudReportReceivedCount : fraudReportReceivedCount // ignore: cast_nullable_to_non_nullable
as int,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceTokenEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyPageState].
extension MyPageStatePatterns on MyPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPageState value)  $default,){
final _that = this;
switch (_that) {
case _MyPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPageState value)?  $default,){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? publicCode,  String? email,  UserStatus? status,  AgeGroup? ageGroup,  DateTime? guardianVerifiedAt,  dynamic name,  String? birthDate,  Gender? gender,  String? phone,  bool pushEnabled,  int trustScore,  TrustGrade trustGrade,  String trustGradeLabel,  int completedContractCount,  int warrantyProvidedCount,  int fraudReportReceivedCount,  List<DeviceTokenEntity> devices,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.publicCode,_that.email,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.name,_that.birthDate,_that.gender,_that.phone,_that.pushEnabled,_that.trustScore,_that.trustGrade,_that.trustGradeLabel,_that.completedContractCount,_that.warrantyProvidedCount,_that.fraudReportReceivedCount,_that.devices,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? publicCode,  String? email,  UserStatus? status,  AgeGroup? ageGroup,  DateTime? guardianVerifiedAt,  dynamic name,  String? birthDate,  Gender? gender,  String? phone,  bool pushEnabled,  int trustScore,  TrustGrade trustGrade,  String trustGradeLabel,  int completedContractCount,  int warrantyProvidedCount,  int fraudReportReceivedCount,  List<DeviceTokenEntity> devices,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MyPageState():
return $default(_that.publicCode,_that.email,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.name,_that.birthDate,_that.gender,_that.phone,_that.pushEnabled,_that.trustScore,_that.trustGrade,_that.trustGradeLabel,_that.completedContractCount,_that.warrantyProvidedCount,_that.fraudReportReceivedCount,_that.devices,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? publicCode,  String? email,  UserStatus? status,  AgeGroup? ageGroup,  DateTime? guardianVerifiedAt,  dynamic name,  String? birthDate,  Gender? gender,  String? phone,  bool pushEnabled,  int trustScore,  TrustGrade trustGrade,  String trustGradeLabel,  int completedContractCount,  int warrantyProvidedCount,  int fraudReportReceivedCount,  List<DeviceTokenEntity> devices,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.publicCode,_that.email,_that.status,_that.ageGroup,_that.guardianVerifiedAt,_that.name,_that.birthDate,_that.gender,_that.phone,_that.pushEnabled,_that.trustScore,_that.trustGrade,_that.trustGradeLabel,_that.completedContractCount,_that.warrantyProvidedCount,_that.fraudReportReceivedCount,_that.devices,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyPageState extends MyPageState {
  const _MyPageState({this.publicCode, this.email, this.status, this.ageGroup, this.guardianVerifiedAt, this.name = '트라나', this.birthDate, this.gender, this.phone, this.pushEnabled = true, this.trustScore = 35, this.trustGrade = TrustGrade.normal, this.trustGradeLabel = '일반', this.completedContractCount = 0, this.warrantyProvidedCount = 0, this.fraudReportReceivedCount = 0, final  List<DeviceTokenEntity> devices = const [], this.error}): _devices = devices,super._();
  

@override final  String? publicCode;
// 사용자 publicCode
@override final  String? email;
// 이메일
@override final  UserStatus? status;
// 사용자 상태 (활성 / 탈퇴)
@override final  AgeGroup? ageGroup;
// 연령 그룹 (성인 / 미성년자)
@override final  DateTime? guardianVerifiedAt;
// 보호자 동의 일자 (미성년)
@override@JsonKey() final  dynamic name;
// 이름
@override final  String? birthDate;
// 생년월일
@override final  Gender? gender;
// 성별
@override final  String? phone;
// 휴대폰 번호
@override@JsonKey() final  bool pushEnabled;
// 푸시 알림 활성화 여부
@override@JsonKey() final  int trustScore;
// 신뢰 점수
@override@JsonKey() final  TrustGrade trustGrade;
// 등급
@override@JsonKey() final  String trustGradeLabel;
// 등급 한글 라벨
@override@JsonKey() final  int completedContractCount;
// 누적 계약 건수 (양측 서명 완료)
@override@JsonKey() final  int warrantyProvidedCount;
// 보증 횟수 (판매자 보증 제공 + SIGNED 누적)
@override@JsonKey() final  int fraudReportReceivedCount;
// 분쟁 횟수 (본인이 신고 당한 건 중 사기 확인 누적)
 final  List<DeviceTokenEntity> _devices;
// 분쟁 횟수 (본인이 신고 당한 건 중 사기 확인 누적)
@override@JsonKey() List<DeviceTokenEntity> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

// 기기 목록
@override final  String? error;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPageStateCopyWith<_MyPageState> get copyWith => __$MyPageStateCopyWithImpl<_MyPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPageState&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.guardianVerifiedAt, guardianVerifiedAt) || other.guardianVerifiedAt == guardianVerifiedAt)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.trustScore, trustScore) || other.trustScore == trustScore)&&(identical(other.trustGrade, trustGrade) || other.trustGrade == trustGrade)&&(identical(other.trustGradeLabel, trustGradeLabel) || other.trustGradeLabel == trustGradeLabel)&&(identical(other.completedContractCount, completedContractCount) || other.completedContractCount == completedContractCount)&&(identical(other.warrantyProvidedCount, warrantyProvidedCount) || other.warrantyProvidedCount == warrantyProvidedCount)&&(identical(other.fraudReportReceivedCount, fraudReportReceivedCount) || other.fraudReportReceivedCount == fraudReportReceivedCount)&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,publicCode,email,status,ageGroup,guardianVerifiedAt,const DeepCollectionEquality().hash(name),birthDate,gender,phone,pushEnabled,trustScore,trustGrade,trustGradeLabel,completedContractCount,warrantyProvidedCount,fraudReportReceivedCount,const DeepCollectionEquality().hash(_devices),error);

@override
String toString() {
  return 'MyPageState(publicCode: $publicCode, email: $email, status: $status, ageGroup: $ageGroup, guardianVerifiedAt: $guardianVerifiedAt, name: $name, birthDate: $birthDate, gender: $gender, phone: $phone, pushEnabled: $pushEnabled, trustScore: $trustScore, trustGrade: $trustGrade, trustGradeLabel: $trustGradeLabel, completedContractCount: $completedContractCount, warrantyProvidedCount: $warrantyProvidedCount, fraudReportReceivedCount: $fraudReportReceivedCount, devices: $devices, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyPageStateCopyWith<$Res> implements $MyPageStateCopyWith<$Res> {
  factory _$MyPageStateCopyWith(_MyPageState value, $Res Function(_MyPageState) _then) = __$MyPageStateCopyWithImpl;
@override @useResult
$Res call({
 String? publicCode, String? email, UserStatus? status, AgeGroup? ageGroup, DateTime? guardianVerifiedAt, dynamic name, String? birthDate, Gender? gender, String? phone, bool pushEnabled, int trustScore, TrustGrade trustGrade, String trustGradeLabel, int completedContractCount, int warrantyProvidedCount, int fraudReportReceivedCount, List<DeviceTokenEntity> devices, String? error
});




}
/// @nodoc
class __$MyPageStateCopyWithImpl<$Res>
    implements _$MyPageStateCopyWith<$Res> {
  __$MyPageStateCopyWithImpl(this._self, this._then);

  final _MyPageState _self;
  final $Res Function(_MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = freezed,Object? email = freezed,Object? status = freezed,Object? ageGroup = freezed,Object? guardianVerifiedAt = freezed,Object? name = freezed,Object? birthDate = freezed,Object? gender = freezed,Object? phone = freezed,Object? pushEnabled = null,Object? trustScore = null,Object? trustGrade = null,Object? trustGradeLabel = null,Object? completedContractCount = null,Object? warrantyProvidedCount = null,Object? fraudReportReceivedCount = null,Object? devices = null,Object? error = freezed,}) {
  return _then(_MyPageState(
publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserStatus?,ageGroup: freezed == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup?,guardianVerifiedAt: freezed == guardianVerifiedAt ? _self.guardianVerifiedAt : guardianVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as dynamic,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,trustScore: null == trustScore ? _self.trustScore : trustScore // ignore: cast_nullable_to_non_nullable
as int,trustGrade: null == trustGrade ? _self.trustGrade : trustGrade // ignore: cast_nullable_to_non_nullable
as TrustGrade,trustGradeLabel: null == trustGradeLabel ? _self.trustGradeLabel : trustGradeLabel // ignore: cast_nullable_to_non_nullable
as String,completedContractCount: null == completedContractCount ? _self.completedContractCount : completedContractCount // ignore: cast_nullable_to_non_nullable
as int,warrantyProvidedCount: null == warrantyProvidedCount ? _self.warrantyProvidedCount : warrantyProvidedCount // ignore: cast_nullable_to_non_nullable
as int,fraudReportReceivedCount: null == fraudReportReceivedCount ? _self.fraudReportReceivedCount : fraudReportReceivedCount // ignore: cast_nullable_to_non_nullable
as int,devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceTokenEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
