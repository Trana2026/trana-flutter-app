// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adult_kyc_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 성인 KYC 4단계 인증 흐름 ViewModel.
/// keepAlive 필수

@ProviderFor(AdultKycViewModel)
final adultKycViewModelProvider = AdultKycViewModelProvider._();

/// 성인 KYC 4단계 인증 흐름 ViewModel.
/// keepAlive 필수
final class AdultKycViewModelProvider
    extends $NotifierProvider<AdultKycViewModel, AdultKycState> {
  /// 성인 KYC 4단계 인증 흐름 ViewModel.
  /// keepAlive 필수
  AdultKycViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adultKycViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adultKycViewModelHash();

  @$internal
  @override
  AdultKycViewModel create() => AdultKycViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdultKycState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdultKycState>(value),
    );
  }
}

String _$adultKycViewModelHash() => r'e950b12da14e69f15826de915b0d2fca676b18c5';

/// 성인 KYC 4단계 인증 흐름 ViewModel.
/// keepAlive 필수

abstract class _$AdultKycViewModel extends $Notifier<AdultKycState> {
  AdultKycState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AdultKycState, AdultKycState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdultKycState, AdultKycState>,
              AdultKycState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
