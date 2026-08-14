import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/enums/age_group.dart';
import 'package:trana/features/profile/domain/entities/device_token_entity.dart';
import 'package:trana/features/profile/domain/entities/trust_score_entity.dart';
import 'package:trana/features/profile/domain/entities/user_info_entity.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';
import 'package:trana/features/profile/domain/enums/trust_grade.dart';
import 'package:trana/features/profile/domain/enums/user_status.dart';
import 'package:trana/features/profile/presentation/viewmodels/block_view_model.dart';

part 'my_page_view_model.freezed.dart';
part 'my_page_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class MyPageState with _$MyPageState {
  const MyPageState._();

  const factory MyPageState({
    String? publicCode, // 사용자 publicCode
    String? email, // 이메일
    UserStatus? status, // 사용자 상태 (활성 / 탈퇴)
    AgeGroup? ageGroup, // 연령 그룹 (성인 / 미성년자)
    DateTime? guardianVerifiedAt, // 보호자 동의 일자 (미성년)
    @Default('트라나') name, // 이름
    String? birthDate, // 생년월일
    Gender? gender, // 성별
    String? phone, // 휴대폰 번호
    @Default(true) bool pushEnabled, // 푸시 알림 활성화 여부

    @Default(35) int trustScore, // 신뢰 점수
    @Default(TrustGrade.normal) TrustGrade trustGrade, // 등급
    @Default('일반') String trustGradeLabel, // 등급 한글 라벨
    @Default(0) int completedContractCount, // 누적 계약 건수 (양측 서명 완료)
    @Default(0) int warrantyProvidedCount, // 보증 횟수 (판매자 보증 제공 + SIGNED 누적)
    @Default(0) int fraudReportReceivedCount, // 분쟁 횟수 (본인이 신고 당한 건 중 사기 확인 누적)

    @Default([]) List<DeviceTokenEntity> devices, // 기기 목록

    String? error,
  }) = _MyPageState;

  // 신원 인증 여부
  bool get userVerified =>
      ageGroup == AgeGroup.adult ||
      (ageGroup == AgeGroup.minor && guardianVerifiedAt != null);
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() => const MyPageState();

  /// 사용자 정보 + 신뢰 점수 + 기기 목록 + 차단 목록 불러오기 (성공 여부 반환)
  Future<bool> loadData() async {
    final results = await Future.wait([
      ref.read(userInfoRepositoryProvider).readUser(),
      ref.read(trustScoreRepositoryProvider).readTrustScore(),
      ref.read(deviceTokenRepositoryProvider).readDevices(),
      ref.read(blockViewModelProvider.notifier).readBlocks(),
    ]);

    final infoResult = results[0] as Result<UserInfoEntity>;
    final trustResult = results[1] as Result<TrustScoreEntity>;
    final deviceResult = results[2] as Result<List<DeviceTokenEntity>>;

    if (infoResult case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return false;
    }
    if (trustResult case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return false;
    }
    if (deviceResult case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return false;
    }

    final info = (infoResult as Success<UserInfoEntity>).data;
    final trust = (trustResult as Success<TrustScoreEntity>).data;
    final devices = (deviceResult as Success<List<DeviceTokenEntity>>).data;

    state = state.copyWith(
      publicCode: info.publicCode,
      email: info.email,
      status: info.status,
      ageGroup: info.ageGroup,
      guardianVerifiedAt: info.guardianVerifiedAt,
      name: info.name ?? '트라나',
      birthDate: info.birthDate,
      gender: info.gender,
      phone: info.phone,
      pushEnabled: info.pushEnabled,

      trustScore: trust.trustScore,
      trustGrade: trust.trustGrade,
      trustGradeLabel: trust.trustGradeLabel,
      completedContractCount: trust.completedContractCount,
      warrantyProvidedCount: trust.warrantyProvidedCount,
      fraudReportReceivedCount: trust.fraudReportReceivedCount,

      devices: devices,
    );
    return true;
  }

  /// 푸시 알림 토글 (성공 여부 반환)
  Future<bool> togglePushEnagled(bool v) async {
    final result = await ref
        .read(userPreferenceRepositoryProvider)
        .togglePushEnabled(v);

    state = switch (result) {
      Success(:final data) => state.copyWith(pushEnabled: data.pushEnabled),
      Failure(:final failure) => state.copyWith(error: failure.message),
    };

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
