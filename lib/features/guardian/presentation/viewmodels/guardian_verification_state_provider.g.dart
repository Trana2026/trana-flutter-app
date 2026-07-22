// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian_verification_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 보호자 인증 상태 파생. me(인증완료여부) + 저장된 링크(token/expiresAt)를 통해 상태 결정

@ProviderFor(guardianVerificationState)
final guardianVerificationStateProvider = GuardianVerificationStateProvider._();

/// 보호자 인증 상태 파생. me(인증완료여부) + 저장된 링크(token/expiresAt)를 통해 상태 결정

final class GuardianVerificationStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<GuardianVerificationState>,
          GuardianVerificationState,
          FutureOr<GuardianVerificationState>
        >
    with
        $FutureModifier<GuardianVerificationState>,
        $FutureProvider<GuardianVerificationState> {
  /// 보호자 인증 상태 파생. me(인증완료여부) + 저장된 링크(token/expiresAt)를 통해 상태 결정
  GuardianVerificationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guardianVerificationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guardianVerificationStateHash();

  @$internal
  @override
  $FutureProviderElement<GuardianVerificationState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GuardianVerificationState> create(Ref ref) {
    return guardianVerificationState(ref);
  }
}

String _$guardianVerificationStateHash() =>
    r'049c35dc1798a481373659a820173d3af0e5d915';

/// guardian 플래그 설정 여부. 대기 화면에서 '완료' 탭 시 invalidate되어 즉시 갱신됨

@ProviderFor(guardianBannerAcked)
final guardianBannerAckedProvider = GuardianBannerAckedProvider._();

/// guardian 플래그 설정 여부. 대기 화면에서 '완료' 탭 시 invalidate되어 즉시 갱신됨

final class GuardianBannerAckedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// guardian 플래그 설정 여부. 대기 화면에서 '완료' 탭 시 invalidate되어 즉시 갱신됨
  GuardianBannerAckedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guardianBannerAckedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guardianBannerAckedHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return guardianBannerAcked(ref);
  }
}

String _$guardianBannerAckedHash() =>
    r'f26809dd01dd5af808649c2598ff9f5b51518cc9';
