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
