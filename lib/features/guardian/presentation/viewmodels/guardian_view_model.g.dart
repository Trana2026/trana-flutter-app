// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 보호자 링크 발급 및 인증 완료 폴링 ViewModel

@ProviderFor(GuardianViewModel)
final guardianViewModelProvider = GuardianViewModelProvider._();

/// 보호자 링크 발급 및 인증 완료 폴링 ViewModel
final class GuardianViewModelProvider
    extends
        $NotifierProvider<GuardianViewModel, AsyncValue<GuardianLinkEntity?>> {
  /// 보호자 링크 발급 및 인증 완료 폴링 ViewModel
  GuardianViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guardianViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guardianViewModelHash();

  @$internal
  @override
  GuardianViewModel create() => GuardianViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<GuardianLinkEntity?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<GuardianLinkEntity?>>(
        value,
      ),
    );
  }
}

String _$guardianViewModelHash() => r'3ea59672ab9afa56452785f290d94f17eb5714ab';

/// 보호자 링크 발급 및 인증 완료 폴링 ViewModel

abstract class _$GuardianViewModel
    extends $Notifier<AsyncValue<GuardianLinkEntity?>> {
  AsyncValue<GuardianLinkEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<GuardianLinkEntity?>,
              AsyncValue<GuardianLinkEntity?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<GuardianLinkEntity?>,
                AsyncValue<GuardianLinkEntity?>
              >,
              AsyncValue<GuardianLinkEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
